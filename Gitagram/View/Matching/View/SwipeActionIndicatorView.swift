//
//  SwipeActionIndicatorView.swift
//  Gitagram
//
//  Created by saki on 2024/05/03.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    @Binding var xofset: CGFloat
   
    var body: some View {
        HStack{
             Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100,height: 48)
                }
                .rotationEffect(.degrees(-45))
                .opacity(xofset / SizeConstants.screenCutof)
            
            
            Spacer()
            Text("NOPE")
               .font(.title)
               .fontWeight(.heavy)
               .foregroundColor(.red)
               .overlay {
                   RoundedRectangle(cornerRadius: 4)
                       .stroke(.red, lineWidth: 2)
                       .frame(width: 100,height: 48)
               }
               .rotationEffect(.degrees(45))
               .opacity(Double(xofset / SizeConstants.screenCutof) * -1)
        }
        .padding(.top, 70)
        .padding(.leading, 50)
        .padding(.trailing, 50)
    }
}

#Preview {
    SwipeActionIndicatorView(xofset: .constant(20) )
}
