//
//  PostViewModel.swift
//  Gitagram
//
//  Created by saki on 2024/07/04.
//

import Foundation
import SwiftUI
class PostViewModel: ObservableObject {
    @Published var cardData: CardData = .Empty()
    
    func setContent(content: Product){
        cardData = cardData.setProduct(from: content)
    }
    func setTitle(title: String) -> Product{
        return cardData.product.setTitle(from: title)
    }
    func setDesctiption(description: String) -> Product{
        return cardData.product.setContent(from: description)
    }
    func setDeveloper(developer: String) -> Product{
        let developerName = cardData.loginHost.name
        let developer = Developer(githubId: developerName)
        return cardData.product.setDeveloper(from: developer)
        
    }
    func setURLTitle(title: String) -> Product{
        return  cardData.product.setTitle(from: title)
    }
    
    func setHashTag(hashTag: [HashTag]) -> Product{
        return  cardData.product.setHashTag(from: hashTag)
    }
    func setImage(image: UIImage){
        cardData = cardData.setImage(from: image)
    }
    func setLoginHost(host: Developer){
        cardData = cardData.setLoginHost(from: host)
    }
    
    
}
