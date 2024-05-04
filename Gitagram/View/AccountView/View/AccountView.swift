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
    //カードの大きさ
    
    @State var QRImage:UIImage
    
    
    var body: some View {
        ZStack {
            AccountView(QRImage: QRImage)
            RoundedRectangle(cornerRadius: Self.cardCornerRadius)
                .stroke(.white, lineWidth: 1)
        }
        .frame(width: Self.cardSize.width, height: Self.cardSize.height)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 20)
        .padding(50)
        Button("Take Screenshot") {
            TakeScreenshot()
        }
        .padding()
        
        //QRCodeView(qrCodeImage: QRImage, cornerRadius: 20)
    }
}


struct AccountView: View {
    
    @StateObject var Accountviewmodel = AccountViewModel()
    @StateObject var QRviewModel = QRViewModel()
    let QRImage:UIImage
    
    var body: some View {
        ZStack {
            Image("kirakira")
            //左に傾ける
                .resizable()
                .ignoresSafeArea()
                .cornerRadius(20)
            GradationView()
            //真ん中
                //.resizable()
                .ignoresSafeArea()
                .opacity(Accountviewmodel.middleImageOpacity)
                .cornerRadius(20)
            Image("kirakira")
            //右に傾ける
                .resizable()
                .ignoresSafeArea()
                .opacity(Accountviewmodel.frontImageOpacitry)
                .cornerRadius(20)
            QRCodeView()
        }
    }
}

struct GradationView:View {
    let gradient = Gradient(stops: [.init(color: Color.purple, location: 0.0), .init(color: Color.pink, location: 1.2)])
    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct QRCodeView: View {
    let qrGenerator = GetDeveloperQRCodeUseCase()
    let developer = Developer(githubId: "urassh")
    let cornerRadius: CGFloat = 10 // 丸みの半径を設定

    var qrCode: UIImage {
        qrGenerator.execute(developer: developer)
    }

    var body: some View {
        ZStack{
            Image(uiImage: qrCode)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .cornerRadius(cornerRadius) // 丸みを設定
                .padding() // パディングを追加
        }
    }
}



#Preview {
    AccountFrameView(QRImage: UIImage())
}
