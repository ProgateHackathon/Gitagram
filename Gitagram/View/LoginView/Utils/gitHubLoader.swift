//
//  gitHubLoader.swift
//  Gitagram
//
//  Created by saki on 2024/06/21.
//
import Foundation
import FirebaseAuth
import Combine

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
    
    func fetchData(username: String) {
        
        let url = URL(string: "https://api.github.com/users/\(username)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("エラーが発生しました: \(error?.localizedDescription ?? "データがない")")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let reposArray = json?["repos"] as? [[String: Any]] {
                    for repo in reposArray {
                        if let repoName = repo["name"] as? String {
                            print(repoName)
                        }
                    }
                }
            } catch let error as NSError {
                print("JSONデータの解析に失敗しました: \(error.localizedDescription)")
            }
            
        }
        task.resume()
        
    }
}


struct Repository: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String?
    let html_url: String
}

class GitHubService {
    func fetchRepositories(for user: String) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "https://api.github.com/users/\(user)/repos")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Repository].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var errorMessage: String? = nil
    
    private var cancellable: AnyCancellable?
    private let gitHubService = GitHubService()
    
    func fetchRepositories(for user: String) {
        cancellable = gitHubService.fetchRepositories(for: user)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { repositories in
                self.repositories = repositories
            })
    }
}
