//
//  TagProductClient.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/06/20.
//

import Foundation
import FirebaseFirestore

public class TagProductClient : TagProductClientProtocol {
    private let db = Firestore.firestore()
    private let COLLECTION = "tag_product"
    
    func whereProduct(from product_id: UUID) async -> [UUID] {
        let ref = db.collection(COLLECTION)
        
        do {
            let query = ref.whereField("product_id", isEqualTo: product_id)
            let snapshot = try await query.getDocuments()
            
            let tagIDs: [UUID] = snapshot.documents.compactMap { document in
                if let tagID = document.data()["tag_id"] as? String {
                    return UUID(uuidString: tagID)!
                }
                return nil
            }
            
            return tagIDs
        } catch {
            print("Error: whereProduct")
        }
        
        return []
    }
    
    func whereTag(from hashTag_id: UUID) async -> [UUID] {
        let ref = db.collection(COLLECTION)
        
        do {
            let query = ref.whereField("tag_id", isEqualTo: hashTag_id)
            let snapshot = try await query.getDocuments()
            
            let productIDs: [UUID] = snapshot.documents.compactMap { document in
                if let productID = document.data()["product_id"] as? String {
                    return UUID(uuidString: productID)!
                }
                return nil
            }
            
            return productIDs
        } catch {
            print("Error: whereTag")
        }
        
        return []
    }
    
    func createTagProduct(hashTag: UUID, product: UUID) {
        do {
            let hashTagProduct = HashTagProduct(product_id: product, tag_id: hashTag)
            try db.collection(COLLECTION).document().setData(from: hashTagProduct)
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
        }
    }
    
    func deleteTag(from hashTag_id: UUID) {
        let ref = db.collection(COLLECTION)
        
        let query = ref.whereField("tag_id", isEqualTo: hashTag_id)
        query.getDocuments() { (querySnapshot, err) in
            guard (err != nil) else { return }
            for document in querySnapshot!.documents {
              document.reference.delete()
            }
        }
    }
    
    func deleteProduct(from product_id: UUID) {
        let ref = db.collection(COLLECTION)
        
        let query = ref.whereField("product_id", isEqualTo: product_id)
        query.getDocuments() { (querySnapshot, err) in
            guard (err != nil) else { return }
            for document in querySnapshot!.documents {
              document.reference.delete()
            }
        }
    }
    
    struct HashTagProduct : Codable {
        let product_id: UUID
        let tag_id: UUID
        
        init(product_id: UUID, tag_id: UUID) {
            self.product_id = product_id
            self.tag_id = tag_id
        }
    }
}
