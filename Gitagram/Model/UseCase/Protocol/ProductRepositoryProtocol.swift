//
//  Repository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

protocol ProductRepositoryProtocol {
    func getAll() async -> [Product]
    func create(object: Product)
    func get(id: Product.ID) async -> Product?
    func update(id: Product.ID, with newProduct: Product)
    func delete(id: Product.ID)
}
