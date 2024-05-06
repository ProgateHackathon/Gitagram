//
//  Content.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

import SwiftUI

struct ContentView: View {
    @State private var developer: Developer? = nil
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else {
                if let host = developer {
                    HomeView(hostDeveloper: host)
                } else {
                    InputFormView(developer: $developer)
                }
            }
        }
        .onAppear {
            Task {
                developer = await GetLoginDeveloperUseCase().execute()
                isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
