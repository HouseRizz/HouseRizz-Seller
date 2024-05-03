//
//  AddItemViewModel.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 03/05/24.
//

import Foundation

class AddItemViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var price: Int = 0
    @Published var imageURL: String = ""
}
