//
//  CardStackView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import SwiftUI


struct CardStackView: View {
    @ObservedObject var viewModel: MatchingViewModel
    @State var finish = false
    var body: some View {
        VStack(spacing:16){
            ZStack{
                Text("画面左上のリロードボタンを押してね！")
                ForEach(viewModel.cardModels){ cardData in
                    CardView(viewModel: viewModel, cardData: cardData)
                }
            }
            .onChange(of: finish){
                
            }
            if !viewModel.cardModels.isEmpty{
                SwipeActionButtonsView(viewModel: viewModel)
            }
            
        }
    }
}

#Preview {
    CardStackView(viewModel:MatchingViewModel())
}
