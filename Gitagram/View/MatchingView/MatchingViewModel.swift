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
            async let developer = GetDeveloperUseCase().execute(id: product.developer.id)
            async let productURL = downloadImageURL(product_id: product.id.toString)
            
            if let developer = await developer, let productURL = await productURL {
                let cardData = CardData(product: product, loginHost: developer, url: productURL)
                cardList.append(cardData)

            }
        }

        return cardList
    }
    func downloadImageURL(product_id: String) async -> URL? {
      let STORAGE_URL = "gs://gitagram-ef516.appspot.com/products"
 let storage = Storage.storage()
      
            let ref = storage.reference(forURL: STORAGE_URL).child(product_id)
            
            do {
                let url = try await ref.downloadURL()
                print("できたよ")
                return url
            } catch {
                print("Error downloading image URL: \(error.localizedDescription)")
                return nil
            }
        }


}
