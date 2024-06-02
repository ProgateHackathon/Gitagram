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
    @State var StringColor = ""
    @State var pickHashtag = ""

   
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
            
            
            
            TextField("リポジトリのハッシュタグを選択してね", text: $pickHashtag)
            VStack{
                Divider()
                HStack{
                    ColorPicker(selection: $bgColor, label: {
                        Text("色を選択")
                    })
                    .padding(10)
                    Button {
                        let stringColor = UIColor(bgColor).toHexString()
                        //ここでfirebaseにタグを保存して、hashタグリストを更新
                        print("追加ボタン")
                    } label: {
                        Text("追加")
                            .padding(20)
                    }
                    
                }
            }
        
            LazyVGrid(columns: grids) {
                       ForEach($hashTagList, id: \.self) { $hashtag in
                           PostHashTagView(tagWord: $hashtag, StringColor: $StringColor)
                               .onAppear {
                                   // ここで色を取得して渡す
                               }
                               .onTapGesture {
                                   pickHashtag = hashtag
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
                    //ここでハッシュタグを取得
                    hashTagList = ["Swift","Kotlin","Flutter","Ruby","React","next.js","Ruby on rails"]
                }
                
            }
            
        }
        
    }
   
}

#Preview {
    PostHashTagListView(title: .constant(""), discription: .constant("aa"),  url: .constant(""))
}
