//
//  UseCaseDI.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

class UseCaseDI {
    static let developerRepository = DummyDeveloperRepository()
    static let developerImageRepository = DummyDeveloperImageRepository()
    static let productRepository: ProductRepositoryProtocol = DummyProductRepository()
    static let productImageRepository = DummyProductImageRepository()
    static let qrRepository: QRCodeProtocol = DummyGenerator()
}
