//
//  PostGaugeView.swift
//  Gitagram
//
//  Created by saki on 2024/07/03.
//

import SwiftUI
import Combine

struct PostView: View {
    @State private var value: Double = 0.2
    @State var selection = 1
    @StateObject var postViewModel = PostViewModel()
    let gadient = Gradient(colors: [.pink,.purple])
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack{
            Gauge(value:value){
                
            }
            .padding(.bottom, 50)
            .padding(.top, 80)
            .tint(gadient)
            
            
            TabView(selection: $selection) {
                PostTitleView()
                    .tag(1)
                    .environmentObject(postViewModel)
                    .onChange(of: selection) { newValue in
                        if newValue == 1 {
                            withAnimation{
                                value = 0.2
                            }
                            print(postViewModel.cardData)
                            
                        }
                    }
                
                PostDescriptionView()
                    .tag(2)
                    .environmentObject(postViewModel)
                    .onChange(of: selection) { newValue in
                        if newValue == 2 {
                            withAnimation{
                                value = 0.4
                            }
                            print(postViewModel.cardData,"2")
                        }
                        
                    }
                
                PostURLView()
                    .tag(3)
                    .environmentObject(postViewModel)
                    .onChange(of: selection) { newValue in
                        if newValue == 3 {
                            withAnimation{
                                value = 0.6
                            }
                            print(postViewModel.cardData,"3")
                        }
                    }
                
                PostHashTagView()
                    .tag(4)
                    .environmentObject(postViewModel)
                    .onChange(of: selection) { newValue in
                        if newValue == 4 {
                            withAnimation{
                                value = 0.8
                            }
                            print(postViewModel.cardData,"3")
                        }
                        
                    }
                
                PostImageView()
                    .environmentObject(postViewModel)
                    .tag(5)
                    .onChange(of: selection) { newValue in
                        if newValue == 5 {
                            withAnimation{
                                value = 1.0
                            }
                        }
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .tabViewStyle(.page)
            
            if selection != 5{
                Button(action: {
                    selection += 1
                    print(postViewModel.cardData,"ボタン押されたよ")
                }, label: {
                    Text("次へ")
                        .padding(.horizontal,120)
                        .padding(.vertical,15)
                        .font(.system(size: 10, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .background(Color(Color(red: 0.82, green: 0.6, blue: 0.97)))
                        .cornerRadius(30)
                        .padding(.bottom,20)
                })
            }
        }
    }
    
}

#Preview {
    PostView()
}
