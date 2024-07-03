//
//  MatchingView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct MatchingView: View {
    @State var showAddRepository = false
    @State var showHashTagSheet = false
    @ObservedObject var viewModel = MatchingViewModel()
    @State var pickHashTag: HashTag = .Empty()
    @State var loginHost: Developer = .Empty()
    
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
                                    showAddRepository.toggle()
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
                                    showHashTagSheet = true
                                } label:{
                                    Image(systemName: "tag")
                                    
                                }
                            }
                            ToolbarItem(placement: .principal) {
                                if (!pickHashTag.isEmpty()) {
                                    HashTagView(hashTag: pickHashTag)
                                }
                            }
                        }
                }
            }
        }
        .sheet(isPresented: $showAddRepository) {
            PostView()
        }
        .sheet(isPresented: $showHashTagSheet) {
            PickHashTagView(pickHashTag: $pickHashTag)
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.medium])
        }
        .onAppear(){
            Task {
                if let host =  await GetLoginDeveloperUseCase().execute() {
                    loginHost = host
                }
                await viewModel.getRepository()
            }
        }
    }
}

#Preview {
    MatchingView(loginHost: .Empty())
}


