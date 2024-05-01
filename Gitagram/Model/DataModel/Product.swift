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
    let imagePath: String
    let developerId: DeveloperID
    
    //既にIDが生成されている場合のイニシャライザ
    init(id: ProductID, title: String, content: String, imagePath: String, developerId: DeveloperID) {
        self.id = id
        self.title = title
        self.content = content
        self.imagePath = imagePath
        self.developerId = developerId
    }
    
    //新規Productのイニシャライザ
    init(title: String, content: String, imagePath: String, developerId: DeveloperID) {
        self.id = ProductID(id: UUID())
        self.title = title
        self.content = content
        self.imagePath = imagePath
        self.developerId = developerId
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

extension Product : Encodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case imagePath
        case developerId
    }
    
    func encode(to encoder: any Encoder) throws {
        do {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id.toString, forKey: .id)
            try container.encode(developerId.toString, forKey: .developerId)
            try container.encode(title, forKey: .title)
            try container.encode(content, forKey: .content)
            try container.encode(imagePath, forKey: .imagePath)
        } catch {
            print("エンコードできん...!! : \(error)")
            throw error
        }
    }
}
