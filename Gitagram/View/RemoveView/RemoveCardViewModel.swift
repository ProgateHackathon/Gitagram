//
//  RemoveCardViewModel.swift
//  Gitagram
//
//  Created by saki on 2024/07/13.
//

import Foundation
@MainActor
class RemoveCardViewModel: ObservableObject {

    @Published var myRepositories: [CardData] = []

    public func getMyRepository(host: Developer) async{
      
         let products = await GetMyProductUseCase().execute(developer: host)
         
            for product in products {
                guard let productImage = await GetProductImageUseCase().execute(id: product.id)  else { continue }
                let cardData = CardData(product: product, productImage: productImage, loginHost: host)
                myRepositories.append(cardData)
            }

    }
    
    func removeCard(_  product: Product){
        Task{
           try await Task.sleep(nanoseconds: 500_000_000)
            guard let index = myRepositories.firstIndex(where: { $0.product.id == product.id }) else { return }
            myRepositories.remove(at: index)
        }
    }
}
