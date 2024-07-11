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
                    Text("全部見終わったよ！\n左上のリロードボタンを押してね！")
                }
                
                ForEach(Array(zip(viewModel.repositories.indices, viewModel.repositories)), id: \.1.id) { index, cardData in
                    CardView(viewModel: viewModel,
                             isShowAlert: $isShowAlert,
                             cardData: cardData,
                             cardIndex: index)
                  
                    

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
