//
//  AllView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/05/05.
//

import SwiftUI

struct HomeView: View {
    let hostDeveloper: Developer
    
    var body: some View {
        TabView{
            MatchingView()
                .tabItem {
                    Image(systemName: "1.circle.fill")
                }
            AccountView(developer: hostDeveloper)
                .tabItem {
                    Image(systemName: "2.circle.fill")
                }
        }
    }
}
