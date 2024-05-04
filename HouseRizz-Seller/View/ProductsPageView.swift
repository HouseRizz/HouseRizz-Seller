//
//  ItemsPageView.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 03/05/24.
//

import SwiftUI

struct ProductsPageView: View {
    @StateObject private var viewModel = ProductsPageViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.items, id: \.self) { item in
                            NavigationLink(destination: ProductDetailsView(item: item).toolbarRole(.editor)) {
                                HRProductCardView(item: item)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("\(viewModel.userName)'s Products")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddProductView()
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
    ProductsPageView()
}
