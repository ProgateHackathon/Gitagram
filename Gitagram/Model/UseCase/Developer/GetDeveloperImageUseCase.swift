//
//  GetDeveloperImage.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class GetDeveloperImageUseCase {
    let developerImageRepository: DeveloperImageRepositoryProtocol = UseCaseDI.developerImageRepository
    
    func execute(id: Developer.ID) async -> UIImage? {
        return developerImageRepository.fetchImage(id: id)!
    }
}
