//
//  ProductImageRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/05.
//

import Foundation
import UIKit

class ProductImageRepository : ProductImageRepositoryProtocol {
    private let client = RepositoryDI.productImageClient
    
    func storeImage(id: Product.ID, uiImage: UIImage) {
        client.uploadImage(product_id: id.toString, image: uiImage)
    }
    
    func fetchImage(id: Product.ID) async -> UIImage? {
        await client.downloadImage(product_id: id.toString)
    }
    func getURL(id: Product.ID) async -> URL?{
        await  client.downloadImageURL(product_id: id.toString)
    }
   
}
