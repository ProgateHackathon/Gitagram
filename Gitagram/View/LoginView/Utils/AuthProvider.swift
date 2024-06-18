//
//  AuthProvider.swift
//  Gitagram
//
//  Created by saki on 2024/06/19.
//

import Foundation
enum AuthProvider: String {
    case gitHub = "github.com"
    var id: String { rawValue }
    
    /// The UI friendly name of the `AuthProvider`. Used for display.
    var name: String {
        switch self {
        case .gitHub:
            return "GitHub"
        }
    }
    init?(rawValue: String) {
        switch rawValue {
        case "GitHub":
            self = .gitHub
        default: return nil
        }
    }
}

