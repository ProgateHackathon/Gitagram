//
//  Content.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @State private var developer: Developer? = nil
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            if isLoading {
                LottieView(filename: "LottieProgress")
                    .frame(width: 400,height: 400)
            } else {
              
                HomeView(hostDeveloper:developer!)
               
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
