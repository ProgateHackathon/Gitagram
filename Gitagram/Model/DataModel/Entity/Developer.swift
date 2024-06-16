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
    var imageURL: URL? {
        URL(string: gitHubURL + ".png")
    }
        
    init(id: DeveloperID, githubId name: String) {
        self.id = id
        self.name = name
    }
    
    init(githubId name: String) {
        self.id = DeveloperID(id: UUID())
        self.name = name
    }
    
    static func Empty() -> Self {
        Self(id: DeveloperID.Empty(), githubId: "")
    }
    
    func isEmpty() -> Bool {
        id.isEmpty() && gitHubURL == ""
    }
    
    struct ID : Identifiable, Hashable, Codable {
        let id: UUID
        
        var toUUID: UUID {
            id
        }
        
        var toString: String {
            return id.uuidString
        }
        
        init(id uuid: UUID) {
            self.id = uuid
        }
        
        static func Empty() -> Self {
            return Product.ID(id: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!)
        }
        
        func isEmpty() -> Bool {
            return id.uuidString == "00000000-0000-0000-0000-000000000000"
        }
    }
}
