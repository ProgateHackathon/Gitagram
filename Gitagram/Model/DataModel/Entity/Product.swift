//
//  Product.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

struct Product : Identifiable {
    typealias ProductID = Product.ID
    typealias DeveloperID = Developer.DeveloperID
    
    let id: ProductID
    let title: String
    let content: String
    let developerId: DeveloperID
    let url: String
    let hashTags: [HashTag]
    
    //既にIDが生成されている場合のイニシャライザ
    init(id: ProductID, title: String, content: String, developerId: DeveloperID, url: String, hashTags: [HashTag]) {
        self.id = id
        self.title = title
        self.content = content
        self.developerId = developerId
        self.url = url
        self.hashTags = hashTags
    }
    
    //新規Productのイニシャライザ
    init(title: String, content: String, developerId: DeveloperID, url: String, hashTags: [HashTag]) {
        self.id = ProductID(id: UUID())
        self.title = title
        self.content = content
        self.developerId = developerId
        self.url = url
        self.hashTags = hashTags
    }
    
    func setTitle(from title: String) -> Self {
        Self(id: id, title: title, content: content, developerId: developerId, url: url, hashTags: hashTags)
    }
    
    func setContent(from content: String) -> Self {
        Self(id: id, title: title, content: content, developerId: developerId, url: url, hashTags: hashTags)
    }
    
    func setURL(from url: String) -> Self {
        Self(id: id, title: title, content: content, developerId: developerId, url: url, hashTags: hashTags)
    }
    
    func setHashTag(from hashTags: [HashTag]) -> Self {
        Self(id: id, title: title, content: content, developerId: developerId, url: url, hashTags: hashTags)
    }
    
    func addHashTag(from hashTag: HashTag) -> Self {
        let tags = hashTags + [hashTag]
        return Self(id: id, title: title, content: content, developerId: developerId, url: url, hashTags: tags)
    }
    
    static func Empty() -> Product {
        Product(id: ProductID.Empty(), title: "", content: "", developerId: DeveloperID.Empty(), url: "", hashTags: [])
    }
    
    func isEmpty() -> Bool {
        return id.isEmpty() && title == "" && content == "" && developerId.isEmpty() && url == "" && hashTags.isEmpty
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

