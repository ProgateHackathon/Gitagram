//
//  DummyProductImageRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class DummyProductImageRepository : ProductImageRepositoryProtocol {
    func fetchImage(id: Product.ID) -> UIImage? {
        return UIImage(named: "dummy_product")
    }
}

