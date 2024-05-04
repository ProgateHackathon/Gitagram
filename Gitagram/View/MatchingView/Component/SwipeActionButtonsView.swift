//
//  SwipeActionButtonsView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: CardViewModel
    var body: some View {
        HStack(spacing: 32){
            Button{
                viewModel.buttonSwipeAction = .reject
            }label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .background{
                        Circle()
                        .fill(.white)
                        .frame(width: 48,height: 48)
                        .shadow(radius: 6)
                    }
            }
            .frame(width: 48,height: 48)

            Button{
                viewModel.buttonSwipeAction = .like
            }label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(.green)
                    .background{
                        Circle()
                        .fill(.white)
                        .frame(width: 48,height: 48)
                        .shadow(radius: 6)
                    }
            }
            .frame(width: 48,height: 48)
        }
    }
}

#Preview {
    SwipeActionButtonsView(viewModel: CardViewModel(service: CardService()))
}
