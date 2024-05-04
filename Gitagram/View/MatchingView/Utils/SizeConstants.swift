//
//  SizeConstants.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct SizeConstants {
    static var  screenCutof: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    
    static var  cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
