//
//  CardViewModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import UIKit

@MainActor
class MatchingViewModel: ObservableObject {
    @Published var cardModels = [CardDataModel]()
    @Published var  buttonSwipeAction: SwipeAction?
    
    
    init(){
        Task {
            self.cardModels =  await fetchCardInfomation()
        }
    }

    func removeCard(_  product: Product){
        Task{
           try await Task.sleep(nanoseconds: 500_000_000)
            guard let index = cardModels.firstIndex(where: { $0.product.id == product.id }) else { return }
            cardModels.remove(at: index)
        }
    }
    
    func fetchCardInfomation() async -> [CardDataModel] {
        var cardList = [CardDataModel]()
        let products = await GetProductListUseCase().execute()

        
        for product in products {
            guard let developer      = await GetDeveloperUseCase().execute(id: product.developerId) else { continue }
     //       guard let productImage   = await GetProductImageUseCase().execute(id: product.id)       else { continue }
            let productImage = UIImage(named: "back")
            let title = product.title
            let discription = product.content
            let cardData = CardDataModel(product: product, productImage: productImage!, developer: developer,title: title,discription: discription)
            cardList.append(cardData)
        }
        
        return cardList
    }
}
