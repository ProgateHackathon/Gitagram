//
//  HashTagClient.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/20.
//

import Foundation
import FirebaseFirestore

class HashTagClient : HashTagClientProtocol {
    private let db = Firestore.firestore()
    private let COLLECTION = "tags"
    
    func getAll() async -> [HashTagResponse] {
        let ref = db.collection(COLLECTION)
        do {
            return try await ref.getDocuments()
                        .documents
                        .compactMap { try? $0.data(as: HashTagResponse.self)}
        } catch {
            print("Error Writing Document: \(error)")
        }
        
        return []
    }
    
    func get(hashtag_id: UUID) async -> HashTagResponse? {
        let docRef = db.collection(COLLECTION).document(hashtag_id.uuidString)
        do {
            return try await docRef.getDocument(as: HashTagResponse.self)
        } catch {
            print("Error decoding city: \(error)")
        }
        
        return nil
    }
    
    func create(hashtag: HashTagResponse) {
        do {
            try db.collection(COLLECTION).document(hashtag.id.uuidString).setData(from: hashtag)
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
        }
    }
}
