//
//  MatchingView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct MatchingView: View {
    @State var addripository = false
    @State var reload = false
    @ObservedObject var viewModel = MatchingViewModel()
    var body: some View {
        
        NavigationView {
            
            CardStackView(viewModel: MatchingViewModel())
                .navigationTitle("Gitagram")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    // ナビゲーションバーの右側にボタンを配置します。
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            addripository.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            reload.toggle()
                            
                        } label: {
                            Image(systemName: "repeat.1.ar")
                        }
                    }
                }
        }
        .sheet(isPresented: $addripository){
            PostView(developer: Developer(githubId: "am2525nyan"))
        }
        .onChange(of: reload){
            Task {
                viewModel.cardModels = await viewModel.fetchCardInfomation()
            }
          
        }
        
    }
}

#Preview {
    MatchingView()
}
