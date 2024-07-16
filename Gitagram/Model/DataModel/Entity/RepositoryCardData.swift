//
//  CardModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import UIKit

struct RepositoryCardData : Identifiable {
    var id: UUID = UUID()
    let product : Product
    let loginHost : Developer
    
    static func Empty() -> Self {
        Self(product: Product.Empty(), loginHost: Developer.Empty())
    }
    
    func isComplete() -> Bool {
        let invalid = product.isEmpty() || loginHost.isEmpty()
        return !invalid
    }
    
    func setLoginHost(from developer: Developer) -> Self {
        Self(product: product, loginHost: developer)
    }
    
    func setProduct(from product: Product) -> Self {
        Self(product: product, loginHost: loginHost)
    }
}
