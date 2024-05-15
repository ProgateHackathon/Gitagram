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
    @State var next = false
    @State var developer : Developer
    @State var url = ""
    @State var hashTagList = [String]()
    let grids = Array(repeating: GridItem(.fixed(80)), count: 4)
        
  
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
                
                TextField("リポジトリのハッシュタグを選択してね", text: $url)
                    .frame(alignment: .leading)
                    .padding(.leading,10)
                Divider()
                LazyVGrid(columns: grids) {
                    ForEach($hashTagList, id: \.self) { hashtag in
                        PostHashTagView(tagWord: hashtag)
                    }
                }
                
        
               
                Spacer()
                NavigationLink{
                    PostImageView(developer: Developer(githubId: ""), title: $title, discription: $discription, url: $url)

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
                   //ここでハッシュタグ一覧を保存
                    hashTagList = ["Swift","Kotlin","Flutter","Ruby","React","next.js","Ruby on rails"]
                }
               
            }
         
        }
       
    }
}

#Preview {
    PostHashTagListView(title: .constant(""), discription: .constant("aa"), developer: Developer(githubId: "am2525nyan"))
}
