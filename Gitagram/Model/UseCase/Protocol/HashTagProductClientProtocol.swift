//
//  HashTagProductClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/20.
//

import Foundation

protocol TagProductClientProtocol {
    func whereProduct(from product_id: UUID) async -> [UUID]
    func whereTag(from hashTag_id: UUID) async -> [UUID]
    func createTagProduct(hashTag: UUID, product: UUID)
    func deleteTag(from hashTag_id: UUID)
    func deleteProduct(from product_id: UUID)
}
