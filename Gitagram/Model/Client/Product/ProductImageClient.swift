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
    
    private func convertToJpegData(uiImage: UIImage) -> NSData? {
        return uiImage.jpegData(compressionQuality: 0.1) as? NSData
    }
}
