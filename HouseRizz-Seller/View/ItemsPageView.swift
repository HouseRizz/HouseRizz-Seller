//
//  ItemsPageView.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 03/05/24.
//

import SwiftUI

struct ItemsPageView: View {
    @StateObject private var viewModel = ItemsPageViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Is Signed in: \(viewModel.isSignedInToiCloud)")
                Text("Permission: \(viewModel.permissionStatus)")
                Text("Name: \(viewModel.userName)")
            }
            .navigationTitle("Your Inventory")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddItemView()
                            .toolbarRole(.editor)
                    } label: {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                            .bold()
                    }

                }
            }
        }
    }
}

#Preview {
    ItemsPageView()
}
