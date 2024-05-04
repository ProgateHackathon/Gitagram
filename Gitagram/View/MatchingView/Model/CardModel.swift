//
//  CardModel.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//
import Foundation
struct CardModel{
    let user: User
}
extension CardModel: Identifiable, Hashable{
    var id: String {return user.id}

}
