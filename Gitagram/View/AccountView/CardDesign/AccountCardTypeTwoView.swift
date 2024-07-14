//
//  AccountCardTypeTwoView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/22.
//

import SwiftUI

struct AccountCardTypeTwoView: View {
    private static let cardCornerRadius: CGFloat = 20
    private static let cardSize: CGSize = .init(width: 360, height: 480)
    private let viewModel = AccountViewModel()
    
    @State private var isSharing: Bool = false
    @State var developer: Developer
    var body: some View {
        ZStack {
            ZStack {
                KiraKiraTypeTwoView()
                RoundedRectangle(cornerRadius: Self.cardCornerRadius)
                    .stroke(Color.white, lineWidth: 0)
            }
            .frame(width: Self.cardSize.width, height: Self.cardSize.height)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
            
            QRTypeTwoView(inputText: developer.gitHubURL)
                .padding()
            HStack{
                Spacer()
                    .frame(width: 10)
                NeonText(inputText: developer.name)
                Spacer()
                    .frame(width: 15)
            }
            ImageHeartView()
        }
        .padding()
        .frame(width: 370,height: 490)
        .background(Color.white)
        .cornerRadius(20)
    }
}
