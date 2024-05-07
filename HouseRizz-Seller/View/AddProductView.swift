//
//  AddItemView.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 03/05/24.
//

import SwiftUI
import PhotosUI

struct AddProductView: View {
    @StateObject private var viewModel = AddProductViewModel()
    @State private var photoPickerItems = [PhotosPickerItem]()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Divider()
                
                HStack {
                    Text("Upload photos(0/3)")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    PhotosPicker(selection: $photoPickerItems, maxSelectionCount: 3, matching: .images) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 60,height: 40)
                                .foregroundStyle(Color.secondaryColor)
                            Text("Add")
                                .font(.system(.title3, design: .rounded))
                                .bold()
                                .foregroundStyle(Color.primaryColor)
                        }
                    }
                    .onChange(of: photoPickerItems) {
                        Task {
                            viewModel.selectedPhotoData.removeAll()
                            for item in photoPickerItems {
                                if let imageData = try await item.loadTransferable(type: Data.self) {
                                    viewModel.selectedPhotoData.append(imageData)
                                }
                            }
                        }
                    }
                }
                
                if viewModel.selectedPhotoData.count > 0 {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<viewModel.selectedPhotoData.count, id: \.self) { index in
                                Image(uiImage: UIImage(data: viewModel.selectedPhotoData[index])!)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                        }
                    }
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    
                } else {
                    ZStack {
                        Color.gray.opacity(0.2)
                        
                        Rectangle()
                            .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [3]))
                        
                        HStack {
                            Image(systemName: "plus.circle")
                            
                            Text("Add Photos")
                                .font(.system(.subheadline, design: .rounded))
                        }
                    }
                    .foregroundStyle(.gray)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Item Name", text: $viewModel.name)
                        .font(.system(.title3, design: .rounded))
                        .padding(15)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                    VStack(alignment:.leading) {
                        Text("Set Price")
                            .foregroundStyle(.gray)
                        TextField("Price", value: $viewModel.price, formatter: NumberFormatter())
                            .font(.system(.title3, design: .rounded))
                            .padding(15)
                            .background(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }
                    
                    TextField("Description", text: $viewModel.description, axis: .vertical)
                        .lineLimit(2...15)
                        .font(.system(.title3, design: .rounded))
                        .padding(15)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("Set Category")
                        
                        Spacer()
                        
                        Picker("Category", selection: $viewModel.selectedCategory) {
                            ForEach(Category.allCases, id: \.self) {
                                Text($0.title)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Add 3D Model")
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("Select/Make Model")
                            }
                        }
                        
                        Text("(Optional)")
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.top,50)
                
                Divider()
                
                Spacer()
                
                HRButton(label: "Add") {
                    viewModel.addButtonPressed()
                }
                .padding(.bottom, 20)
            }
            .padding()
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddProductView()
}
