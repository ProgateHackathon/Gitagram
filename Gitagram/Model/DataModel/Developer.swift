//
//  Developer.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/04/30.
//

import Foundation

struct Developer : Identifiable {
    typealias DeveloperID = Developer.ID
    
    let id: DeveloperID
    let name: String
    var gitHubURL: String {
        "https://github.com/\(name)"
    }
    var imageURL: String {
        gitHubURL + ".png"
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

extension Developer : Encodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    func encode(to encoder: any Encoder) throws {
        do {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id.id, forKey: .id)
            try container.encode(name, forKey: .name)
        } catch {
            print("エンコードできん...!! : \(error)")
            throw error
        }
    }
}
