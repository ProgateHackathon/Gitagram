//
//  Product.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

struct Product : Identifiable {
    typealias ProductID = Product.ID
    
    let id: ProductID
    let title: String
    let content: String
    let developer: Developer
    let hashTags: [HashTag]
    let prodactUrl: URL
    var url: String {
        "https://github.com/\(developer.name)/\(title)"
    }
    
    //既にIDが生成されている場合のイニシャライザ
    init(id: ProductID, title: String, content: String, developer: Developer, hashTags: [HashTag], prodactUrl: URL) {
        self.id = id
        self.title = title
        self.content = content
        self.developer = developer
        self.hashTags = hashTags
        self.prodactUrl = prodactUrl
    }
    
    //新規Productのイニシャライザ
    init(title: String, content: String, developer: Developer, hashTags: [HashTag], prodactUrl: URL) {
        self.id = ProductID(id: UUID())
        self.title = title
        self.content = content
        self.developer = developer
        self.hashTags = hashTags
        self.prodactUrl = prodactUrl
    }
    
    func setDeveloper(from developer: Developer) -> Self {
        Self(id: id, title: title, content: content, developer: developer, hashTags: hashTags, prodactUrl: prodactUrl)
    }
    
    func setTitle(from title: String) -> Self {
        Self(id: id, title: title, content: content, developer: developer, hashTags: hashTags, prodactUrl: prodactUrl)
    }
    
    func setContent(from content: String) -> Self {
        Self(id: id, title: title, content: content, developer: developer, hashTags: hashTags, prodactUrl: prodactUrl)
    }
    
    func setHashTag(from hashTags: [HashTag]) -> Self {
        Self(id: id, title: title, content: content, developer: developer, hashTags: hashTags, prodactUrl: prodactUrl)
    }
    
    func addHashTag(from hashTag: HashTag) -> Self {
        let tags = hashTags + [hashTag]
        return Self(id: id, title: title, content: content, developer: developer, hashTags: tags, prodactUrl: prodactUrl)
    }
    
    static func Empty() -> Product {
        Product(title: "", content: "", developer: Developer.Empty(), hashTags: [], prodactUrl: URL(string: "")!)
    }
    
    func isEmpty() -> Bool {
        return id.isEmpty() && title == "" && content == "" && developer.isEmpty() && url == "" && hashTags.isEmpty
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

