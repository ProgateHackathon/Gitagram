//
//  LoginView.swift
//  Gitagram
//
//  Created by saki on 2024/06/18.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    private let viewModel = LoginViewModel()
    var body: some View {
        VStack{
            Text("Gitagram")
                .font(.custom("Shrikhand-Regular", size: 60))
            Text("へようこそ！")
                .font(.title2)
                .padding(.bottom,60)
            Button(action: {
                viewModel.performOAuthLoginFlow(provider: AuthProvider(rawValue: "GitHub")! )
            }, label: {
                HStack{
                    Image("github-mark-white")
                        .resizable()
                        .frame(width: 20,height: 20)
                    Text("githubログイン")
                        .foregroundStyle(Color.white)
                }
                .padding(6)
                .padding(.horizontal,3)
                .background(Color(red: 0.141, green: 0.16, blue: 0.180))
                .cornerRadius(12)
                
            })
            
        }
    }
    
    
}

#Preview {
    LoginView()
}
