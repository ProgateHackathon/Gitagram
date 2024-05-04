//
//  CardViewModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation

@MainActor
class CardViewModel: ObservableObject{
    @Published var cardModels = [CardModel]()
    
    private var service = CardService()
    init(service: CardService){
        self.service = service
        Task {
            await fetchCardModel()
        }
    }
    
    func fetchCardModel()async{
        do{
            self.cardModels = try await service.fetchCardModels()
        }catch{
            print("エラーだよ\(error)")
        }
        
    }
    func removeCard(_  card: CardModel){
        guard let index = cardModels.firstIndex(where: { $0.id == card.id  })else{
            return
        }
        cardModels.remove(at: index)
    }

}
