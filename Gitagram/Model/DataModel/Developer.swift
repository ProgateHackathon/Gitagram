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
    let gitHubURL: String
    let imagePath: String
        
    init(id: DeveloperID, name: String, gitHubURL: String, imagePath: String) {
        self.id = id
        self.name = name
        self.gitHubURL = gitHubURL
        self.imagePath = imagePath
    }
    
    init(name: String, gitHubURL: String, imagePath: String) {
        self.id = DeveloperID(id: UUID())
        self.name = name
        self.gitHubURL = gitHubURL
        self.imagePath = imagePath
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
        case link
        case imagePath
    }
    
    func encode(to encoder: any Encoder) throws {
        do {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id.id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(gitHubURL, forKey: .link)
            try container.encode(imagePath, forKey: .imagePath)
        } catch {
            print("エンコードできん...!! : \(error)")
            throw error
        }
    }
}
