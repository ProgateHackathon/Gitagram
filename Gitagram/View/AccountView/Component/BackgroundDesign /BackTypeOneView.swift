//
//  BackTypeOneView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/07/13.
//

import Foundation
import SwiftUI

struct BackTypeOneView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.BackPurpleColor,Color.BackPinkColor]),
            startPoint: .init(x: 0.5, y: 0.5),
            endPoint: .init(x: 0.7, y: 0.7)
        )
    }
}
