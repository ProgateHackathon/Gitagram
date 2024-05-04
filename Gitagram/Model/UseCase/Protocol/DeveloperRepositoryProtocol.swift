//
//  DeveloperRepositoryProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

protocol DeveloperRepositoryProtocol {
    func create(object: Developer) async
    func get(id: Developer.ID) async -> Developer?
    func getLoginDeveloper() async -> Developer?
    func update(id: Developer.ID, with newDeveloper: Developer) async
    func delete(id: Developer.ID) async
}
