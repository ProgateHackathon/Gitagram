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
    
    @State private var isSharing: Bool = false
    
    @State var QRImage: UIImage
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    AccountView(QRImage: QRImage)
                    RoundedRectangle(cornerRadius: Self.cardCornerRadius)
                        .stroke(Color.white, lineWidth: 1)
                }
                .frame(width: Self.cardSize.width, height: Self.cardSize.height)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 20)
                QRCodeView()
                .padding()
                VStack {
                    IDView() // IDViewを追加
                }
            }
            .padding(50)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isSharing.toggle()
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .sheet(isPresented: $isSharing, content: {
                ShareSheet(activityItems: [captureViewAsImage()])
            })
        }
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
            CardBackGroundView()
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
                //.background(Color(.white))
        }
    }
}


struct IDView:View {
    var body: some View {
        IDDesignView()
    }
}

struct CardBackGroundView:View {
    var body: some View {
        GradationView()
    }
}

struct QRCodeView: View {
    var body: some View {
        QRView()
    }
}



#Preview {
    OneAccountFrameView(QRImage: UIImage())
}
