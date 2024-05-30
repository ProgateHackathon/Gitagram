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
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                LottieView(filename: "LottieProgress")
                    .frame(width: 400,height: 400)
            } else {
                CardStackView(viewModel: viewModel)
                    .toolbar {
                        ToolbarItem(placement: .navigation) {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.vertical, 5)
                         }
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
                    }
            }
        }
        .sheet(isPresented: $showAddRepository) {
            PostView(developer: Developer(githubId: "am2525nyan"))
        }
        .onAppear(perform: {
            Task {
                await viewModel.getRepository()
            }
        })
        
    }
}

#Preview {
    MatchingView()
}
