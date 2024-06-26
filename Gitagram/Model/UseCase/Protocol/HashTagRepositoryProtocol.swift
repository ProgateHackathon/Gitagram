//
//  Untitled.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/20.
//

protocol HashTagRepositoryProtocol {
    func getAll() async -> [HashTag]
}
