//
//  CardView.swift
//  Gitagram
//
//  Created by saki on 2024/05/02.
//

import SwiftUI

struct CardView: View {
    @State private var xoffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            //仮のサンプル画像
         
            ZStack(alignment: .top) {
             
                    
                Image("sampleImage")
                    .resizable()
                    .scaledToFill()
                
                   
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
    func onDragchanged(_ value:  _ChangedGesture<DragGesture>.Value){
        xoffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value:  _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutof){
            xoffset = 0
            degrees = 0
        }
    }
}



#Preview {
    CardView()
}
