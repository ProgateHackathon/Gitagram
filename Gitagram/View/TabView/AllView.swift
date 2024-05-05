//
//  AllView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

import SwiftUI

struct AllView: View {
    var body: some View {
        TabView{
            PageOneView() //1枚目の子ビュー
                .tabItem {
                    Image(systemName: "1.circle.fill") //タブバーの①
                }
            PageTwoView() //2枚目の子ビュー
                .tabItem {
                    Image(systemName: "2.circle.fill") //タブバーの②
                }
        }
    }
} // View

struct PageOneView:View {
    var body: some View {
        MatchingView()
    }
}

struct PageTwoView:View {
    var body: some View {
        OneAccountFrameView(inputText: "", QRImage: UIImage())
    }
}

#Preview {
    AllView()
}
