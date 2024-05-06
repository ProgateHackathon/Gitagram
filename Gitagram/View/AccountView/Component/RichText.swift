//
//  RichText.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
//

import SwiftUI

struct RichText: View {
    let inputText: String
    
    var body: some View {
        Text("@\(inputText)")
            .foregroundColor(Color(red: 0.5, green: 0.0, blue: 1.0))
            .underline()
            .stroke(color: .white, width: 3)
            .font(.custom("Frankfurt", size: 40))
            .rotationEffect(.degrees(0))
            .padding(.bottom, 10)
            .padding(.top, 350)
    }
}
