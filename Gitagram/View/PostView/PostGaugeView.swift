//
//  PostGaugeView.swift
//  Gitagram
//
//  Created by saki on 2024/07/03.
//

import SwiftUI

struct PostGaugeView: View {
    @State private var value: Double = 0.2
    @State var cardData: CardData = .Empty()
    @State var selection = 1
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
                PostView()
                    .tag(1)
                    .onChange(of: selection) { newValue in
                        if newValue == 1 {
                            withAnimation{
                                value = 0.2
                            }
                            print(cardData)
                            
                        }
                    }
                
                PostDescriptionView(cardData: cardData)
                    .tag(2)
                    .onChange(of: selection) { newValue in
                        if newValue == 2 {
                            withAnimation{
                                value = 0.4
                            }
                        }
                        print(cardData,"2")
                    }
                
                PostURLView(cardData: cardData)
                    .tag(3)
                    .onChange(of: selection) { newValue in
                        if newValue == 3 {
                            withAnimation{
                                value = 0.6
                            }
                            print(cardData,"3")
                        }
                    }
                
                PostHashTagView(cardData: cardData)
                    .tag(4)
                    .onChange(of: selection) { newValue in
                        if newValue == 4 {
                            withAnimation{
                                value = 0.8
                            }
                        }
                        print(cardData,"4")
                    }
                
                PostImageView(cardData: cardData)
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
    PostGaugeView()
}
