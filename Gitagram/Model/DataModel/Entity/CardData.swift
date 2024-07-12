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
  
    let loginHost : Developer
    let url: URL
    
    static func Empty() -> Self {
        Self(product: Product.Empty(),loginHost: Developer.Empty(), url: URL(string: "https://firebasestorage.googleapis.com/v0/b/gitagram-ef516.appspot.com/o/products%2F094CEE67-F9FD-4F98-A447-8ADCDB1FCB24?alt=media&token=38d9eee4-ddda-4d64-8798-4394cb77d6d4")!)
    }
    
    func isComplete() -> Bool {
        let invalid = product.isEmpty() || loginHost.isEmpty()
        return !invalid
    }
    
    func setLoginHost(from developer: Developer) -> Self {
        Self(product: product, loginHost: developer, url: url)
    }
    
    func setProduct(from product: Product) -> Self {
        Self(product: product,  loginHost: loginHost, url: url)
    }
    
    func setImage(from image: UIImage) -> Self {
        Self(product: product,  loginHost: loginHost, url: url)
    }
    
}
