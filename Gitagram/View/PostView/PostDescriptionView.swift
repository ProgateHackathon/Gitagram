//
//  PostDiscriptionView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct PostDescriptionView: View {
    @State var discription = ""
    @Binding var title : String
    
    var body: some View {
        VStack{
            ProgressView("", value: 0.4)
                .tint(Color.pink)
            
                .cornerRadius(8)
                .scaleEffect(1.3)
                .padding(.bottom, 20)
            
            Text("どんなリポジトリ？")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            
            
            TextField("リポジトリの説明を入力してね", text: $discription)
                .frame(alignment: .leading)
                .padding(.leading,10)
            Divider()
            Spacer()
            NavigationLink{
                PostURLView(title: $title, discription: $discription)
            } label: {
                Text("次へ")
                    .padding(.horizontal,120)
                    .padding(.vertical,15)
                    .font(.system(size: 10, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .background(Color(Color(red: 0.82, green: 0.6, blue: 0.97)))
                    .cornerRadius(30)
                   
            }
        }
      
        
    }
    
}



#Preview {
    PostDescriptionView(title: .constant(""))
}
