//  OneAccountView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/04.
//
import SwiftUI
import CoreImage.CIFilterBuiltins

struct OneAccountFrameView: View {
    //
    private static let cardCornerRadius: CGFloat = 20
    private static let cardSize: CGSize = .init(width: 367, height: 512)
    
    @State private var isSharing: Bool = false
    @State private var inputText:String // ここでは初期化しない
    @State var QRImage: UIImage
    
    // inputTextの初期化はinit内で行う
    init(developer: Developer) {
        self._inputText = State(initialValue: developer.name) // 初期値を設定
        self.QRImage = GetDeveloperQRCodeUseCase().execute(developer: developer)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    AccountView()
                    RoundedRectangle(cornerRadius: Self.cardCornerRadius)
                        .stroke(Color.white, lineWidth: 1)
                }
                .frame(width: Self.cardSize.width, height: Self.cardSize.height)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 20)
                
                QRView(inputText: $inputText)
                
                VStack {
                    Spacer() // 上部のスペーサーを追加
                    IDView(inputText: inputText)
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
        }
    }
}



struct GradationView: View {
    let gradient = Gradient(stops: [.init(color: Color(red: 0.3, green: 0.0, blue: 0.8), location: 0.0), .init(color: Color(red: 0.8, green: 0.0, blue: 0.3), location: 1.2)])
    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct IDDesignView:View {
    @Binding var inputText: String // @Binding で inputText を受け取る
    
    var body: some View {
        Text("@\(inputText)")
            .foregroundColor(Color(red: 0.5, green: 0.0, blue: 1.0))
            .underline()
            .stroke(color: .white, width: 3)
            .font(.custom("Frankfurt", size: 40))
            .rotationEffect(.degrees(0))
            .padding(.bottom, 10)
            .padding(.top, 350)
    }
}
struct QRView: View {
    @Binding var inputText: String // 外部から inputText の値を受け取る
    let qrGenerator = GetDeveloperQRCodeUseCase()
    let cornerRadius: CGFloat = 10 // 丸みの半径を設定

    var qrCode: UIImage {
        let developer = Developer(githubId: inputText) // inputText を使用して Developer インスタンスを作成
        return qrGenerator.execute(developer: developer)
    }

    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 250, height: 250)
                .cornerRadius(20)
            Image(uiImage: qrCode)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .cornerRadius(cornerRadius)
                .padding()
        }
    }
}
