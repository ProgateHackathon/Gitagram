//
//  Product.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

struct Product : Identifiable, Codable {
    typealias ProductID = Product.ID
    typealias DeveloperID = Developer.DeveloperID
    
    let id: ProductID
    let title: String
    let content: String
    let developerId: DeveloperID
    let url: String
    
    //既にIDが生成されている場合のイニシャライザ
    init(id: ProductID, title: String, content: String, developerId: DeveloperID, url: String) {
        self.id = id
        self.title = title
        self.content = content
        self.developerId = developerId
        self.url = url
    }
    
    //新規Productのイニシャライザ
    init(title: String, content: String, developerId: DeveloperID, url: String) {
        self.id = ProductID(id: UUID())
        self.title = title
        self.content = content
        self.developerId = developerId
        self.url = url
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
