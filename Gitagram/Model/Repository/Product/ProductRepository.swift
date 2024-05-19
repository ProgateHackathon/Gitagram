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
        await repositoryClient.getAll().map { product in
            return product.toProduct()
        }
    }
    
    func create(object: Product) {
        repositoryClient.create(product: ProductResponse(from: object))
    }
    
    func get(id: Product.ID) async -> Product? {
        if let response = await repositoryClient.get(product_id: id.toUUID) {
            return response.toProduct()
        }
        return nil
    }
    
    func update(id: Product.ID, with newProduct: Product) {
        repositoryClient.update(product_id: id.toUUID, with: ProductResponse(from: newProduct))
    }
    
    func delete(id: Product.ID) {
        repositoryClient.delete(product_id: id.toUUID)
    }
}
