//
//  ZLSwipeableViewWrapper.swift
//  Gitagram
//
//  Created by saki on 2024/07/06.
//

import SwiftUI
import ZLSwipeableViewSwift


struct SwipeableView: UIViewRepresentable {
    var onCardLoaded: (ZLSwipeableView) -> Void
    
    func makeUIView(context: Context) -> ZLSwipeableView {
        let view = ZLSwipeableView()
        onCardLoaded(view)
        return view
    }
    
    func updateUIView(_ uiView: ZLSwipeableView, context: Context) {}
}
struct newCardView: View {
    var cards = ["dummy_developer", "dummy_developer", "dummy_developer", "dummy_developer", "dummy_developer"]
    let text: String
    
    var body: some View {
        
        
        Text(text)
            .frame(width: 200, height: 300)
            .background(Color.blue.opacity(0.1))
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct newContentView: View {
    @State private var cards = ["dummy_developer", "dummy_developer", "dummy_developer", "dummy_developer", "dummy_developer"]
    
    var body: some View {
        SwipeableView { swipeableView in
            loadCards(to: swipeableView)
        }
        .frame(width: 300, height: 400)
    }
    
    private func loadCards(to swipeableView: ZLSwipeableView) {
        for card in cards {
            let cardView = UIHostingController(rootView: newCardView(text: card)).view!
            cardView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
            swipeableView.nextView = {
                return cardView
            }
        }
    }
}

