//
//  ProductResponse.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/19.
//

import Foundation

struct ProductResponse : Identifiable, Codable {
    let id: UUID
    let title: String
    let content: String
    let developerId: UUID
    let url: String
    
    init(from product: Product) {
        self.id = product.id.toUUID
        self.title = product.title
        self.content = product.content
        self.developerId = product.developerId.toUUID
        self.url = product.url
    }
    
    func toProduct() -> Product {
        return Product(id: Product.ID(id: id), title: title, content: content, developerId: Developer.ID(id: developerId), url: url, hashTags: [])
    }
}
