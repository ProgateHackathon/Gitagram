//
//  CardView.swift
//  Gitagram
//
//  Created by saki on 2024/05/02.
//

import SwiftUI

struct CardView: View {
    @State private var xoffset: CGFloat = 0
    @State private var yoffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            //仮のサンプル画像
            Rectangle()
               
            Image("sampleImage")
                .resizable()
                .scaledToFill()
               
        }
        .frame(width: cardWidth,height: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xoffset,y: yoffset)
        .rotationEffect(.degrees(degrees))
        .gesture(
            DragGesture()
                .onChanged({ value in
                    withAnimation(.snappy){
                        xoffset = value.translation.width
                        degrees = Double(value.translation.width / 25)
                        yoffset = value.translation.height
                    }
                })
        )
    }
}

private extension CardView{
    private var cardWidth: CGFloat{
        UIScreen.main.bounds.width - 20
    }
    private var cardHeight: CGFloat{
        UIScreen.main.bounds.height/1.45
    }
}

#Preview {
    CardView()
}
