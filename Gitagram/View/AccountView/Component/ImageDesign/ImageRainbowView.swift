//
//  ImageRainbowView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/23.
//

import SwiftUI

struct ImageRainbowView: View {
    var body: some View {
        Image("CardImage_Rainbow")
            .resizable()
            .frame(width: 200,height: 150)
            .padding(.bottom ,250)
            .padding(.leading,120)
    }
}

#Preview {
    AccountCardTypeThreeView(developer: Developer(githubId: "Rino1011"))
}
