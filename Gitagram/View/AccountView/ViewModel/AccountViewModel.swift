//
//  AccountQRViewModel.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/03.
//

import CoreMotion
import CoreGraphics
import CoreImage.CIFilterBuiltins
import SwiftUI

class AccountViewModel: ObservableObject {
    
    @Published var middleImageOpacity: CGFloat = 1
    @Published var frontImageOpacitry: CGFloat = 0
    
    private let motionManager = CMMotionManager()
    
    ///  基準にする角度
    private let baseDegrees: CGFloat = 20
    
    init() {
        if motionManager.isDeviceMotionAvailable {
            startUpdatingLenticulation()
        }
    }
    
    private func startUpdatingLenticulation() {
        // 1秒間に80回アップデートする
        motionManager.deviceMotionUpdateInterval = 1.0 / 80.0
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (deviceMotion, error) in
            guard let deviceMotion = deviceMotion,
                  error == nil
            else { return }
            
            // ラジアンを角度に変換
            let degree = deviceMotion.attitude.roll.convertedRadianToDegree()
            // 角度から姿勢状態に変換
            let attitudeState = DeviceAttitudeState(degree)
            // 姿勢の状態に応じてImageOpacityの値を更新
            self.updateImageOpacity(with: attitudeState)
        }
    }
    
    /// デバイスの姿勢状態に応じてImageOpacityの値を更新
    private func updateImageOpacity(with attributeState: DeviceAttitudeState) {
        
        switch attributeState {
        case .flat:
            update(middleImageOpacity: 1, andFrontImageOpacity: 0)
        case .forward(let degree):
            let frontOpacity = degree >= baseDegrees ?  1 : degree / baseDegrees
            update(middleImageOpacity: 1, andFrontImageOpacity: frontOpacity)
        case .backward(let degree):
            let middleOpacity = degree >= baseDegrees ?  0 : (baseDegrees - degree) / baseDegrees
            update(middleImageOpacity: middleOpacity, andFrontImageOpacity: 0)
        }
    }
    
    private func update(middleImageOpacity: CGFloat,
                        andFrontImageOpacity frontImageOpacty: CGFloat) {
        self.middleImageOpacity = middleImageOpacity
        self.frontImageOpacitry = frontImageOpacty
    }
}

class QRViewModel: ObservableObject {
    
    func QRroundedImage(image: UIImage, cornerRadius: CGFloat) -> UIImage {
        //縁角丸にする
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let rect = CGRect(origin: .zero, size: image.size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        image.draw(in: rect)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage ?? UIImage()
    }
    
    func generateQRWithRoundedCorners(from string: String, size: CGSize, cornerRadius: CGFloat) -> UIImage {
        //QRコード生成
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let outputimage = filter.outputImage {
            let cgImage = context.createCGImage(outputimage, from: outputimage.extent)!
            let outputSize = CGRect(origin: .zero, size: size)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            guard let graphicsContext = UIGraphicsGetCurrentContext() else {
                return UIImage()
            }
            graphicsContext.interpolationQuality = .none
            graphicsContext.draw(cgImage, in: outputSize)
            let qrImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            if let roundedQRImage = qrImage {
                return QRroundedImage(image: roundedQRImage, cornerRadius: cornerRadius)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }

}

extension Double {
    
    func convertedRadianToDegree() -> Double {
        return self * 180 / Double.pi
    }
}

extension AccountViewModel {
    
    enum DeviceAttitudeState {
        case flat
        case forward(degree: Double)
        case backward(degree: Double)
        
        init(_ degree: Double) {
            
            switch degree {
            case 1...180:
                self = .forward(degree: degree)
            case -180 ... -1:
                let positiveDegree = degree * -1
                self = .forward(degree: positiveDegree)
            default:
                self = .flat
            }
        }
    }
}
