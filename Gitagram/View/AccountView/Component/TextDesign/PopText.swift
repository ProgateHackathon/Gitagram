//
//  PopText.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/26.
//
import SwiftUI

struct PopText: View {
    let inputText: String
    
    var body: some View {
        Text(" @\(inputText)")
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .foregroundColor(Color("TextLightPurpleColor"))
            .stroke(color: .black, width: 0.6)
            .stroke(color: .white.opacity(0.5), width: 4)
            .rotationEffect(.degrees(4))
            .font(.custom("ArialCEMTBlack-Regular", size: 70))
            .padding(.bottom, 240)
            .padding(.top, 0)
            .padding(.leading,10)
    }
}

#Preview {
    AccountCardTypeThreeView(developer: Developer(githubId: "Urassh"))
}
