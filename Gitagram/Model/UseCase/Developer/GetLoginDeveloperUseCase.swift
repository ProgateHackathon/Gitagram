//
//  GetLoginDeveloperUseCase.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

class GetLoginDeveloperUseCase {
    private let developerRepository = UseCaseDI.developerRepository
    
    func execute() async -> Developer? {
        await developerRepository.getLoginDeveloper()
    }
}
