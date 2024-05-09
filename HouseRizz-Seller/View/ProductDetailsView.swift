//
//  ProductDetailsView.swift
//  HouseRizz-iOS
//
//  Created by Krish Mittal on 12/04/24.
//

import SwiftUI
import RealityKit
import QuickLook

struct ProductDetailsView: View {
    var item: HRProduct
    private var imageUrls: [URL?] {
        [item.imageURL1, item.imageURL2, item.imageURL3]
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(imageUrls.compactMap({ $0 }), id: \.self) { url in
                            if let data = try? Data(contentsOf: url),
                               let image = UIImage(data: data) {
                                Image(uiImage: image)
                                    .resizable()
                                    .ignoresSafeArea(edges: .top)
                                    .frame(width: 320, height: 300)
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.title2.bold())
                            
                            Text(item.category)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Text("₹\(item.price ?? 0)")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    .padding(.vertical)
                    
                    if let modelURL = item.modelURL, let modelData = try? Data(contentsOf: modelURL) {
                        Text("\(modelData)")
                    }
                    
                    
                    Text("Description")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text(item.description ?? "")
                    
                    
                    
                    Spacer()
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .offset(y: -30)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

//struct ModelView: UIViewRepresentable {
//    let modelData: Data
//    
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero)
//        let scene = try? ProductExperience.loadScene()
//        
//        if let scene = scene {
//            arView.scene.anchors.append(scene)
//        }
//        
//        return arView
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {}
//}
