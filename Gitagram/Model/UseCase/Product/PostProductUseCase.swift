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
    let imageRepository: ProductImageRepositoryProtocol = UseCaseDI.productImageRepository
    let developerRepository: DeveloperRepositoryProtocol = UseCaseDI.developerRepository
    
    func execute(product: Product, productImage: UIImage) async {
        imageRepository.storeImage(id: product.id, uiImage: productImage)
        await developerRepository.create(object: product.developer)
        return repository.create(object: product)
    }
}
