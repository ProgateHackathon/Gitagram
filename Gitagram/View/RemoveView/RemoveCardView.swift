//
//  RemoveCardView.swift
//  Gitagram
//
//  Created by saki on 2024/07/13.
//

import SwiftUI

struct RemoveCardView: View {
    @ObservedObject var viewModel = RemoveCardViewModel()
    @State var developer : Developer
    
    var body: some View {
        NavigationStack{
      
        List {
            ForEach(viewModel.myRepositories) { item in
                Text(item.product.title)
                    .frame(height: 30)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .cornerRadius(10)
                
            }
            .onDelete(perform: delete)
        }
        .onAppear {
            Task {
                await viewModel.getMyRepository(host: developer)
            }
        }
        .navigationTitle("投稿したリポジトリ")
    }
        
    }
    
    func delete(at offsets: IndexSet) {
        Task {
            for index in offsets {
                let repository = viewModel.myRepositories[index]
                await removeCard(repository: repository)
            }
            viewModel.myRepositories.remove(atOffsets: offsets)
        }
    }
    
    func removeCard(repository: CardData) async {
        await GetMyProductUseCase().removeCard(product: repository.product)
    }
}


#Preview {
    RemoveCardView(developer: Developer(githubId: "am2525nyan"))
}
