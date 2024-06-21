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


#Preview {
    //CoolText(inputText: "Rino1011")
    AccountCardTypeTwoView(developer: Developer(githubId: "Rino1011"))
}

