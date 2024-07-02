//
//  ImageCloudView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/23.
//

import SwiftUI

struct ImageCloudView: View {
    var body: some View {
        Image("CardImage_Cloud")
            .resizable()
            .frame(width: 180,height: 120)
            .padding(.top ,300)
            .padding(.trailing,190)
    }
}

#Preview {
    AccountCardTypeThreeView(developer: Developer(githubId: "Rino1011"))
}
