//
//  DeveloperClient.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation
import FirebaseFirestore

class DeveloperClient : DeveloperClientProtocol {
    private let db = Firestore.firestore()
    private let COLLECTION = "developers"
    typealias DeveloperID = Developer.DeveloperID
    
    func create(developer: Developer) async {
        do {
            try db.collection(COLLECTION).document(developer.id.toString).setData(from: developer)
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
        }
    }
    
    func get(developer_id: String) async -> Developer? {
        let docRef = db.collection(COLLECTION).document(developer_id)
        do {
            return try await docRef.getDocument(as: Developer.self)
        } catch {
            print("Error decoding city: \(error)")
        }
        
        return nil
    }
}
