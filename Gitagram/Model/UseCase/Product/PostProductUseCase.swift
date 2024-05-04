//
//  PostProduct.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class PostProductUseCase {
    let repository: ProductRepositoryProtocol = UseCaseDI.productRepository
    
    func execute(product: Product, productImage: UIImage) async {
        return repository.create(object: product)
    }
}
