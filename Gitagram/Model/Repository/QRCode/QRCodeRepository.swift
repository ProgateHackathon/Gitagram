//
//  QRCodeRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/03.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import UIKit

class QRCodeRepository : QRCodeProtocol {
    private static let WIDTH: CGFloat  = 200
    private static let HEIGHT: CGFloat = 200
    private static let OutputSize: CGSize = CGSize(width: WIDTH, height: HEIGHT)
    private static let OutputRect: CGRect = CGRect(origin: .zero, size: OutputSize)
    
    func generate(text: String) -> UIImage {
        guard let qrCiImage = generateQRCode(from: text),
              let qrCgImage = convertCGImage(from: qrCiImage),
              let qrUiImage = drawToUIImage(from: qrCgImage)
        else {
            return UIImage(systemName: "xmark.circle") ?? UIImage()
        }
        
        return qrUiImage
    }
    
    private func generateQRCode(from text: String) -> CIImage? {
        let textData = Data(text.utf8)
        let filter = CIFilter.qrCodeGenerator()
        filter.setValue(textData, forKey: "inputMessage")
        return filter.outputImage
    }
    
    private func convertCGImage(from ciImage: CIImage) -> CGImage? {
        let context = CIContext()
        return context.createCGImage(ciImage, from: ciImage.extent)
    }
    
    private func drawToUIImage(from cgImage: CGImage) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(QRCodeRepository.OutputSize, false, 0)
        guard let graphicsContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        graphicsContext.interpolationQuality = .none
        graphicsContext.draw(cgImage, in: QRCodeRepository.OutputRect)
        let qrImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return qrImage
    }
}
