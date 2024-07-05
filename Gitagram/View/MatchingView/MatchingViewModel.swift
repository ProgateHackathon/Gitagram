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
    @Published var repositories: [CardData] = []
    @Published var buttonSwipeAction: SwipeAction?
    @Published var showAddRepository = false
    @Published var showHashTagSheet = false
    @Published var pickHashTag: HashTag = .Empty()
    
    init() {
        Task {
            await getRepository()
        }
    }

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
        pickHashTag = .Empty()
        repositories = await fetchCardInfomation()
        isLoading = false
    }
    
    public func updateHashTag(to hashTag: HashTag) async {
        pickHashTag = hashTag
        await getRepository()
    }
    
    public func filterdRepository() -> [CardData] {
        if pickHashTag.isEmpty() {
            return repositories
        }
        return repositories.filter {
            $0.product.hashTags.contains(pickHashTag)
        }
    }
    
    private func fetchCardInfomation() async -> [CardData] {
        var cardList = [CardData]()
        let products = await GetProductListUseCase().execute()
        
        for product in products {
            if pickHashTag.isEmpty() {
                if let cardData = await createCardData(for: product) {
                    cardList.append(cardData)
                }
            } else if product.hashTags.contains(pickHashTag) {
                if let cardData = await createCardData(for: product) {
                    cardList.append(cardData)
                }
            }
        }
        
        return cardList
    }
    
    private func createCardData(for product: Product) async -> CardData? {
        guard let developer    = await GetDeveloperUseCase().execute(id: product.developer.id) else { return nil }
        guard let productImage = await GetProductImageUseCase().execute(id: product.id) else { return nil }
        return CardData(product: product, productImage: productImage, loginHost: developer)
    }
}
