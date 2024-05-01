//
//  DummyProductRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

class DummyProductRepository : ProductRepositoryProtocol {
    private static let dummyDeveloper  = Developer(name: "developer1", gitHubURL: "https://github.com/urassh", imagePath: "dummy_developer")
    private static let dummyDeveloper2 = Developer(name: "developer2", gitHubURL: "https://github.com/urassh", imagePath: "dummy_developer")
    private static let dummyDeveloper3 = Developer(name: "developer3", gitHubURL: "https://github.com/urassh", imagePath: "dummy_developer")
    private static let dummyDeveloper4 = Developer(name: "developer3", gitHubURL: "https://github.com/urassh", imagePath: "dummy_developer")
    private static let dummyDeveloper5 = Developer(name: "developer3", gitHubURL: "https://github.com/urassh", imagePath: "dummy_developer")
    
    private var productStore: [Product] = [
        Product(title: "product_1", content: "content", imagePath: "dummy_product", developerId: dummyDeveloper.id),
        Product(title: "product_2", content: "content", imagePath: "dummy_product", developerId: dummyDeveloper2.id),
        Product(title: "product_3", content: "content", imagePath: "dummy_product", developerId: dummyDeveloper3.id),
        Product(title: "product_4", content: "content", imagePath: "dummy_product", developerId: dummyDeveloper3.id),
        Product(title: "product_5", content: "content", imagePath: "dummy_product", developerId: dummyDeveloper3.id)
    ]
    
    func getAll() -> [Product] {
        return productStore
    }
    
    func create(object: Product) {
        productStore.append(object)
    }
    
    func get(id: Product.ID) -> Product? {
        if let index = productStore.firstIndex(where: { $0.id == id }) {
            return productStore[index]
        }
        
        return nil
    }
    
    func update(id: Product.ID, with newProduct: Product) {
        guard let index = productStore.firstIndex(where: { $0.id == id }) else { return }
        productStore[index] = newProduct
    }
    
    func delete(id: Product.ID) {
        guard let index = productStore.firstIndex(where: { $0.id == id }) else { return }
        productStore.remove(at: index)
    }
}
