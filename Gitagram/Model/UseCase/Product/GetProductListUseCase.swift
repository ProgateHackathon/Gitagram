//
//  GetProductList.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

class GetProductListUseCase {
    let repository: ProductRepositoryProtocol = UseCaseDI.productRepository
    let developerRepository: DeveloperRepositoryProtocol = UseCaseDI.developerRepository
    
    func execute() async -> [Product] {
        var products = await repository.getAll()
        
        for (index, product) in products.enumerated() {
            guard let developer = await developerRepository.get(id: product.developer.id) else { continue }
            products[index] = product.setDeveloper(from: developer)
        }
        
        return products
    }
}
