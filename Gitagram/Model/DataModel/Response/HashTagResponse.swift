//
//  HashTagResponse.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/20.
//

import Foundation

struct HashTagResponse : Identifiable, Codable {
    let id: UUID
    let name: String
    let color: String
        
    init(from hashTag: HashTag) {
        self.id = hashTag.id.toUUID
        self.name = hashTag.name
        self.color = hashTag.color
    }
    
    func toHashTag() -> HashTag {
        return HashTag(id: HashTag.HashTagID(id: id), name: name, color: color)
    }
}
