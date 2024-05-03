//
//  DummyQRCode.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation
import UIKit

class DummyGenerator : QRCodeProtocol {
    func generate(text: String) -> UIImage {
        return UIImage(named: "dummy_qr")!
    }
}
