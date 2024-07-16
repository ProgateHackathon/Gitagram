//
//  DeveloperRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation
import FirebaseAuth

class DeveloperRepository : DeveloperRepositoryProtocol {
    private let developerClient = RepositoryDI.developerClient
    private let SIGNIN_DEVELOPER_KEY = "signin"
    private let uid = Auth.auth().currentUser?.uid

    typealias DeveloperID = Developer.DeveloperID
    
    func create(object: Developer) async {
        await developerClient.create(developer: DeveloperResponse(from: object))
    }
    
    func get(id: String) async -> Developer? {
        if let response = await developerClient.get(developer_id: uid ?? "") {
            return response.toDeveloper()
        }
        
        return nil
    }
    
    func getLoginDeveloper() async -> Developer? {
        guard let developer = await get(id: uid ?? "") else { return nil }
        return developer
    }
    
    func update(id: Developer.ID, with newDeveloper: Developer) {
        //TODO: 必要になったら実装。
    }
    
    func delete(id: Developer.ID) {
        //TODO: 必要になったら実装。
    }
}
