//
//  CardModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import UIKit

struct CardDataModel : Identifiable {
    var id: UUID = UUID()
    let product : Product
    let productImage: UIImage
    let developer : Developer
    
    static func Empty() -> Self {
        Self(product: Product.Empty(), productImage: UIImage(named: "back")!, developer: Developer.Empty())
    }
    
    func isComplete() -> Bool {
        let invalid = product.isEmpty() || developer.isEmpty()
        return !invalid
    }
    
    func setDeveloper(from developer: Developer) -> Self {
        Self(product: product, productImage: productImage, developer: developer)
    }
    
    func setProduct(from product: Product) -> Self {
        Self(product: product, productImage: productImage, developer: developer)
    }
}
