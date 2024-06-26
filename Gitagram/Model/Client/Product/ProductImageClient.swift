//
//  ProductImageClient.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation
import UIKit
import FirebaseStorage
import Kingfisher

class ProductImageClient : ProductImageClientProtocol {
    private let storage = Storage.storage()
    private let STORAGE_URL = "gs://gitagram-ef516.appspot.com/products"
    private let cache = ImageCache.default
    
    init() {
        cache.diskStorage.config.expiration = .seconds(3600) // 1 hour cache expiration
        startCacheCleaning()
    }
    
    func uploadImage(product_id: String, image: UIImage) {
        let ref = storage.reference(forURL: STORAGE_URL).child(product_id)
        guard let jpegData = convertToJpegData(uiImage: image) else {
            print("画像の変換に失敗しました")
            return
        }
        ref.putData(jpegData as Data)
    }
    
    func downloadImage(product_id: String) async -> UIImage? {
        if let cachedImage = await getCachedImage(with: product_id) {
            return cachedImage
        }
        
        if let fetchedImage = await fetchImage(with: product_id){
            cacheImage(forKey: product_id, image: fetchedImage)
            return fetchedImage
        }
        
        return nil
    }
    
    private func getCachedImage(with product_id: String) async -> UIImage? {
        if cache.isCached(forKey: product_id) {
            var image: UIImage?
            
            cache.retrieveImage(forKey: product_id) { result in
                switch result {
                case .success(let value):
                    image = value.image
                case .failure(let error):
                    print(error)
                }
            }
            
            return image
        }
        
        return nil
    }
    
    private func cacheImage(forKey: String, image: UIImage) {
        cache.store(image, forKey: forKey)
    }

    private func fetchImage(with product_id: String) async -> UIImage? {
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
            
            return UIImage(data: data)
        } catch {
            print("Error occurred! : \(error)")
            return nil
        }
    }
    
    private func convertToJpegData(uiImage: UIImage) -> NSData? {
        return uiImage.jpegData(compressionQuality: 0.3) as? NSData
    }
    
    private func startCacheCleaning() {
        Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { [weak self] _ in
            self?.cache.cleanExpiredDiskCache {
                print("Expired cache cleaned.")
            }
        }
    }
}
