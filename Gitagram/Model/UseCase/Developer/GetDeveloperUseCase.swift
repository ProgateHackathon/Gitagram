//
//  GetDeveloperUseCase.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/02.
//

import Foundation

class GetDeveloperUseCase {
    private let developerRepository = UseCaseDI.developerRepository
    private let dummyDeveloper  = DummyDeveloperRepository.dummyDeveloper
    
    func execute() async -> Developer? {
        developerRepository.get(id: dummyDeveloper.id)
    }
}
