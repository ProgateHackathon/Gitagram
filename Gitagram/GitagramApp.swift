//
//  GitagramApp.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/04/29.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct GitagramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
<<<<<<< HEAD
            @State var inputText = ""
            InputFormView()
=======
            MatchingView()
>>>>>>> d621390b6c3947af709c364f434ad97bf1c12d2b
        }
    }
}
