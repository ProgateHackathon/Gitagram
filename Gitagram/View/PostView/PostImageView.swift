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
    @State private var showImagePicker = false
    @State private var selectedPhoto: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss
    @State private var selectImage: Image? = nil
    @State private var showColorPicker = false
    @State private var selectedColor: Color = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    var body: some View {
        VStack {
            Text("リポジトリのイメージは??")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .font(.system(size: 30, weight: .black, design: .default))
            
            if let image = selectImage {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 280)
                    .cornerRadius(15)
                    .padding()
            } else {
                RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                    .foregroundStyle(selectedColor)
                    .frame(width: 280, height: 280)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0, opacity: 0.4), lineWidth: 7)
                    )
                    .padding()
            }
            
            Spacer()
            
            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                HStack {
                    Image(systemName: "photo.badge.plus")
                    Text("画像のアップロード")
                }
                .frame(width: 280)
                .padding(.vertical, 15)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(35)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(red: 0.82, green: 0.6, blue: 0.97), lineWidth: 3)
                )
            }
            .onChange(of: selectedPhoto) {
                Task {
                    guard let unwrap = selectedPhoto else { return }
                    let loadedImage = await loadImageFromSelectedPhoto(photo: unwrap)
                
                }
            }
            .padding(.bottom, 20)
            
            HStack {
                ColorPicker(selection: $selectedColor) {
                }
                .labelsHidden()
                
                Text("色を設定する")
            }
                .frame(width: 280)
                .padding(.vertical, 10)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(35)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(red: 0.82, green: 0.6, blue: 0.97), lineWidth: 3)
                )
                .padding(.bottom, 20)
            
            Button(action: {
                if selectImage == nil {
                    let rectangleView = Rectangle()
                                            .foregroundStyle(selectedColor)
                                            .frame(width: 280, height: 280)
                                        
                    if let image = postViewModel.convertViewToImage(from: rectangleView) {
                        postViewModel.setImage(image: image)
                    }
                }
                
                Task {
                    if postViewModel.cardData.isComplete() {
                     
                    }
                }
                
                UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
            }) {
                Text("保存")
                    .padding(.horizontal, 120)
                    .padding(.vertical, 15)
                    .font(.system(size: 10, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .background(Color(red: 0.82, green: 0.6, blue: 0.97))
                    .cornerRadius(30)
                    .padding(.bottom, 20)
            }
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
        .environmentObject(PostViewModel())
}
