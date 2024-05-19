//
//  DeveloperResponse.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/19.
//

import Foundation

struct DeveloperResponse : Identifiable, Codable {
    let id: UUID
    let name: String
        
    init(from developer: Developer) {
        self.id = developer.id.toUUID
        self.name = developer.name
    }
}
