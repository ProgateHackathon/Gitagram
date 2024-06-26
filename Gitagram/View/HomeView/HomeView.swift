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
                    Image("tab")
                    Text("まっち")//タブバーの①
                }
            AccountView(developer: hostDeveloper)
                .tabItem {
                    Image(systemName: "person.crop.circle.badge.plus")
                    Text("こ〜かん")//タブバーの②
                }
        }
    }
}
