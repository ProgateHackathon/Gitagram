//
//  hashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/05/14.
//

import SwiftUI

struct HashTagView: View {
    let hashTag :HashTag
    
    var color: UIColor {
        UIColor(hex: hashTag.color) ?? UIColor.white
    }
    
    var body: some View {
        HStack{
            Text("#")
            Text(hashTag.name)
        }
        .padding(4)
        .padding(.horizontal, 5)
        .background(Color(uiColor: color))
        .cornerRadius(50)
    }
}

#Preview {
    HashTagView(hashTag: .Empty())
}
