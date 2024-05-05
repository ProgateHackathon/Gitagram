//
//  TwoAccountView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

//
//  AccountQRView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/03.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct SeccondAccountFrameView: View {
    private static let cardCornerRadius: CGFloat = 20
    private static let cardSize: CGSize = .init(width: 367, height: 512)
    
    @State private var isSharing: Bool = false
    @State private var inputText:String
    @State var QRImage: UIImage
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    SeccondAccountView(QRImage: QRImage)
                    RoundedRectangle(cornerRadius: Self.cardCornerRadius)
                        .stroke(Color.white, lineWidth: 1)
                }
                .frame(width: Self.cardSize.width, height: Self.cardSize.height)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 20)
                QRView(inputText: $inputText)
                .padding()
                VStack {
                    SeccondIDView(inputText: inputText) // IDViewを追加
                }
            }
            .padding(50)
            
        }
    }

}
struct SeccondAccountView: View {
    
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
            SeccondCardBackGroundView()
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


struct SeccondIDView:View {
    //@State static var inputText = ""
    @State private var inputText:String
    init(inputText: String) {
        self._inputText = State(initialValue: inputText) // 初期値を設定
    }
    
    var body: some View {
        
        TwoIDDesignView(inputText:$inputText)
    }
}

struct SeccondCardBackGroundView:View {
    var body: some View {
        BackView()
    }
}


#Preview {
    OneAccountFrameView(inputText: "", QRImage: UIImage())
}
