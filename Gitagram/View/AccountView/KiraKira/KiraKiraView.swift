//
//  KiraKiraView.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/07.
//

import Foundation
import SwiftUI

struct KiraKiraView: View {
    @StateObject var viewModel = KiraKiraViewModel()
    
    var body: some View {
        ZStack {
            Image("kirakira")
                .resizable()
                .ignoresSafeArea()
                .cornerRadius(20)
            GradationBackView()
                .ignoresSafeArea()
                .opacity(viewModel.middleImageOpacity)
                .cornerRadius(20)
            Image("kirakira")
                .resizable()
                .ignoresSafeArea()
                .opacity(viewModel.frontImageOpacitry)
                .cornerRadius(20)
        }
    }
}
