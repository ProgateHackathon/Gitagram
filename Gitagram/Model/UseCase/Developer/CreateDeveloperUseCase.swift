//
//  CreateDeveloper.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

class CreateDeveloperUseCase {
    private let developerRepository = UseCaseDI.developerRepository
    
    func execute(developer: Developer) async {
        developerRepository.create(object: developer)
    }
}
