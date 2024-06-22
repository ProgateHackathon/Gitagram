//
//  USerInfoView.swift
//  Gitagram
//
//  Created by saki on 2024/05/05.
//

import SwiftUI

struct UserInfoView: View {
    let cardData: CardData
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                AsyncImage(url: cardData.loginHost.imageURL) { image in
                    image
                        .resizable()
                        .frame(width: 60,height: 60)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                    
                Text(cardData.loginHost.name)
                    .font(. title)
                    .fontWeight(.semibold)
            }
            HStack{
                Text(cardData.product.title)
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
            
            Text(cardData.product.content)
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
        
    }
}

