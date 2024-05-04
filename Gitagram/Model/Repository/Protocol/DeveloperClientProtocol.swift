//
//  DeveloperClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

protocol DeveloperClientProtocol {
    func create(name: String, developer_id: String)
    func get(id: String)
}
