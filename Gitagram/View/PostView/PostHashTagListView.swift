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
    @Binding var url : String
    @State var hashTagList = [String]()
    let grids = Array(repeating: GridItem(.fixed(80)), count: 4)
    @State private var bgColor =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
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
            VStack{
                Divider()
                HStack{
                    ColorPicker(selection: $bgColor, label: {
                        Text("色を選択")
                    })
                    .padding(10)
                    Button {
                        //ここでfirebaseにタグを保存
                        print("追加ボタン")
                    } label: {
                        Text("追加")
                            .padding(20)
                    }
                    
                }
            }
        
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
                    //ここでハッシュタグ一覧と色を取得
                    hashTagList = ["Swift","Kotlin","Flutter","Ruby","React","next.js","Ruby on rails"]
                }
                
            }
            
        }
        
    }
}

#Preview {
    PostHashTagListView(title: .constant(""), discription: .constant("aa"), developer: Developer(githubId: "am2525nyan"), url: .constant(""))
}
