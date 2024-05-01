//
//  Developer.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/04/30.
//

import Foundation

struct Developer : Identifiable {
    let id: UUID
    let name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
