//
//  DeveloperResponse.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/19.
//

import Foundation

struct DeveloperResponse: Identifiable, Codable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    init(from developer: Developer) {
        self.id = developer.id.id
        self.name = developer.name
    }
    
    func toDeveloper() -> Developer {
        return Developer(id: Developer.DeveloperID(id: id), githubId: name)
    }
}
