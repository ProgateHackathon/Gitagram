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
    
    @State var hashTagList = ["swift","Flutter"]
    @State var color = []
    @Binding var StringColor : String//16新数のcolorのstring
  
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack{
                    HStack{
                        ForEach($hashTagList, id: \.self){ $hashtag in
                            Text(hashtag)
                                .frame(height: 18)
                                .padding(4)
                                .padding(.horizontal, 5)
                                .minimumScaleFactor(0.2)
                                .background(Color( UIColor(hex: StringColor) ?? UIColor(hex: "F3F3F5")!).gradient)
                                .cornerRadius(50)
                                .onAppear {
                                    //ここでハッシュタグモデルから色を持ってきて代入する、一旦ランダム
                                    //変換
                             
                                }
                        }
                    }
                    
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
        }
        .sheet(isPresented: $showAddRepository) {
            PostView()
        }
        .onAppear(perform: {
            Task {
                await viewModel.getRepository()
            }
        })
        
    }
}

#Preview {
    MatchingView( StringColor: .constant(""))
}
