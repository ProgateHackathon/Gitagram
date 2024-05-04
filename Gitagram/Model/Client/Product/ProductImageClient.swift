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
        let ref = storage.reference(forURL: STORAGE_URL).child(product_id)
        var resultImage: UIImage? = nil
        
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            guard let imageData = data else { return }
            guard let uiImage = UIImage(data: imageData) else { return }
            resultImage = uiImage
        }
        
        return resultImage
    }
    
    private func convertToJpegData(uiImage: UIImage) -> NSData? {
        return uiImage.jpegData(compressionQuality: 1.0) as? NSData
    }
}
