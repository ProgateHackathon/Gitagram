//
//  HashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/05/15.
//

import SwiftUI
struct PostHashTagView: View {
    
    @Binding var tagWord: String
    var body: some View {
        HStack{
            Text("#")
            Text(tagWord)
        }
       
        .frame(height: 18)
        .padding(4)
        .padding(.horizontal, 5)
        .minimumScaleFactor(0.2)
        .background(Color(red: CGFloat.random(in: 0.7...1), green: CGFloat.random(in: 0.7...1), blue: CGFloat.random(in: 0.7...1)).gradient)
        .cornerRadius(50)
    }
    
}

#Preview {
    HashTagView()
}
