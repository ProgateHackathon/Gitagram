//
//  ProductImageClient.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation
import UIKit
import FirebaseStorage

class ProductImageClient : ProductImageClientProtocol {
    private let storage = Storage.storage()
    private let STORAGE_URL = "gs://gitagram-ef516.appspot.com/products"
    
    func uploadImage(product_id: String, image: UIImage) {
        let ref = storage.reference(forURL: STORAGE_URL).child(product_id)
        guard let jpegData = convertToJpegData(uiImage: image) else {
            print("画像の変換に失敗しました")
            return
        }
        ref.putData(jpegData as Data)
    }
    
    func downloadImage(product_id: String) async -> UIImage? {
        let storage = Storage.storage()
        let ref = storage.reference(forURL: STORAGE_URL).child(product_id)
        
        do {
            let data = try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Data, Error>) in
                ref.getData(maxSize: 100 * 1024 * 1024) { data, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let data = data {
                        continuation.resume(returning: data)
                    }
                }
            }
            
            
            
            let image = UIImage(data: data)
            return image
          
        } catch {
            print("Error occurred! : \(error)")
            return nil
        }
        
    }


    
    private func convertToJpegData(uiImage: UIImage) -> NSData? {
        return uiImage.jpegData(compressionQuality: 0.3) as? NSData
    }
}
