//
//  ProductImageClientProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation
import UIKit

protocol ProductImageClientProtocol {
    func saveImage(product_id: String, image: UIImage)
    func getImage(product_id: String) -> UIImage?
}
