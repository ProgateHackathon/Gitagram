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
        if let cachedImage = getCachedImage(product_id: product_id) {
            return cachedImage
        }
        
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
            
            if let image = UIImage(data: data) {
                cacheImage(product_id: product_id, image: image)
                return image
            } else {
                return nil
            }
        } catch {
            print("Error occurred! : \(error)")
            return nil
        }
        
    }

    private func convertToJpegData(uiImage: UIImage) -> NSData? {
        return uiImage.jpegData(compressionQuality: 0.3) as? NSData
    }
    
    private func getCachedImage(product_id: String) -> UIImage? {
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileURL = cacheDirectory.appendingPathComponent(product_id, isDirectory: false)
        
        if let imageData = try? Data(contentsOf: fileURL) {
            return UIImage(data: imageData)
        }
        
        return nil
    }
        
    private func cacheImage(product_id: String, image: UIImage) {
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let fileURL = cacheDirectory.appendingPathComponent(product_id)
        
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            try? imageData.write(to: fileURL)
        }
    }
}
