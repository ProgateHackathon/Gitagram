//
//  LoginView.swift
//  Gitagram
//
//  Created by saki on 2024/06/18.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var isUserLoggedIn = Auth.auth().currentUser != nil
    var body: some View {
        if isUserLoggedIn {
            ContentView()
        }else{
            ZStack{
                
                Image("rainbow")
                    .resizable()
                    .frame(width: 103,height: 70)
                    .position(x: 330,y: 280)
                Image("cloud2")
                    .resizable()
                    .frame(width: 110,height: 50)
                    
                    .position(x: 70,y: 360)
                Image("heart")
                    .resizable()
                    .frame(width: 60,height: 60)
                    .position(x: 260,y: 270)
                
                VStack{
                    Text("Gitagram")
                        .font(.custom("Shrikhand-Regular", size: 60))
                    Text("へようこそ！")
                        .font(.title2)
                        .padding(.bottom,60)
                    Button(action: {
                        viewModel.performOAuthLoginFlow()
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
    }
    
    
}

#Preview {
    LoginView()
}
