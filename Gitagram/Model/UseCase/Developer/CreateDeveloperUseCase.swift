//
//  CreateDeveloper.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

class CreateDeveloperUseCase {
    private let developerRepository = UseCaseDI.developerRepository
    
    func execute(githubId name: String) async {
        let newDeveloper = Developer(githubId: name)
        developerRepository.create(object: newDeveloper)
    }
}
