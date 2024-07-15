//
//  PostView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct PostTitleView: View {
    @State var title: String = ""
    var gitHubLoader = GitHubLoader()
    @StateObject  var viewModel = RepositoryViewModel()
    @EnvironmentObject var postViewModel: PostViewModel
    
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
                    postViewModel.setContent(content: postViewModel.setTitle(title: title))
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
                    postViewModel.setLoginHost(host: host)
                    let username = postViewModel.cardData.loginHost.name
                    print("koko",username)
           //         postViewModel.setDeveloperName(developer: username)
                    viewModel.fetchRepositories(for: username)
                } else {
                    ContentView()
                }
            }
        }
    }
}


#Preview {
    PostTitleView()
}
