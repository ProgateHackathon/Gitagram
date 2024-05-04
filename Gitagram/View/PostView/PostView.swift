//
//  PostView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct PostView: View {
    @State var title = ""
    @State var next = false
    @State var developer : Developer
    var body: some View {
        NavigationView {
            
            VStack{
                ProgressView("", value: 0.3)
                    .padding(.top,37)

                    .padding()
                    .tint(Color.pink)
                
                    .cornerRadius(8)
                    .scaleEffect(1.3)
                
                Text("リポジトリの名前は？")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                    .padding(.top, 80)
                    .font(.system(size: 30, weight: .black, design: .default))
                    .padding(.bottom,30)
                
                TextField("リポジトリの名前を入力してね", text: $title)
                    .frame(alignment: .leading)
                    .padding(.leading,10)
                Divider()
                Spacer()
                NavigationLink("", destination: PostDiscriptionView( title: $title),isActive: $next)

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

#Preview {

    PostView(developer: Developer(from: "saki" as! Decoder))

}