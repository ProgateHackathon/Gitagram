//
//  PostView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct PostView: View {
    @State var cardData: CardData = .Empty()
    @State var title: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                ProgressView("", value: 0.2)
                    .padding()
                    .tint(Color.pink)
                    .cornerRadius(8)
                    .scaleEffect(1.3)
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                
                Text("リポジトリの名前は？")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                    .font(.system(size: 30, weight: .black, design: .default))
                    .padding(.bottom,30)
                
                TextField("リポジトリの名前を入力してね", text: $title)
                    .frame(alignment: .leading)
                    .padding(.leading,10)
                    .onChange(of: title) {
                        let product = cardData.product.setTitle(from: title)
                        cardData = cardData.setProduct(from: product)
                    }
                
                Divider()
                
                Spacer()
                
                NavigationLink{
                    PostDescriptionView(cardData: cardData)
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
        }
        .onAppear(){
            Task{
                if let host = await GetLoginDeveloperUseCase().execute() {
                    cardData = cardData.setLoginHost(from: host)
                } else {
                    ContentView()
                }
            }
        }
    }
}

#Preview {
    PostView()
}
