//
//  PostView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct PostView: View {
    @State var cardData: CardData = .Empty()
    @State var title: String = ""
    var gitHubLoader = GitHubLoader()
    @StateObject  var viewModel = RepositoryViewModel()
    
    var body: some View {
       
            VStack{
               
                Text("リポジトリの名前は？")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                    .font(.system(size: 30, weight: .black, design: .default))
                    .padding(.bottom,30)
                
                TextField("リポジトリの名前を入力してね", text: $title)
                    .frame(alignment: .leading)
                    .padding(.leading,10)
                    .onChange(of: title) {
                        let product = cardData.product.setTitle(from: title)
                        cardData = cardData.setProduct(from: product)
                    }
                
                Divider()
                
                Text("または下のリストから選択")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                    .padding(.top, 20)
                    .font(.system(size: 20, weight: .black, design: .default))
                    .padding(.bottom,5)
                
                
                List(viewModel.repositories) { repository in
                    Button(action: {
                        title = repository.name
                        
                    }, label: {
                        Text(repository.name)
                            .font(.headline)
                        
                    })
                }
                
                Spacer()
                
          
            
        }
        .onAppear(){
            Task{
                if let host = await GetLoginDeveloperUseCase().execute() {
                    cardData = cardData.setLoginHost(from: host)
                    let username = cardData.loginHost.name
                    viewModel.fetchRepositories(for: username)
                } else {
                    ContentView()
                }
            }
        }
    }
}


#Preview {
    PostView()
}
