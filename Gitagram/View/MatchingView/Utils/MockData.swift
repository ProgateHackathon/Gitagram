//
//  MockData.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation

struct MockData{
    static let users: [User] = [
        .init(id: NSUUID().uuidString, fullName: "さき", age: 37, profileImageURLs: "sample2"),
        .init(id: NSUUID().uuidString, fullName: "あいうえお", age: 37, profileImageURLs: "sample3"),
        .init(id: NSUUID().uuidString, fullName: "かきくけこ", age: 37, profileImageURLs: "sample4")
    ]
}
