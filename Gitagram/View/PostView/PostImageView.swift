//
//  PostImageView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI
import PhotosUI

struct PostImageView: View {
    @State var cardData: CardDataModel
    @State var showImagePicker = false
    @State var selectedPhoto: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            ProgressView("", value: 1)
                .tint(Color.pink)
                .cornerRadius(8)
                .scaleEffect(1.3)
                .padding(.bottom, 20)
            
            Text("リポジトリの画像を貼ろう")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .font(.system(size: 30, weight: .black, design: .default))
                .padding(.bottom,30)
            
            Spacer()
            
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
                    cardData = cardData.setImage(from: loadedImage ?? cardData.productImage)
                }
            }
            .padding(.bottom,20)
            
            Button(action: {
                Task {
                    if cardData.isComplete() {
                        await PostProductUseCase().execute(product: cardData.product, productImage: cardData.productImage)
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
    PostImageView(cardData: .Empty())
}
