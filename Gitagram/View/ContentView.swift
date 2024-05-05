//
//  Content.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
        @State private var develop: Developer? = nil // Developer? に変更

        var body: some View {
            VStack {
                if develop == nil {
                    InputFormView(developer: $develop)
                } else {
                    AllView(hostDeveloper: develop!)
                }
            }
        }
}

#Preview {
    ContentView()
}
