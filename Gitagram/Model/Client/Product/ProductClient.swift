//
//  ProductClient.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation
import FirebaseFirestore

class ProductClient : ProductClientProtocol {
    private let db = Firestore.firestore()
    private let COLLECTION = "products"
    
    func getAll() async -> [ProductResponse] {
        let ref = db.collection("products")
        do {
            print("Product Successfully Written!")
            return try await ref.getDocuments()
                        .documents
                        .compactMap { try? $0.data(as: ProductResponse.self)}
        } catch {
            print("Error Writing Document: \(error)")
        }
        
        return []
    }
    
    func create(product: ProductResponse) {
        do {
            try db.collection(COLLECTION).document(product.id.uuidString).setData(from: product)
            print("Product Successfully Written!")
        } catch {
            print("Error Writing Document: \(error)")
        }
    }
    
    func get(product_id: UUID) async -> ProductResponse? {
        let docRef = db.collection(COLLECTION).document(product_id.uuidString)
        do {
            print("Product Successfully Gotten!")
            return try await docRef.getDocument(as: ProductResponse.self)
        } catch {
            print("Error decoding city: \(error)")
        }
        
        return nil
    }
    
    func update(product_id: UUID, with newProduct: ProductResponse) {
        let ref = db.collection("products").document(product_id.uuidString)
        do {
            try ref.setData(from: newProduct, merge: true)
            print("Product Successfully Update!")
        } catch {
            print("Error writing document: \(error)")
        }
    }
    
    func delete(product_id: UUID) {
        let docRef = db.collection(COLLECTION).document(product_id.uuidString)
        docRef.delete()
    }
}
