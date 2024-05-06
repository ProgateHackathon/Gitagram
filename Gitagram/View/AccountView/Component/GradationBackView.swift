//
//  GradationBackView.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
//

import Foundation
import SwiftUI

struct GradationBackView: View {
    let gradient = Gradient(stops: [.init(color: Color(red: 0.3, green: 0.0, blue: 0.8), location: 0.0), .init(color: Color(red: 0.8, green: 0.0, blue: 0.3), location: 1.2)])
    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
