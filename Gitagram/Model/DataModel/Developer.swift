//
//  Developer.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/04/30.
//

import Foundation

struct Developer : Identifiable, Codable {
    typealias DeveloperID = Developer.ID
    
    let id: DeveloperID
    let name: String
    var gitHubURL: String {
        "https://github.com/\(name)"
    }
    var imageURL: URL {
        URL(gitHubURL + ".png")
    }
        
    init(id: DeveloperID, githubId name: String) {
        self.id = id
        self.name = name
    }
    
    init(githubId name: String) {
        self.id = DeveloperID(id: UUID())
        self.name = name
    }
    
    struct ID : Identifiable, Hashable, Codable {
        let id: UUID
        
        var toString: String {
            return id.uuidString
        }
        
        init(id uuid: UUID) {
            self.id = uuid
        }
    }
}
