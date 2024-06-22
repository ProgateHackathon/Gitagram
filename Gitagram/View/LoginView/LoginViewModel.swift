//
//  LoginViewModel.swift
//  Gitagram
//
//  Created by saki on 2024/06/19.
//

import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    var gitHubLoader = GitHubLoader()
    @State var provider = OAuthProvider(providerID: "github.com")
    
    
    func performOAuthLoginFlow() {
        provider.scopes = ["repo", "read:user"]
        
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
            if let accessToken = result?.credential as? OAuthCredential {
                
                self.gitHubLoader.fetchGitHubUsername(accessToken: accessToken.accessToken!) { username in
                    if let username = username {
                        print("GitHubのユーザー名: \(username)")
                        Task{
                            await CreateDeveloperUseCase().execute(githubId: username)
                            
                        }
                    
                    }
                }
            }
        }
    }
    
}
