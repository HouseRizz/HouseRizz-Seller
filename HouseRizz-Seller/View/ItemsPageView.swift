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
                List {
                    ForEach(viewModel.items, id: \.self) { item in
                        HStack {
                            Text(item.name)
                            
                            if let url = item.imageURL, let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 50,height: 50)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("\(viewModel.userName)'s Inventory")
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
