//
//  PostImageView.swift
//  Gitagram
//
//  Created by saki on 2024/05/04.
//

import SwiftUI
import PhotosUI

struct PostImageView: View {
    
    @State var next = false
    @State var developer: Developer
    @State var showImagePicker = false
    @State var image: UIImage?
    @State private var selectedPhoto: PhotosPickerItem?
    @Binding var title: String
    @Binding var discription: String
    @Binding var url: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            ProgressView("", value: 1)
            
            
                .tint(Color.pink)
            
                .cornerRadius(8)
                .scaleEffect(1.3)
            
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
                .onChange(of: selectedPhoto) { selectedPhoto in
                    Task { await loadImageFromSelectedPhoto(photo: selectedPhoto) }
                }
            
            .padding(.bottom,20)

            Button(action: {
                next.toggle()
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
        .onChange(of: next){
            //ここで保存だよ
            Task{
                do{
                    await PostProductUseCase().execute(product: Product(title: title, content: discription, developerId: developer.id, url: url), productImage: (image ?? UIImage(named: "back"))!
                )}
            }
            
        }
    
        
        .onAppear(){
            Task{
                do{
                    
                    developer = await GetLoginDeveloperUseCase().execute()!
                }
                
            }
            
        }
        
    }
    private func loadImageFromSelectedPhoto(photo: PhotosPickerItem?) async {
        if let data = try? await photo?.loadTransferable(type: Data.self) {
            self.image = UIImage(data: data)
        }
    }
    
}

#Preview {
    PostImageView(developer: Developer(githubId: "am2525nyan"), title: .constant(""), discription: .constant(""), url: .constant(""))
}
