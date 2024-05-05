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
        NavigationView{
            VStack {
                TextField("ここに文字を入力", text: $inputText)
                Text("GithubID:\(inputText)")
                QRView(inputText: $inputText) // QRView を利用し、inputText をバインディングとして渡す
                NavigationLink(destination: OneAccountFrameView(inputText: "", QRImage: UIImage())) { // ⬅︎
                    Text("オレンジ") // リンクのデザインを指定
                } // NavigationLink
            }
        }
    }
}

