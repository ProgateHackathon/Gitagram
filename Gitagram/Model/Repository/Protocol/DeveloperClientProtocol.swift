//
//  DeveloperClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

protocol DeveloperClientProtocol {
    func create(developer: DeveloperResponse) async
    func get(developer_id: UUID) async -> DeveloperResponse?
    func get(name: String) async -> DeveloperResponse?
}
