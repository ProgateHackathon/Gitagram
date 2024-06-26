//
//  PostURLView.swift
//  Gitagram
//
//  Created by saki on 2024/05/05.
//

import SwiftUI

struct PostURLView: View {
    @State var cardData: CardData
    @State var title: String = ""
    @State var developerName: String = ""
    
    var body: some View {
        VStack{
            ProgressView("", value: 0.6)
                .tint(Color.pink)
                .cornerRadius(8)
                .scaleEffect(1.3)
                .padding(.bottom, 20)
            
            Text("リポジトリのリンクは？")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,10)
            
            Text("例 : https://github.com/ユーザー名 or Organizations名/リポジトリ名")
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.bottom,10)
            Text(cardData.product.url)
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.bottom,30)
            
            TextField("自分のIDまたはOrganizationsを入力しよう!!", text: $developerName)
                .frame(alignment: .leading)
                .padding(.leading,10)
                .padding(.vertical,10)
                .onChange(of: developerName) {
                    let developer = Developer(githubId: developerName)
                    let product = cardData.product.setDeveloper(from: developer)
                    cardData = cardData.setProduct(from: product)
                }
            
            Divider()
            
            Spacer()
            
            NavigationLink{
                PostHashTagView(cardData: cardData)
            }label:{
                Text("次へ")
                    .padding(.horizontal,120)
                    .padding(.vertical,15)
                    .font(.system(size: 10, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .background(Color(Color(red: 0.82, green: 0.6, blue: 0.97)))
                    .cornerRadius(30)
                    .padding(.bottom,20)
            }
        }
        .onAppear {
            developerName = cardData.loginHost.name
        }
    }
}

#Preview {
    PostURLView(cardData: .Empty())
}
