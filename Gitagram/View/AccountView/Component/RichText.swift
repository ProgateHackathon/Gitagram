//
//  RichText.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
//

import SwiftUI

struct FrankfrtText: View {
    let inputText: String
    
    var body: some View {
        Text("@\(inputText)")
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
struct CoolText: View {
    let inputText: String
    var body: some View {
        Text("@\(inputText)")
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

#Preview {
    //CoolText(inputText: "Rino1011")
    AccountCardTypeTwoView(developer: Developer(githubId: "Rino1011"))
}

