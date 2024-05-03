//
//  DummyDeveloperImageRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class DummyDeveloperImageRepository : DeveloperImageRepositoryProtocol {
    func fetchImage(id: Developer.ID) -> UIImage? {
        return UIImage(named: "dummy_developer")
    }
}
