//
//  CardModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import UIKit

struct CardDataModel : Identifiable {
    var id: UUID = UUID()
    let product : Product
    let productImage: UIImage
    let developer : Developer
}
