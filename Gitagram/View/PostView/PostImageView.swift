//
//  PostImageView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI
import PhotosUI

struct PostImageView: View {
    @EnvironmentObject var postViewModel: PostViewModel
    @State var showImagePicker = false
    @State var selectedPhoto: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss
    @State var selectImage: Image? = nil
    
    var body: some View {
        VStack{
            Text("リポジトリの画像を貼ろう")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            
            Spacer()
            
            if let image = selectImage {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(15)
                    .padding()
                
            }
            
            PhotosPicker(selection: $selectedPhoto,matching: .images){
                HStack{
                    Image(systemName: "photo.badge.plus")
                    Text("画像のアップロード")
                }
                .padding(.horizontal,40)
                .padding(.vertical,15)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(35)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(Color(red: 0.82, green: 0.6, blue: 0.97)), lineWidth: 3)
                )
            }
            .onChange(of: selectedPhoto) {
                Task {
                    guard let unwrap = selectedPhoto else { return }
                    let loadedImage = await loadImageFromSelectedPhoto(photo: unwrap)
                
                }
            }
            
            .padding(.bottom,20)
            
            Button(action: {
                Task {
                    if postViewModel.cardData.isComplete() {
                     
                    }
                }
                
                UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
            }, label: {
                Text("保存")
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
    
    private func loadImageFromSelectedPhoto(photo: PhotosPickerItem) async -> UIImage? {
        if let data = try? await photo.loadTransferable(type: Data.self) {
            return UIImage(data: data)
        }
        
        return nil
    }
}

#Preview {
    PostImageView()
}
