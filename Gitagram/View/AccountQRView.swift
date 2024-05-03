//
//  AccountQRView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/03.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct AccountFrameView: View {
    private static let cardCornerRadius: CGFloat = 20
    private static let cardSize: CGSize = .init(width: 367, height: 512)
    @State private var github = "https://github.com/"
    @State private var githubtext = ""
    @State private var alltext = ""

    @State private var image: UIImage?
    
    var body: some View {
        ZStack {
            AccountView(text: $alltext)
            RoundedRectangle(cornerRadius: Self.cardCornerRadius)
                .stroke(.white, lineWidth: 1)
        }
        .frame(width: Self.cardSize.width, height: Self.cardSize.height)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 20)
        .padding(50)
        HStack{
            Spacer()
            TextField("ユーザーID", text: $githubtext, onEditingChanged: { _ in
                self.alltext = self.github + self.githubtext
            })
        }
        Text(alltext)
        Button("Take Screenshot") {
            takeScreenshot()
        }
        .padding()
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .padding()
        }
    }
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
        
        // スクリーンショットを表示
        self.image = image
    }
}


struct AccountView: View {
    
    @StateObject var lenticulationManager = AccountQRViewModel()
    @Binding var text:String
    
    var body: some View {
        ZStack {
            Image("kirakira")
            //左に傾ける
                .resizable()
                .ignoresSafeArea()
                .cornerRadius(20)
            Image("middle")
            //真ん中
                .resizable()
                .ignoresSafeArea()
                .opacity(lenticulationManager.middleImageOpacity)
                .cornerRadius(20)
            Image("kirakira")
            //右に傾ける
                .resizable()
                .ignoresSafeArea()
                .opacity(lenticulationManager.frontImageOpacitry)
                .cornerRadius(20)
            Image(uiImage: generateQRWithRoundedCorners(from: text, size: CGSize(width: 200, height: 200), cornerRadius: 10))
        }
    }
}


func QRroundedImage(image: UIImage, cornerRadius: CGFloat) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
    let rect = CGRect(origin: .zero, size: image.size)
    UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
    image.draw(in: rect)
    let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return roundedImage ?? UIImage()
}

func generateQRWithRoundedCorners(from string: String, size: CGSize, cornerRadius: CGFloat) -> UIImage {
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

#Preview {
    AccountFrameView()
}
