//
//  ProductImageRepositoryProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

protocol ProductImageRepositoryProtocol {
    func storeImage(id: Product.ID, uiImage: UIImage)
}
