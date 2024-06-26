//
//  CardModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import UIKit

struct CardData : Identifiable {
    var id: UUID = UUID()
    let product : Product
    let productImage: UIImage
    let loginHost : Developer
    
    static func Empty() -> Self {
        Self(product: Product.Empty(), productImage: UIImage(named: "back")!, loginHost: Developer.Empty())
    }
    
    func isComplete() -> Bool {
        let invalid = product.isEmpty() || loginHost.isEmpty()
        return !invalid
    }
    
    func setLoginHost(from developer: Developer) -> Self {
        Self(product: product, productImage: productImage, loginHost: developer)
    }
    
    func setProduct(from product: Product) -> Self {
        Self(product: product, productImage: productImage, loginHost: loginHost)
    }
    
    func setImage(from image: UIImage) -> Self {
        Self(product: product, productImage: image, loginHost: loginHost)
    }
}
