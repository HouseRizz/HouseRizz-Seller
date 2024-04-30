//
//  HouseRizz_SellerApp.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 30/04/24.
//

import SwiftUI
import FirebaseCore

@main
struct HouseRizz_SellerApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
