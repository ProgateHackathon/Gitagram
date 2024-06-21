//
//  ImageHeartView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/22.
//

import SwiftUI

struct ImageHeartView: View {
    var body: some View {
        Image("CardImage_Heart")
            .resizable()
            .frame(width: 130,height: 130)
            .padding(.bottom ,190)
            .padding(.leading,200)
    }
}

#Preview {
    ImageHeartView()
}
