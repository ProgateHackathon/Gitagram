//  OneAccountView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/04.
//
import SwiftUI
import CoreImage.CIFilterBuiltins

struct TwoAccountFrameView: View {
    //
    private static let cardCornerRadius: CGFloat = 20
    private static let cardSize: CGSize = .init(width: 367, height: 512)
    
    @State private var isSharing: Bool = false
    @State private var inputText:String // ここでは初期化しない
    @State var QRImage: UIImage
    
    // inputTextの初期化はinit内で行う
    init(inputText: String, QRImage: UIImage) {
        self._inputText = State(initialValue: inputText) // 初期値を設定
        self.QRImage = QRImage
    }
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
                    Spacer() // 上部のスペーサーを追加
                    SeccondIDView(inputText: inputText)
                    Spacer() // 下部のスペーサーを追加
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
    
    func captureViewAsImage() -> UIImage {
            let window = UIWindow(frame: UIScreen.main.bounds)
        let hostingController = UIHostingController(rootView: OneAccountFrameView(inputText: inputText, QRImage: UIImage()))
            window.rootViewController = hostingController
            window.makeKeyAndVisible()
            
            let image = hostingController.view.asImage()
            
            return image
        }
    
}



struct BackView: View {
    var body: some View {
        Color(red: 0.02, green: 0, blue: 0.42)
    }
}

struct TwoIDDesignView:View {
    @Binding var inputText: String // @Binding で inputText を受け取る
    
    var body: some View {
        Text("@\(inputText)")
            .foregroundColor(Color(red: 1.0, green: 1.0, blue: 1.0))
            .font(.custom("Source Serif 4", size: 50))
            //.underline()
            .padding(.bottom, 10)
            .padding(.top, 350)
    }
}

#Preview {
    TwoAccountFrameView(inputText: "", QRImage: UIImage())
}
