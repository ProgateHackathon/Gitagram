//
//  BackTypeThreeView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/26.
//

import Foundation
import SwiftUI

struct BackTypeThreeView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.BackLightPurpleColor,Color.BackLightPinkColor]),
            startPoint: .init(x: 0.5, y: 0.5),
            endPoint: .init(x: 0.7, y: 0.7)
        )
    }
}
