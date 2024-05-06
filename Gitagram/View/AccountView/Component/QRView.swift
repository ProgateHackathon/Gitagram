//
//  QRView.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
//

import SwiftUI

struct QRView: View {
    let inputText: String
    let qrGenerator = GetQRCodeUseCase()
    let cornerRadius: CGFloat = 10

    var qrCode: UIImage {
        return qrGenerator.execute(inputText: inputText)
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
