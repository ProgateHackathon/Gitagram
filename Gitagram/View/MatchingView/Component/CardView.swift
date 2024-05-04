//
//  CardView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: MatchingViewModel
    @State private var xoffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    let model: CardDataModel
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            ZStack(alignment: .top) {
                Image(model.user.profileImageURLs)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth,height: SizeConstants.cardHeight)
                SwipeActionIndicatorView(xofset: $xoffset)
            }
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
private extension CardView{
    
    func returnToCenter(){
        xoffset = 0
        degrees = 0
    }
    func swipeRight(){
        withAnimation{
            xoffset  = 500
            degrees = 12
        }completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft(){
        withAnimation{
            xoffset  = -500
            degrees = -12
            
        }completion: {
            viewModel.removeCard(model)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction? ){
        guard let action else{
            return
        }
        
        let topCard = viewModel.cardModels.last
        if topCard == model{
            
            switch action{
            case.reject:
                swipeLeft()
                
            case .like:
                swipeRight()
                
            }
        }
    }
}


private extension CardView{
    func onDragchanged(_ value:  _ChangedGesture<DragGesture>.Value){
        
        xoffset = value.translation.width
        degrees = Double(value.translation.width / 25)
        
    }
    
    func onDragEnded(_ value:  _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutof){
            
            returnToCenter()
        }
        if width >= SizeConstants.screenCutof{
            swipeRight()
        }else{
            swipeLeft()
        }
        
    }
    
}
#Preview {
    CardView(viewModel: MatchingViewModel(service: CardService()), model: CardDataModel(user: MockData.users[1]))
}
