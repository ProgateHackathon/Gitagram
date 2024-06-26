//
//  hashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/05/14.
//

import SwiftUI

struct HashTagView: View {
    @Binding var tagWord :String
    
    var body: some View {
        HStack{
            Text("#")
            Text(tagWord)
        }
        .padding(4)
        .padding(.horizontal, 5)
        
        .background(Color(Color(red: 0.82, green: 0.6, blue: 0.97)))
        .cornerRadius(50)
       
    }
    
}

#Preview {
    HashTagView(tagWord: .constant("swift"))
}
