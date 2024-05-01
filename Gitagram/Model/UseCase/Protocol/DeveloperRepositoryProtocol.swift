//
//  DeveloperRepositoryProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

protocol DeveloperRepositoryProtocol {
    func getAll() -> [Developer]
    func create(object: Developer)
    func get(id: Developer.ID) -> Developer?
    func update(id: Developer.ID, with newDeveloper: Developer)
    func delete(id: Developer.ID)
}
