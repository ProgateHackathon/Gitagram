//
//  ProductClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

protocol ProductClientProtocol {
    func getAll() async -> [ProductResponse]
    func create(product: ProductResponse)
    func get(product_id: UUID) async -> ProductResponse?
    func update(product_id: UUID, with newProduct: ProductResponse)
    func delete(product_id: UUID)
}
