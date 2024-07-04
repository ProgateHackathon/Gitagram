//
//  PostHashTagView.swift
//  Gitagram
//
//  Created by saki on 2024/05/15.
//

import SwiftUI

struct PostHashTagView: View {
    @EnvironmentObject var postViewModel: PostViewModel
    @State var pickHashTag: HashTag = .Empty()
    @State var hashTags: [HashTag] = []
    @State var isLoadComplete: Bool = false
    let grids = Array(repeating: GridItem(.fixed(80)), count: 4)
    
    var body: some View {
        VStack{
            
            Text("どんなリポジトリ？")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            
            if pickHashTag.isEmpty() {
                Text("一番あうハッシュタグを選択してください")
                    .frame(height: 26)
                    .foregroundStyle(Color.gray)
            } else {
                HashTagComponent(hashTag: pickHashTag)
            }
            
            LazyVGrid(columns: grids) {
                if isLoadComplete {
                    ForEach(hashTags) { hashTag in
                        HashTagComponent(hashTag: hashTag)
                            .onTapGesture {
                                pickHashTag = hashTag
                                postViewModel.setContent(content: postViewModel.setHashTag(hashTag: [hashTag]))
                              
                            }
                    }
                } else {
                    ProgressView()
                }
            }
            
            Spacer()
            
            
        }
        .onAppear {
            Task{
                
                hashTags = await GetHashTagsUseCase().execute()
                isLoadComplete = true
            }
        }
    }
}

struct HashTagComponent: View {
    let hashTag: HashTag
    
    var color: UIColor {
        UIColor(hex: hashTag.color) ?? UIColor.white
    }
    
    var body: some View {
        Text("#" + hashTag.name)
            .frame(height: 18)
            .padding(4)
            .padding(.horizontal, 5)
            .minimumScaleFactor(0.2)
            .background(Color(uiColor: color).gradient)
            .cornerRadius(50)
    }
}

#Preview {
    PostHashTagView()
}
