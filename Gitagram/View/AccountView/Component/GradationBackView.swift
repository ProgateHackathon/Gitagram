//
//  GradationBackView.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
//

import Foundation
import SwiftUI

struct GradationBackView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.BackPurpleColor,Color.BackPinkColor]),
            startPoint: .init(x: 0.5, y: 0.5),
            endPoint: .init(x: 0.7, y: 0.7)
        )
    }
}


extension Color {
    static let FramePinkColor = Color("FramePinkColor")
    static let BackPurpleColor = Color("BackPurpleColor")
    static let BackPinkColor = Color("BackPinkColor")
    static let TextPurpleColor = Color("TextPurpleColor")
    static let TextFrameBrownColor = Color("TextFrameBrownColor")
}

#Preview {
    GradationBackView()
}
