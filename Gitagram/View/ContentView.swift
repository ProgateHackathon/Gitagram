//
//  Content.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

import SwiftUI
import Lottie
import FirebaseAuth

struct ContentView: View {
    @State private var developer: Developer? = nil
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            if isLoading {
                LottieView(filename: "LottieProgress")
                    .frame(width: 400,height: 400)
            } else{
                if developer != nil{
                    HomeView(hostDeveloper:developer!)
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
