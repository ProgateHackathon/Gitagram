//
//  MatchingView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct MatchingView: View {
    @State var showAddRepository = false
    @ObservedObject var viewModel = MatchingViewModel()
    @State var pickHashTag = false
    @State var isMypage = false
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
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    isMypage.toggle()
                                  
                                } label: {
                                    Image(systemName: "person.circle")
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
                                    pickHashTag = true
                                } label:{
                                    Image(systemName: "tag")
                                    
                                }
                            }
                        }
                }
            }
        }
        .sheet(isPresented: $showAddRepository) {
            PostView()
        }
        .sheet(isPresented: $pickHashTag) {
            PickHashTagView()
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isMypage) {
            RemoveCardView(developer: loginHost)
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
