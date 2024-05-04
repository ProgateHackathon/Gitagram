//
//  PostImageView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct PostImageView: View {
    
    @State var discription = ""
    @State var next = false
    
    var body: some View {
        VStack{
            ProgressView("", value: 1)
            
                .padding()
                .tint(Color.pink)
            
                .cornerRadius(8)
                .scaleEffect(1.3)
            
            Text("リポジトリの画像を貼ろう")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .padding(.top, 80)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            Spacer()
            
            Button(action: {
                //ここで画像アップロードする
            }, label: {
                HStack{
                    Image(systemName: "photo.badge.plus")
                    Text("画像のアップロード")
                }
                
                    .padding(.horizontal,40)
                    .padding(.vertical,15)
                
                    .foregroundColor(.black)
                    .background(Color.white)
                
                    .cornerRadius(35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(Color(red: 0.82, green: 0.6, blue: 0.97)), lineWidth: 3)
                    )
                
            })
            
            
            
            .padding(.bottom,20)
            
            
            
            
            
            Button(action: {
                next.toggle()
                
            }, label: {
                Text("保存")
                
                    .padding(.horizontal,120)
                    .padding(.vertical,15)
                    .font(.system(size: 10, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .background(Color(Color(red: 0.82, green: 0.6, blue: 0.97)))
                    .cornerRadius(30)
                    .padding(.bottom,20)
                
            })
        }
        .onChange(of: next){
            //ここで保存だよ
        }
        
    }
    
}

#Preview {
    PostImageView()
}
