//
//  GetDeveloperQRCode.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class GetDeveloperQRCodeUseCase {
    private let generator : QRCodeProtocol = UseCaseDI.qrRepository
    
    func execute(developer: Developer) -> UIImage {
        let url = developer.gitHubURL
        return generator.generate(text: url)
    }
}
