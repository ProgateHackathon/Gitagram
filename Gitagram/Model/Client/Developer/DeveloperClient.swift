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
    
    func create(developer: DeveloperResponse) async {
        do {
            try db.collection(COLLECTION).document(developer.id.uuidString).setData(from: developer)
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
        }
    }
    
    func get(developer_id: UUID) async -> DeveloperResponse? {
        let docRef = db.collection(COLLECTION).document(developer_id.uuidString)
        do {
            return try await docRef.getDocument(as: DeveloperResponse.self)
        } catch {
            print("Error decoding city: \(error)")
        }
        
        return nil
    }
    
    func get(name: String) async -> DeveloperResponse? {
        let query = db.collection(COLLECTION).whereField("name", isEqualTo: name)
        do {
            let snapshot = try await query.getDocuments()
            if let document = snapshot.documents.first {
                return try document.data(as: DeveloperResponse.self)
            }
        } catch {
            print("Error decoding developer: \(error)")
        }
        
        return nil
    }
}
