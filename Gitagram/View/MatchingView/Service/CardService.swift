//
//  CardService.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
struct CardService{

    func fetchCardModels() async throws -> [CardDataModel]{
        let users = MockData.users
        return users.map({CardDataModel(user: $0)})
    }
}

