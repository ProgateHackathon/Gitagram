//
//  HashTagRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/20.
//

class HashTagRepository : HashTagRepositoryProtocol {
    private let hashTagClient = RepositoryDI.hashTagClient
    
    func getAll() async -> [HashTag] {
        let response = await hashTagClient.getAll()
        return response.map { $0.toHashTag() }
    }
}
