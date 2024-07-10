//
//  ProductRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

class ProductRepository : ProductRepositoryProtocol {
    private let repositoryClient = RepositoryDI.productClient
    private let tagClient = RepositoryDI.hashTagClient
    private let tagProductClient = RepositoryDI.tagProductClient
    
    func getAll() async -> [Product] {
        let products = await repositoryClient.getAll().map { product in
            return product.toProduct()
        }
        
        let attachedTagProducts = await attachTags(to: products)
        
        return attachedTagProducts
    }
    
    func create(object: Product) {
        repositoryClient.create(product: ProductResponse(from: object))
        
        if object.hashTags.isEmpty { return }
        
        for hashTag in object.hashTags {
            if hashTag.isEmpty() { continue }
            let tagID = hashTag.id.toUUID
            let productID = object.id.toUUID
            tagProductClient.createTagProduct(hashTag: tagID, product: productID)
        }
    }
    
    func get(id: Product.ID) async -> Product? {
        guard let response = await repositoryClient.get(product_id: id.toUUID) else { return nil }
        
        let product = response.toProduct()
        let attachedTagProduct = await attachTag(to: product)
        
        return attachedTagProduct
    }
    
    func update(id: Product.ID, with newProduct: Product) {
        repositoryClient.update(product_id: id.toUUID, with: ProductResponse(from: newProduct))
    }
    
    func delete(id: Product.ID) {
        repositoryClient.delete(product_id: id.toUUID)
        tagProductClient.deleteProduct(from: id.toUUID)
    }
    
    private func attachTags(to products: [Product]) async -> [Product] {
        return await products.asyncMap { product in
            return await attachTag(to: product)
        }
    }
    
    private func attachTag(to product: Product) async -> Product {
        var attachedTagProduct = product
        let hashTagIDs = await tagProductClient.whereProduct(from: product.id.toUUID)
        
        for tagId in hashTagIDs {
            guard let hashTagResponse = await tagClient.get(hashtag_id: tagId) else { continue }
           
            attachedTagProduct = attachedTagProduct.addHashTag(from: hashTagResponse.toHashTag())
        }
        
        return attachedTagProduct
    }
}

extension Sequence {
    func asyncMap<T>(
        _ closure: @Sendable (Element) async throws -> T
    ) async rethrows -> [T] {
        var array: [T] = []
        array.reserveCapacity(self.underestimatedCount)
        for element in self {
            array.append(try await closure(element))
        }
        return array
    }
}
