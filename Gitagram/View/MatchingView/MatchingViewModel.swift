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
    @Published var isLoading = true
    @Published var repositories: [RepositoryCardData] = []
    @Published var buttonSwipeAction: SwipeAction?

    func removeCard(_  product: Product){
        Task{
           try await Task.sleep(nanoseconds: 500_000_000)
            guard let index = repositories.firstIndex(where: { $0.product.id == product.id }) else { return }
            repositories.remove(at: index)
        }
    }
    
    public func getLastRepository() -> RepositoryCardData? {
        repositories.last
    }
    
    public func isExistRepository() -> Bool {
        !repositories.isEmpty
    }
    
    public func getRepository() async {
        isLoading = true
        repositories = await fetchCardInfomation()
        isLoading = false
    }
    
    private func fetchCardInfomation() async -> [RepositoryCardData] {
        var cardList = [RepositoryCardData]()
        let products = await GetProductListUseCase().execute()
        for product in products {
            guard let developer    = await GetDeveloperUseCase().execute(id: product.developer.id) else { continue }
            let cardData = RepositoryCardData(product: product, loginHost: developer)
            cardList.append(cardData)
        }
        
        return cardList
    }
}
