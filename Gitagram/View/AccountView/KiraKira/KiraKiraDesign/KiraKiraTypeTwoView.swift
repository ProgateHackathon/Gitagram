//
//  KiraKiraTypeTwoView.swift
//  Gitagram
//
//  Created by 伊藤璃乃 on 2024/06/22.
//

import SwiftUI

struct KiraKiraTypeTwoView: View {
    @StateObject var viewModel = KiraKiraViewModel()
    
    var body: some View {
        ZStack {
            Image("kirakira")
                .resizable()
                .ignoresSafeArea()
                .cornerRadius(20)
            BackTypeTwoView()
                .ignoresSafeArea().opacity(viewModel.middleImageOpacity)
                .cornerRadius(20)
            Image("kirakira")
                .resizable()
                .ignoresSafeArea().opacity(viewModel.frontImageOpacitry)
                .cornerRadius(20)
        }
    }
}
