//
//  GetProductImage.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class GetProductImageUseCase {
    let productImageRepository = UseCaseDI.productImageRepository
    
    func execute(id: Product.ID) async -> UIImage? {
        await productImageRepository.fetchImage(id: id)
    }
}
