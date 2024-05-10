//
//  IndicatorView.swift
//  Gitagram
//
//  Created by 浦山秀斗 on 2024/05/10.
//

import SwiftUI

struct IndicatorView<Content: View>: View {
    @Binding var isLoading: Bool
    @ViewBuilder var content: Content
    
    
    var body: some View {
        if (isLoading) {
            ProgressView()
        } else {
            content
        }
    }
}
