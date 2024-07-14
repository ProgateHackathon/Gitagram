//
//  KiraKiraTypeThreeView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/26.
//

import SwiftUI

struct KiraKiraTypeThreeView: View {
    @StateObject var viewModel = KiraKiraViewModel()
    
    var body: some View {
        ZStack {
            Image("kirakira")
                .resizable()
                .ignoresSafeArea()
                .cornerRadius(20)
            BackTypeThreeView()
                .ignoresSafeArea().opacity(viewModel.middleImageOpacity)
                .cornerRadius(20)
            Image("kirakira")
                .resizable()
                .ignoresSafeArea().opacity(viewModel.frontImageOpacitry)
                .cornerRadius(20)
        }
    }
}
