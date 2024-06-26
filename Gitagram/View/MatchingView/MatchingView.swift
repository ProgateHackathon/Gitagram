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
    @State var StringColor = "FFFFFF"//16新数のcolorのstring
    
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


