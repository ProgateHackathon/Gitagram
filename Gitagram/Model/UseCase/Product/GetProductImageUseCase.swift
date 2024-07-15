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
    

    func urlexecute(id: Product.ID) async -> URL? {
        let url = await productImageRepository.getURL(id: id)
        return url
    }
}
