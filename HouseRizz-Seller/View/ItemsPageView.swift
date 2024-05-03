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
                Text("Add")
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
