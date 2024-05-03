//
//  ProductImageRepositoryProtocol.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

protocol ProductImageRepositoryProtocol {
    func fetchImage(id: Product.ID) -> UIImage?
}
