//
//  HashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/05/15.
//

import SwiftUI
struct PostHashTagView: View {
    @Binding var tagWord: String
    @Binding var StringColor : String//16新数のcolorのstring
    @State var color = UIColor(ciColor: .red)
    var body: some View {
        HStack{
            Text("#")
            Text(tagWord)
        }
       
        .frame(height: 18)
        .padding(4)
        .padding(.horizontal, 5)
        .minimumScaleFactor(0.2)
        .background(Color( UIColor(hex: StringColor) ?? UIColor(hex: "#FFFFFF")!).gradient)
        .cornerRadius(50)
        .onAppear {
            //ここでハッシュタグモデルから色を持ってきて代入する、一旦ランダム
            //変換
     
        }
    }
     
    
}

#Preview {
    HashTagView()
}
