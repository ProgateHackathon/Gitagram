//
//  CardView.swift
//  Gitagram
//
//  Created by saki on 2024/05/02.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    @State private var xoffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            //仮のサンプル画像
         
            ZStack(alignment: .top) {
             
                    
                Image(model.user.profileImageURLs)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth,height: SizeConstants.cardHeight)
                
                   
                SwipeActionIndicatorView(xofset: $xoffset)
                   
            }
                
            
           
        }
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
        xoffset  = 500
        degrees = 12
    viewModel.removeCard(model)
    }
    func swipeLeft(){
        xoffset  = -500
        degrees = -12
        viewModel.removeCard(model)
    }
}

private extension CardView{
    var user: User{
        return model.user
    }
    var imageCount: Int{
        return user.profileImageURLs.count
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
    CardView(viewModel: CardViewModel(service: CardService()), model: CardModel(user: MockData.users[1]))
}
