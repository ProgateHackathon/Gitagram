//
//  LoginView.swift
//  Gitagram
//
//  Created by saki on 2024/06/18.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    var provider = OAuthProvider(providerID: "github.com")
    @State private var oauthProvider: OAuthProvider!
   
    
    var body: some View {
        VStack{
            Text("Gitagram")
                .font(.custom("Shrikhand-Regular", size: 60))
            Text("へようこそ！")
                .font(.title2)
                .padding(.bottom,60)
            Button(action: {
                performOAuthLoginFlow(provider: AuthProvider(rawValue: "GitHub")! )
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
    
    private func performOAuthLoginFlow(provider: AuthProvider) {
      oauthProvider = OAuthProvider(providerID: provider.id)
       oauthProvider.getCredentialWith(nil) { credential, error in
         guard error == nil else { 
             return print(error as Any) }
         guard let credential = credential else { return }
         self.signin(with: credential)
       }
     }
    private func signin(with credential: AuthCredential) {
       Auth.auth().signIn(with: credential) { result, error in
         guard error == nil else {
             return print(error as Any)
         }
         print("ログインできたよ！")
       }
     }
}

#Preview {
    LoginView()
}

enum AuthProvider: String {
    case gitHub = "github.com"
    var id: String { rawValue }

      /// The UI friendly name of the `AuthProvider`. Used for display.
    var name: String {
        switch self {
        case .gitHub:
            return "GitHub"
        }
    }
    init?(rawValue: String) {
        switch rawValue {
        case "GitHub":
            self = .gitHub
        default: return nil
        }
    }
}

