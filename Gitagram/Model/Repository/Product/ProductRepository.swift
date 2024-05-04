//
//  ProductRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

class ProductRepository : ProductRepositoryProtocol {
    private let repositoryClient = RepositoryDI.productClient
    
    func getAll() async -> [Product] {
        repositoryClient.getAll()
    }
    
    func create(object: Product) {
        repositoryClient.create(product: object)
    }
    
    func get(id: Product.ID) async -> Product? {
        repositoryClient.get(product_id: id)
    }
    
    func update(id: Product.ID, with newProduct: Product) {
        repositoryClient.update(product_id: id, with: newProduct)
    }
    
    func delete(id: Product.ID) {
        repository.delete(id: id)
    }
}
