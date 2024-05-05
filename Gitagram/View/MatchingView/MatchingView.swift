//
//  MatchingView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI

struct MatchingView: View {
    @State var addripository = false
    var body: some View {
        
        NavigationView {
            
            CardStackView()
                .navigationTitle("Gitagram")
                          .navigationBarTitleDisplayMode(.inline)
                          .toolbar {
                              // ナビゲーションバーの右側にボタンを配置します。
                              ToolbarItem(placement: .navigationBarTrailing) {
                                  Button {
                                      addripository.toggle()
                                  } label: {
                                      Image(systemName: "plus.circle")
                                  }
                              }
                          }
        }
        .sheet(isPresented: $addripository){
            PostView(developer: Developer(githubId: "am2525nyan"))
        }
    }
}

#Preview {
    MatchingView()
}
