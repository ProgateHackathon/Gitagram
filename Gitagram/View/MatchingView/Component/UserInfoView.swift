//
//  USerInfoView.swift
//  Gitagram
//
//  Created by saki on 2024/05/05.
//

import SwiftUI

struct UserInfoView: View {
    let cardData: CardDataModel
    @Environment(\.openURL) var openURL
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                AsyncImage(url: cardData.developer.imageURL) { image in
                    image
                        .resizable()
                        .frame(width: 60,height: 60)
                        .clipShape(Circle())
                } placeholder: {
                    LottieView(filename: "LottieProgress")
                        .frame(width: 400,height: 400)
                }
                    
                Text(cardData.developer.name)
                    .font(. title)
                    .fontWeight(.semibold)
            }
            HStack{
                Text(cardData.title)
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                Button(action: {
                    print("ボタン")
                }, label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                })
            }
            
            Text(cardData.discription)
                .font(.subheadline)
                .lineLimit(2)
            Button(action: {
                openURL(URL(string: cardData.product.url)!)
            }, label: {
                Text(cardData.product.url)
                    .font(.headline)
                    .lineLimit(2)
            })
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear,.black], startPoint: .top , endPoint: .bottom)
        )
    }
}

