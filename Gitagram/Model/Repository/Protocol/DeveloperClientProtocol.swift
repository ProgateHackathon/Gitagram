//
//  DeveloperClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

protocol DeveloperClientProtocol {
    func create(developer: Developer) async
    func get(developer_id: String) async -> Developer?
}
