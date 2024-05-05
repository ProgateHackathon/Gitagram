//
//  InputFormView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/04.
//

import SwiftUI

struct InputFormView: View {
    @State private var inputText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .padding(.top,100)
                HStack {
                    Spacer()
                    TextField("GitHubIDを入力してください", text: $inputText)
                        .padding(.bottom, 10)
                        .frame(width: 280) // 幅を設定
                        .textFieldStyle(UnderlineTextFieldStyle()) // カスタムのテキストフィールドスタイルを適用
                    Spacer().frame(width: 70) // さらに左に移動するための余白
                }
                .padding(.bottom,300)
                NavigationLink(destination: OneAccountFrameView(inputText: inputText, QRImage: UIImage())) {
                    Text("次へ")
                        .bold()
                        .padding()
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                Spacer()
            }
        }
    }
}

// 下線を持つカスタムテキストフィールドスタイル
struct UnderlineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading) {
            configuration
                .padding(.vertical, 8)
                .padding(.horizontal)
                .overlay(Rectangle().frame(height: 1).padding(.top, 35))
        }
    }
}



#Preview {
    InputFormView()
}
