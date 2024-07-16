//
//  GetDeveloperUseCase.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/02.
//

import Foundation

class GetDeveloperUseCase {
    private let developerRepository = UseCaseDI.developerRepository
    
    func execute(id: Developer.ID) async -> Developer? {
        await developerRepository.get(id: id.id)
    }
}
