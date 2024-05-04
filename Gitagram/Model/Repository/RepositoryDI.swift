//
//  RepositoryDI.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/04.
//

import Foundation

class RepositoryDI {
    public static let developerClient = DeveloperClient()
    public static let productClient = ProductClient()
    public static let productImageClient = ProductImageClient()
}