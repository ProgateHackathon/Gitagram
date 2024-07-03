//
//  PostDiscriptionView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct PostDescriptionView: View {
    @State var cardData: CardData
    @State var description = ""
    
    var body: some View {
        VStack{

            Text("どんなリポジトリ？")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            
            TextField("リポジトリの説明を入力してね", text: $description)
                .frame(alignment: .leading)
                .padding(.leading,10)
                .onChange(of: description) {
                    let product = cardData.product.setContent(from: description)
                    cardData = cardData.setProduct(from: product)
                }
            
            Divider()
            
            Spacer()
            

        }
    }
}

#Preview {
    PostDescriptionView(cardData: .Empty())
}
