//
//  HashTag.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/16.
//

import Foundation

struct HashTag : Identifiable, Hashable {
    typealias HashTagID = HashTag.ID
    
    var id : HashTagID
    var name : String
    var color : String
    
    init(name: String, color: String) {
        self.id = HashTagID(id: UUID())
        self.name = name
        self.color = color
    }
    
    init(id: HashTagID, name: String, color: String) {
        self.id = id
        self.name = name
        self.color = color
    }
    
    static func Empty() -> Self {
        Self(name: "", color: "")
    }
    
    func isEmpty() -> Bool {
        name == "" && color == ""
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
            return Self(id: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!)
        }
        
        func isEmpty() -> Bool {
            return id.uuidString == "00000000-0000-0000-0000-000000000000"
        }
    }
}
