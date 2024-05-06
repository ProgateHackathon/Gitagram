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

    @State var next = false
    @State var developer : Developer
    @State var url = ""
    var body: some View {
      
            
            VStack{
                ProgressView("", value: 0.3)
                    .tint(Color.pink)
                
                    .cornerRadius(8)
                    .scaleEffect(1.3)
                
                Text("リポジトリのリンクは？")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                    .padding(.top, 65)
                    .font(.system(size: 30, weight: .black, design: .default))
                    .padding(.bottom,30)
                
                TextField("リポジトリのURLを入力してね", text: $url)
                    .frame(alignment: .leading)
                    .padding(.leading,10)
                Divider()
                Spacer()
                NavigationLink("", destination: PostImageView(developer: Developer(githubId: ""), title: $title, discription: $discription, url: $url),isActive:$next)

                Button(action: {
                    next.toggle()
                }, label: {
                    Text("次へ")

                        .padding(.horizontal,120)
                        .padding(.vertical,15)
                        .font(.system(size: 10, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .background(Color(Color(red: 0.82, green: 0.6, blue: 0.97)))
                        .cornerRadius(30)
                        .padding(.bottom,20)
                })
            }
           

        .onAppear(){
            Task{
                do{
                    await GetLoginDeveloperUseCase().execute()
                }
               
            }
         
        }
       
    }
}
