//
//  Content.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
        @State private var developer: Developer? = nil

        var body: some View {
            VStack {
                if developer == nil {
                    InputFormView(developer: $developer)
                } else {
                    AllView(hostDeveloper: developer!)
                }
            }
        }
}

#Preview {
    ContentView()
}
