//
//  AccountViewModel.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
//

import Foundation
import UIKit
import SwiftUI

class AccountViewModel {
    func captureViewAsImage() -> UIImage {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let hostingController = UIHostingController(rootView: KiraKiraTypeOneView())
    
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
            
        let image = hostingController.view.asImage()
            
        return image
    }
}
