//
//  CardView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

enum SwipeAction {
    case reject
    case like
}

struct CardView: View {
    @ObservedObject var viewModel: MatchingViewModel
    @State private var xoffset: CGFloat = 0
    @State private var degrees: Double = 0
    @Environment(\.openURL) var openURL
    let cardData: CardDataModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top) {
                Image(uiImage: cardData.productImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth,height: SizeConstants.cardHeight)
                
                SwipeActionIndicatorView(xofset: $xoffset)
            }
            VStack(alignment: .leading){
                
                UserInfoView(cardData: cardData)
                HStack(){
                    HashTagView()
                }
                .padding(.leading, 15)
                .padding(.bottom, 15)
                .frame(alignment: .leading)
            }
            .background(
                LinearGradient(colors: [.clear,.black], startPoint: .top , endPoint: .bottom)
            )
            
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth,height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xoffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy,value: xoffset)
        .gesture(
            DragGesture()
                .onChanged(onDragchanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    func returnToCenter(){
        xoffset = 0
        degrees = 0
    }
    func swipeRight(){
        withAnimation {
            xoffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(cardData.product)
            openLink(url: cardData.product.url)
        }
    }
    
    func swipeLeft(){
        withAnimation {
            xoffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(cardData.product)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction? ){
        guard let action else { return }
        guard let topProductCardID = viewModel.getLastRepository()?.product.id else { return }
        
        if topProductCardID == cardData.product.id {
            switch action {
            case.reject:
                swipeLeft()
                
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView{
    
    func openLink(url: String){
        openURL(URL(string: url)!)
    }
    func onDragchanged(_ value:  _ChangedGesture<DragGesture>.Value) {
        xoffset = value.translation.width
        degrees = Double(value.translation.width / 25)
        
    }
    
    func onDragEnded(_ value:  _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        let isRightSwipe = width >= SizeConstants.screenCutof
        
        if abs(width) <= abs(SizeConstants.screenCutof) {
            returnToCenter()
        }
        
        isRightSwipe ? swipeRight() : swipeLeft()
    }
}

