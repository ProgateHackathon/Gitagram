//
//  GetMyProductUseCase.swift
//  Gitagram
//
//  Created by saki on 2024/07/13.
//

import Foundation

class GetMyProductUseCase {
    let repository: ProductRepositoryProtocol = UseCaseDI.productRepository
    let developerRepository: DeveloperRepositoryProtocol = UseCaseDI.developerRepository
    
    func execute(developer: Developer) async -> [Product] {
        var products = await repository.getMe(developer: developer)
        for (index, product) in products.enumerated() {
            products[index] = product.setDeveloper(from: developer)
        }
      
        return products
    }
    func removeCard(product: Product) async{
        repository.delete(id: product.id)
    }
}
