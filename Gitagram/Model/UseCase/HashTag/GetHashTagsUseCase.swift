//
//  GetHashTagsUseCase.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/30.
//

public class GetHashTagsUseCase {
    let hashTagRepository = UseCaseDI.hashTagRepository
    
    func execute() async -> [HashTag] {
        return await hashTagRepository.getAll()
    }
}
