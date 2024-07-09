//
//  DeveloperRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

class DeveloperRepository : DeveloperRepositoryProtocol {
    private let developerClient = RepositoryDI.developerClient
    private let SIGNIN_DEVELOPER_KEY = "signin"
    typealias DeveloperID = Developer.DeveloperID
    
    func create(object: Developer) async {
        UserDefaults.standard.set(object.id.toString, forKey: SIGNIN_DEVELOPER_KEY)
        await developerClient.create(developer: DeveloperResponse(from: object))
    }
    
    func get(id: Developer.ID) async -> Developer? {
        if let response = await developerClient.get(developer_id: id.toUUID) {
            return response.toDeveloper()
        }
        
        return nil
    }
    
    func get(name: String) async -> Developer? {
        if let response = await developerClient.get(name: name) {
            return response.toDeveloper()
        }
        
        return nil
    }
    
    func getLoginDeveloper() async -> Developer? {
        guard let uuidString = UserDefaults.standard.string(forKey: SIGNIN_DEVELOPER_KEY) else { return nil }
        guard let uuid = UUID(uuidString: uuidString) else {
            print("uuid変換ができませんでした")
            return nil
        }
        guard let developer = await get(id: DeveloperID(id: uuid)) else { return nil }
        return developer
    }
    
    func update(id: Developer.ID, with newDeveloper: Developer) {
        //TODO: 必要になったら実装。
    }
    
    func delete(id: Developer.ID) {
        //TODO: 必要になったら実装。
    }
}
