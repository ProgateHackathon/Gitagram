//
//  GetProductImage.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit
import FirebaseStorage

class GetProductImageUseCase {
    private static let STORAGE_URL = "gs://gitagram-ef516.appspot.com/products"
    
    private func path(for id: Product.ID) -> String {
        return "\(Self.STORAGE_URL)/\(id)"
    }
    
    func execute(from id: Product.ID) async throws -> URL {
        return try await withCheckedThrowingContinuation { continuation in
            let storage = Storage.storage()
            let storageRef = storage.reference(withPath: path(for: id))

            storageRef.downloadURL { url, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let url = url {
                    continuation.resume(returning: url)
                } else {
                    continuation.resume(throwing: NSError(domain: "UnknownError", code: -1, userInfo: nil))
                }
            }
        }
    }
}
