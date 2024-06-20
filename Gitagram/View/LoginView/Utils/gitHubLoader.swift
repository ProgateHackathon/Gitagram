//
//  gitHubLoader.swift
//  Gitagram
//
//  Created by saki on 2024/06/21.
//
import Foundation
import FirebaseAuth

class GitHubLoader: ObservableObject {
    func fetchGitHubUsername(accessToken: String, completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://api.github.com/user")!
        var request = URLRequest(url: url)
        request.setValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            if let userDict = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let username = userDict["login"] as? String {
                completion(username)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
