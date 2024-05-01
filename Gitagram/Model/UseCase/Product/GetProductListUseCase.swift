//
//  GetProductList.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

class GetProductListUseCase {
    let repository: ProductRepositoryProtocol = UseCaseDI.productRepository
    
    func execute() -> [Product] {
        return repository.getAll()
    }
}
