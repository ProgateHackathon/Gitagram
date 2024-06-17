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
                ProgressView()
            } else {
                VStack{
                    
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
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                  pickHashTag = true
                                } label:{
                                   Text("タグ選択")
                                  
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
                .presentationBackground(.thinMaterial)
                .presentationDetents([.medium, .large])
          
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


