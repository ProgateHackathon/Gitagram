//
//  HashTagClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/20.
//

import Foundation

protocol HashTagClientProtocol {
    func getAll() async -> [HashTagResponse]
    func get(hashtag_id: UUID) async -> HashTagResponse?
}
