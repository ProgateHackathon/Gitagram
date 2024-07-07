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
    @Binding var isShowAlert: Bool
    let cardData: CardData
    @State private var randomFloat: Float = Float.random(in: -0.5..<0.5)
    
    
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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(cardData.product.hashTags, id: \.self) { hashTag in
                            HashTagView(hashTag: hashTag)
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 15)
                }
                .frame(maxHeight: 40)
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
        .rotationEffect(.degrees(Double(randomFloat)), anchor: .center)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy,value: xoffset)
        .gesture(
            DragGesture()
                .onChanged(onDragchanged)
                .onEnded(onDragEnded)
        )
        .onChange(of: randomFloat){
            print(randomFloat)
        }
        .onAppear(){
            randomFloat =  Float.random(in: -4..<4)
        }
        
        
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
    private func regenerateRandomFloat() {
        randomFloat = Float.random(in: -4..<4)
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
        if url != ""{
            openURL((URL(string: url))!)
        }else{
            isShowAlert = true
        }
        
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

