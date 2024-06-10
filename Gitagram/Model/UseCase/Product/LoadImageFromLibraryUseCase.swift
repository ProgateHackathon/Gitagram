//
//  LoadImageFromLibraryUseCase.swift
//  Gitagram
//
//  Created by saki on 2024/05/27.
//

import SwiftUI
import PhotosUI
class LoadImageFromLibraryUseCase {
    func execute(_ pickerItem: PhotosPickerItem) async -> UIImage? {
        if let data = try? await pickerItem.loadTransferable(type: Data.self) {
            return UIImage(data: data)
        }
        
        return nil;
    }
}

