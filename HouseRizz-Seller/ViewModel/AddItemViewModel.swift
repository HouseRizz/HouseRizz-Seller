//
//  AddItemViewModel.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 03/05/24.
//

import SwiftUI
import Combine

class AddItemViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var price: Int = 0
    @Published var imageURL: String = ""
    @Published var items: [HRSellItem] = []
    @Published var selectedPhotoData = [Data]()
    var cancellables = Set<AnyCancellable>()
    
    func addButtonPressed(){
        guard !name.isEmpty else {return}
        addItem(name: name)
    
    }
    
    private func addItem(name:String) {
        guard
            let image =  UIImage(data: selectedPhotoData[0]),
            let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("photo.jpg"),
            let data = image.jpegData(compressionQuality: 1.0) else {return}
        
        do {
            try data.write(to: url)
            guard let newItem = HRSellItem(name: name, description: description, price: price, imageURL: url) else {return}
            CKUtility.add(item: newItem) { result in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.name = ""
                }
            }
        } catch let error {
            print(error)
        }
    }
}
