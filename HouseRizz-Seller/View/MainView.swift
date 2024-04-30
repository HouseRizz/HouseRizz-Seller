//
//  ContentView.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 30/04/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = Authentication()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        } else {
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
