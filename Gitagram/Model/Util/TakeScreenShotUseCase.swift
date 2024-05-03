//
//  TakeScreenShotUseCase.swoft.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/03.
//

import SwiftUI

class TakeScreenshot: ObservableObject {
    func takeScreenshot() {
        guard let window = UIApplication.shared.windows.first else { return }
        
        // UIキャプチャセッションを開始
        let screen = window.rootViewController?.view.bounds
        UIGraphicsBeginImageContextWithOptions(screen!.size, false, 0)
        window.drawHierarchy(in: screen!, afterScreenUpdates: true)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // 取得したスクリーンショットがnilでないことを確認
        guard let image = screenshot else { return }
        
        // PNGデータを写真フォルダに保存
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
