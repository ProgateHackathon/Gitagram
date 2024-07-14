//
//  CardViewModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import UIKit
import FirebaseStorage

@MainActor
class MatchingViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var repositories: [CardData] = []
    @Published var buttonSwipeAction: SwipeAction?
    
    func removeCard(_  product: Product){
        Task{
            try await Task.sleep(nanoseconds: 500_000_000)
            guard let index = repositories.firstIndex(where: { $0.product.id == product.id }) else { return }
            repositories.remove(at: index)
        }
    }
    
    public func getLastRepository() -> CardData? {
        repositories.last
    }
    
    public func isExistRepository() -> Bool {
        !repositories.isEmpty
    }
    
    public func getRepository() async {
        isLoading = true
        repositories = await fetchCardInformation()
        isLoading = false
    }
    
    func fetchCardInformation() async -> [CardData] {
        var cardList = [CardData]()
        let products = await GetProductListUseCase().execute()
        
        for product in products {
            try? await withThrowingTaskGroup(of: (Developer?, URL?).self) { group in
                group.addTask {
                    async let developer = GetDeveloperUseCase().execute(id: product.developer.id)
                    async let productURL = GetProductImageUseCase().urlexecute(id: product.id)
                    return (await developer, await productURL)
                }
                
                for try await (developer, productURL) in group {
                    if let developer = developer, let productURL = productURL {
                        let cardData = CardData(product: product, loginHost: developer, url: productURL)
                        cardList.append(cardData)
                    }
                }
            }
        }
        
        return cardList
    }

}
