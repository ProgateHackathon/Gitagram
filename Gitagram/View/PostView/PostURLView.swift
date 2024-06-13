//
//  PostURLView.swift
//  Gitagram
//
//  Created by saki on 2024/05/05.
//

import SwiftUI

struct PostURLView: View {
    @Binding var title: String
    @Binding var discription: String
    @State var urlLink  = ""
    @State var url = ""
    @State var developer = Developer(githubId: "")
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
            Text("https://github.com/ユーザー名/の後を入力してね！")
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.bottom,30)
            
            TextField("名前を入力してね！", text: $url)
                .frame(alignment: .leading)
                .padding(.leading,10)
            Divider()
            Spacer()
                .onAppear(){
                    Task{
                        do{
                            
                    //        developer = await GetLoginDeveloperUseCase().execute()!
                        }
                        
                    }
                    
                }
            NavigationLink{
                
                PostHashTagListView(title: $title, discription: $discription, url: $urlLink)
                    .onTapGesture {
                        urlLink = "https://github.com/\(developer.name)/\(url)"
                    }
                
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
}
#Preview {
    PostURLView(title: .constant(""), discription: .constant(""), urlLink: "", url: "", developer: Developer(githubId: "am25"))
}
