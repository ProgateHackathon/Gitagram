//
//  FrankfrtText.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/07/13.
//

import SwiftUI

struct FrankfrtText: View {
    let inputText: String
    
    var body: some View {
        Text(" @\(inputText)")
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .foregroundColor(Color("TextPurpleColor"))
            .underline()
            .stroke(color: .white, width: 3)
            .stroke(color: .TextFrameBrownColor, width: 2)
            .rotationEffect(.degrees(-2))
            .font(.custom("Frankfurt", size: 65))
            .padding(.bottom, 250)
            .padding(.top, 0)
    }
}
