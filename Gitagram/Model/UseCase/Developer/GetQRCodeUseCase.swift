//
//  GetDeveloperQRCode.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class GetQRCodeUseCase {
    private let generator : QRCodeProtocol = UseCaseDI.qrRepository
    
    func execute(inputText: String) -> UIImage {
        return generator.generate(text: inputText)
    }
}
