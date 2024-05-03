//
//  AccountQRView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/03.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct AccountFrameView: View {
    private static let cardCornerRadius: CGFloat = 20
    private static let cardSize: CGSize = .init(width: 367, height: 512)
    //カードの大きさ
    @State private var github = "https://github.com/"
    @State private var githubtext = ""
    @State private var alltext = ""
    
    @State private var developer = Developer(githubId: "unknown")
    //QRコードのためのURL作成
    
    var body: some View {
        ZStack {
            AccountView()
            RoundedRectangle(cornerRadius: Self.cardCornerRadius)
                .stroke(.white, lineWidth: 1)
        }
        .frame(width: Self.cardSize.width, height: Self.cardSize.height)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 20)
        .padding(50)
        HStack{
            Spacer()
            TextField("ユーザーID", text: $githubtext, onEditingChanged: { _ in
                self.alltext = self.github + self.githubtext
            })
        }
        Text(alltext)
        Button("Take Screenshot") {
            TakeScreenshot()
        }
        .padding()
    }
}


struct AccountView: View {
    
    @StateObject var viewmodel = AccountViewModel()
    
    var body: some View {
        ZStack {
            Image("kirakira")
            //左に傾ける
                .resizable()
                .ignoresSafeArea()
                .cornerRadius(20)
            Image("middle")
            //真ん中
                .resizable()
                .ignoresSafeArea()
                .opacity(viewmodel.middleImageOpacity)
                .cornerRadius(20)
            Image("kirakira")
            //右に傾ける
                .resizable()
                .ignoresSafeArea()
                .opacity(viewmodel.frontImageOpacitry)
                .cornerRadius(20)
        }
    }
}


#Preview {
    AccountFrameView()
}
