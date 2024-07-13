//
//  QRTypeTwoView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/22.
//

import SwiftUI

struct QRTypeTwoView: View {
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
                .frame(width: 220, height: 220)
                .cornerRadius(cornerRadius)
                .stroke(color: .white, width: 2)
            Image(uiImage: qrCode)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .cornerRadius(cornerRadius)
                .padding()
        }
    }
}
#Preview {
    QRTypeTwoView(inputText: "Rino1011")
}
