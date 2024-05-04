//
//  ProductClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

protocol ProductClientProtocol {
    func getAll() async -> [Product]
    func create(product: Product)
    func get(product_id: Product.ID) async -> Product?
    func update(product_id: Product.ID, with newProduct: Product)
    func delete(product_id: Product.ID)
}
