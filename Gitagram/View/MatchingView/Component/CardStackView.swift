//
//  CardStackView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import SwiftUI


struct CardStackView: View {
    @StateObject var viewModel = MatchingViewModel()
    
    var body: some View {
        VStack(spacing:16){
            ZStack{
                ForEach(viewModel.cardModels){ cardData in
                    CardView(viewModel: viewModel, cardData: cardData)
                }
            }
            if !viewModel.cardModels.isEmpty{
                SwipeActionButtonsView(viewModel: viewModel )
            }
            
        }
    }
}

#Preview {
    CardStackView()
}
