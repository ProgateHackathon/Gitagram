//
//  PostURLView.swift
//  Gitagram
//
//  Created by saki on 2024/05/05.
//

import SwiftUI

struct PostURLView: View {
    @EnvironmentObject var postViewModel: PostViewModel
    @State var title: String = ""
    @State var developerName: String = ""
    
    var body: some View {
        VStack{
            Text("リポジトリのリンクは？")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,10)
            
            Text("例 : https://github.com/ユーザー名 or Organizations名/リポジトリ名")
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.bottom,10)
            
            Text(postViewModel.cardData.product.url)
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.bottom,30)
            
            TextField("自分のIDまたはOrganizationsを入力しよう!!", text: $developerName)
                .frame(alignment: .leading)
                .padding(.leading,10)
                .padding(.vertical,10)
                .onChange(of: developerName) {
                    let developer = Developer(githubId: developerName)
                    let product = postViewModel.cardData.product.setDeveloper(from: developer)
                    postViewModel.cardData = postViewModel.cardData.setProduct(from: product)
                }
            
            Divider()
            
            TextField("リポジトリ名を入力しよう!!", text: $title)
                .frame(alignment: .leading)
                .padding(.leading,10)
                .padding(.vertical,10)
                .onChange(of: title) {
                    let product = postViewModel.cardData.product
                        .setTitle(from: title)
                    postViewModel.cardData = postViewModel.cardData.setProduct(from: product)
                }
            Divider()
            
            Spacer()
            
            
                .onAppear {
                    developerName = postViewModel.cardData.loginHost.name
                    title = postViewModel.cardData.product.title
                }
        }
    }
}

#Preview {
    PostURLView()
}
