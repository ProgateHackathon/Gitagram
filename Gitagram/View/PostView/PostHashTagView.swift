//
//  PostHashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/05/15.
//

import SwiftUI

struct PostHashTagView: View {
    @State var cardData: CardDataModel
    @State var pickHashTag: HashTag = .Empty()
    @State var hashTags = [
        HashTag(name: "Swift", color:  "ffc0cb"),
        HashTag(name: "Kotlin", color:  "fffacd"),
        HashTag(name: "Flutter", color: "b0c4de"),
        HashTag(name: "Ruby", color:  "ffdab9"),
        HashTag(name: "React", color:  "f08080"),
        HashTag(name: "next.js", color:  "87cefa"),
        HashTag(name: "Ruby on rails", color:  "e0ffff")
    ]
    
    let grids = Array(repeating: GridItem(.fixed(80)), count: 4)
    
    var body: some View {
        VStack{
            ProgressView("", value: 0.8)
                .tint(Color.pink)
                .cornerRadius(8)
                .scaleEffect(1.3)
                .padding(.bottom, 20)
            
            Text("どんなリポジトリ？")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            
            if pickHashTag.isEmpty() {
                Text("一番あうハッシュタグを選択してください")
                      .frame(height: 26)
                      .foregroundStyle(Color.gray)
            } else {
                HashTagComponent(hashTag: pickHashTag)
            }
            
            LazyVGrid(columns: grids) {
                ForEach(hashTags) { hashTag in
                    HashTagComponent(hashTag: hashTag)
                        .onTapGesture {
                            pickHashTag = hashTag
                            let product = cardData.product.setHashTag(from: [hashTag])
                            cardData = cardData.setProduct(from: product)
                        }
                }
            }
            
            Spacer()
            
            NavigationLink{
                PostImageView(cardData: cardData)
                
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
            Task{
                ///TODO: ここでハッシュタグを全種類取得する
            }
        }
    }
}

struct HashTagComponent: View {
    let hashTag: HashTag
    
    var color: UIColor {
        UIColor(hex: hashTag.color) ?? UIColor.white
    }
    
    var body: some View {
        Text("#" + hashTag.name)
            .frame(height: 18)
            .padding(4)
            .padding(.horizontal, 5)
            .minimumScaleFactor(0.2)
            .background(Color(uiColor: color).gradient)
            .cornerRadius(50)
    }
}
