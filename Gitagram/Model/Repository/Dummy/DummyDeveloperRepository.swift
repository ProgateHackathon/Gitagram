//
//  DummyDeveloperRepository.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/01.
//

import Foundation

class DummyDeveloperRepository : DeveloperRepositoryProtocol {
    private static let dummyDeveloper  = Developer(name: "developer1")
    private static let dummyDeveloper2 = Developer(name: "developer2")
    private static let dummyDeveloper3 = Developer(name: "developer3")
    private static let dummyDeveloper4 = Developer(name: "developer3")
    private static let dummyDeveloper5 = Developer(name: "developer3")
    
    public static var currentDeveloper: Developer = Developer(name: "unknown")
    
    private var developerStore: [Developer] = [
        dummyDeveloper,
        dummyDeveloper2,
        dummyDeveloper3,
        dummyDeveloper4,
        dummyDeveloper5,
        currentDeveloper
    ]
    
    func getAll() -> [Developer] {
        return developerStore
    }
    
    func create(object: Developer) {
        DummyDeveloperRepository.currentDeveloper = object
        developerStore.append(object)
    }
    
    func get(id: Developer.ID) -> Developer? {
        if let index = developerStore.firstIndex(where: { $0.id == id }) {
            return developerStore[index]
        }
        
        return nil
    }
    
    func update(id: Developer.ID, with newDeveloper: Developer) {
        guard let index = developerStore.firstIndex(where: { $0.id == id }) else { return }
        developerStore[index] = newDeveloper
    }
    
    func delete(id: Developer.ID) {
        guard let index = developerStore.firstIndex(where: { $0.id == id }) else { return }
        developerStore.remove(at: index)
    }
}
