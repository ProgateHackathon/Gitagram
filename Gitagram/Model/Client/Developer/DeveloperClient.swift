//
//  DeveloperClient.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class DeveloperClient : DeveloperClientProtocol {
    private let db = Firestore.firestore()
    private let COLLECTION = "developers"
    private let uid = Auth.auth().currentUser?.uid
    
    func create(developer: DeveloperResponse) async {
        do {
            if uid != nil{
                try db.collection(COLLECTION).document(uid ?? "").setData(from: developer)
                print("Document successfully written!")
            }
        } catch {
            print("Error writing document: \(error)")
        }
    }
    
    func get(developer_id: String) async -> DeveloperResponse? {
        let docRef = db.collection(COLLECTION).document(developer_id)
        do {
            let document = try await docRef.getDocument(as: DeveloperResponse.self)
            print("Document successfully gotten!")
            return document
        } catch {
            print("Error getting document: \(error)")
        }
        return nil
    }
}
