//
//  NeonText.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/22.
//

import SwiftUI

struct NeonText: View {
    let inputText: String
    
    var body: some View {
        Text(" @\(inputText)")
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .kerning(2)
            .foregroundColor(Color(.white))
            .stroke(color: .TextPinkColor, width: 1)
            .rotationEffect(.degrees(4))
            .font(.custom("LearningCurveAltG", size: 80))
            .fontWeight(.bold)
            .padding(.bottom, 0)
            .padding(.top, 240)
            .shadow(color: Color.TextPinkColor, radius: 3, x: 0, y: 0)
            .shadow(color: Color.TextPinkColor, radius: 2, x: 0, y: 0)
            .shadow(color: Color.TextPinkColor.opacity(0.6), radius: 10, x: 0, y: 0)
    }
}
