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
        ZStack{
            ForEach(ViewModel.cardModels){ card in
                CardView(viewModel: ViewModel, model: card)
            }
        }
        .onChange(of: ViewModel.cardModels) { oldValue, newValue in
            print("oldValue\(oldValue.count)")
            print("NewValue\(newValue.count)")
        }
        
    }
}

#Preview {
    CardStackView()
}
