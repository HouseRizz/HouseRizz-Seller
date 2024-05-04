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
    @State private var showDeleteOption: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.items.indices, id: \.self) { index in
                            NavigationLink(destination: ProductDetailsView(item:viewModel.items[index])
                                                            .toolbarRole(.editor))
                            {
                                ZStack(alignment: .topLeading) {
                                    HRProductCardView(item: viewModel.items[index])
                                    
                                    Image(systemName: "minus.circle.fill")
                                        .imageScale(.large)
                                        .bold()
                                        .foregroundStyle(.red)
                                        .opacity(showDeleteOption ? 1.0 : 0.0)
                                        .padding(.top,20)
                                        .onTapGesture {
                                            viewModel.deleteItem(indexSet: IndexSet(integer: index))
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .refreshable {
                    viewModel.fetchItems()
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
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showDeleteOption.toggle()
                    } label: {
                        Image(systemName: showDeleteOption ? "minus.circle.fill": "minus.circle" )
                            .imageScale(.large)
                            .bold()
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProductsPageView()
}
