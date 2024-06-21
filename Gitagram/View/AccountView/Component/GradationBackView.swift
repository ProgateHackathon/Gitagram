//
//  GradationBackView.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
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
//グラデーション

struct BackTypeTwoView: View {
    var body: some View {
        Color.BackBlueblackColor
    }
}
#Preview{
    BackTypeTwoView()
}
