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
        self.developerId = product.developer.id.toUUID
        self.url = product.url
     
    }
    
    func toProduct() -> Product {
        return Product(id: Product.ID(id: id), title: title, content: content, developer: Developer(id: Developer.ID(id: developerId), githubId: ""), hashTags: [], prodactUrl: (URL(string: "") ?? URL(string: "https://firebasestorage.googleapis.com/v0/b/gitagram-ef516.appspot.com/o/products%2F094CEE67-F9FD-4F98-A447-8ADCDB1FCB24?alt=media&token=38d9eee4-ddda-4d64-8798-4394cb77d6d4"))!)
    }
}
