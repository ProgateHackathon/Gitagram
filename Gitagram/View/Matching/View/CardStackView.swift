//
//  CardStackView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var ViewModel = CardViewModel(service: CardService())
    var body: some View {
        VStack(spacing:16){
            ZStack{
                ForEach(ViewModel.cardModels){ card in
                    CardView(viewModel: ViewModel, model: card)
                }
            }
            if !ViewModel.cardModels.isEmpty{
                SwipeActionButtonsView(viewModel: ViewModel )
            }
         
            
        }
    }
}

#Preview {
    CardStackView()
}
