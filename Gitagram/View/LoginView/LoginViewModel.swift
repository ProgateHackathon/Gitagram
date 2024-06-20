//
//  LoginViewModel.swift
//  Gitagram
//
//  Created by saki on 2024/06/19.
//

import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @State var provider = OAuthProvider(providerID: "github.com")
    func performOAuthLoginFlow() {
        
        provider.getCredentialWith(nil) { credential, error in
            guard error == nil else {
                return print(error as Any) }
            guard let credential = credential else { return }
            self.signin(with: credential)
        }
    }
    func signin(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else {
                return print(error as Any)
            }
            print("ログインできたよ！")
        }
    }
}
