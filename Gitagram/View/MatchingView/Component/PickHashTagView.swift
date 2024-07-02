//
//  PickHashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/06/17.
//

import SwiftUI

struct PickHashTagView: View {
    @State var hashTags: [HashTag] = []
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State var searchText = ""
    @State var isLoadCompleted: Bool = false
    var filteredHashtags: [HashTag] {
        if searchText.isEmpty {
            return hashTags
        } else {
            return hashTags.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    @Environment(\.dismiss) private var dismiss
    @State var tapTag = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.1, green: 0.1, blue: 0.2 ,opacity: 0.4)
                    .edgesIgnoringSafeArea(.all)
                
                if isLoadCompleted {
                    VStack{
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(filteredHashtags) { hashTag in
                                HashTagComponent(hashTag: hashTag)
                                    .scaleEffect(CGSize(width: 1.7, height: 1.7))
                                    .foregroundColor(.black)
                                    .padding()
                                    .onTapGesture {
                                        tapTag = hashTag.name
                                        dismiss()
                                    }
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                } else {
                    ProgressView()
                }
            }
        }
        .searchable(text: $searchText)
        .onAppear(){
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.3)
            
            Task {
                hashTags = await GetHashTagsUseCase().execute()
                isLoadCompleted = true
            }
        }
    }
}

#Preview {
    PickHashTagView()
}

