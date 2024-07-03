//
//  MatchingView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct MatchingView: View {
    @ObservedObject var viewModel = MatchingViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                LottieView(filename: "LottieProgress")
                    .frame(width: 400,height: 400)
            } else {
                VStack{
                    CardStackView(viewModel: viewModel)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    viewModel.showAddRepository.toggle()
                                } label: {
                                    Image(systemName: "plus.circle")
                                }
                            }
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    Task {
                                        await viewModel.getRepository()
                                    }
                                } label: {
                                    Image(systemName: "repeat.1.ar")
                                }
                            }
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    viewModel.showHashTagSheet = true
                                } label:{
                                    Image(systemName: "tag")
                                    
                                }
                            }
                            ToolbarItem(placement: .principal) {
                                if (!viewModel.pickHashTag.isEmpty()) {
                                    HashTagView(hashTag: viewModel.pickHashTag)
                                }
                            }
                        }
                }
            }
        }
        .sheet(isPresented: $viewModel.showAddRepository) {
            PostView()
        }
        .sheet(isPresented: $viewModel.showHashTagSheet) {
            PickHashTagView(pickHashTag: $viewModel.pickHashTag)
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.medium])
        }
        .onAppear(){
            Task {
                if let host =  await GetLoginDeveloperUseCase().execute() {
                    viewModel.loginHost = host
                }
                await viewModel.getRepository()
            }
        }
    }
}

#Preview {
    MatchingView()
}


