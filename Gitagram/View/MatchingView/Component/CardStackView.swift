//
//  CardStackView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import Foundation
import SwiftUI


struct CardStackView: View {
    @ObservedObject var viewModel: MatchingViewModel
    @State var finish = false
    @State var isShowAlert = false
    
    var body: some View {
        VStack(spacing:16){
            ZStack{
                VStack(alignment: .center){
                    ZStack{
                        
                        Image("rainbow")
                            .resizable()
                            .frame(width: 103,height: 70)
                            .position(x: 330,y: 280)
                        Image("cloud2")
                            .resizable()
                            .frame(width: 110,height: 50)
                        
                            .position(x: 70,y: 390)
                        Image("heart")
                            .resizable()
                            .frame(width: 60,height: 60)
                            .position(x: 260,y: 270)
                        
                        VStack{
                            
                            Text("全てのカードを見終わりました！")
                                .font(.custom("Shrikhand-Regular", size: 20))
                                .padding(.horizontal,30)
                                .padding(.top,70)
                            Text("新しいカードを見るにはリロードしてください！")
                                .font(.custom("Shrikhand-Regular", size: 15))
                                .padding(.bottom,80)
                                .padding(.horizontal,30)
                           
                        }
                    }
                }
                
                ForEach(viewModel.repositories){ repository in
                    CardView(viewModel: viewModel, isShowAlert: $isShowAlert, cardData: repository)
                }
            }
            .onChange(of: finish){
                
            }
            .alert("エラー", isPresented: $isShowAlert) {
                Button("OK") {
                }
            } message: {
                Text("URLがありません")
            }
           
        }
    }
}

#Preview {
    CardStackView(viewModel:MatchingViewModel())
}
