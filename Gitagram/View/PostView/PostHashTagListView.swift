//
//  PostHashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/05/15.
//

import SwiftUI

struct PostHashTagListView: View {
    @Binding var title: String
    @Binding var discription: String
    @Binding var url : String
    @State var hashTagList = [String]()
    let grids = Array(repeating: GridItem(.fixed(80)), count: 4)
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State var stringColor = ""
    @State var pickHashtag = ""
    @State var pickStringColor = ""
    @State var colorList = [""]
    @State var firstIndex = 0
    @State var hashTags = [hashTagModel]()
    
    
    
    var body: some View {
        
        VStack{
            ProgressView("", value: 0.3)
                .tint(Color.pink)
                .cornerRadius(8)
                .scaleEffect(1.3)
                .padding(.bottom, 20)
            
            Text("どんなリポジトリ？")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            
            
            if pickHashtag != ""{
                PostHashTagView(tagWord: $pickHashtag, StringColor: $pickStringColor)
            }
            
            LazyVGrid(columns: grids) {
                ForEach($hashTags, id: \.self) { $hashtag in
                    PostHashTagView(tagWord: $hashtag.name, StringColor: $hashtag.color)
                      
                        .onTapGesture {
                            pickHashtag = hashtag.name
                            stringColor =  hashtag.color
                      
                            pickStringColor = stringColor
                           
                            
                        }
                }
            }
            Spacer()
            NavigationLink{
                PostImageView(title: $title, discription: $discription, url: $url)
                
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
        
        
        .onAppear(){
            Task{
                do{
                    hashTags = [
                        hashTagModel(name: "Swift", color:  "ffc0cb"),
                        hashTagModel(name: "Kotlin", color:  "fffacd"),
                        hashTagModel(name: "Flutter", color: "b0c4de"),
                        hashTagModel(name: "Ruby", color:  "ffdab9"),
                        hashTagModel(name: "React", color:  "f08080"),
                        hashTagModel(name: "next.js", color:  "87cefa"),
                        hashTagModel(name: "Ruby on rails", color:  "e0ffff")
                    ]

                    //ここでハッシュタグを取得
                    hashTagList = ["Swift","Kotlin","Flutter","Ruby","React","next.js","Ruby on rails"]
                    colorList = ["ffc0cb","fffacd","b0c4de","ffdab9","f08080","87cefa","e0ffff"]
                }
                
            }
            
        }
        
    }
    
}
//仮のモデル
struct hashTagModel: Identifiable, Hashable {
    var id = UUID()
    var name : String
    var color : String
    
}

#Preview {
    PostHashTagListView(title: .constant(""), discription: .constant("aa"),  url: .constant(""))
}
