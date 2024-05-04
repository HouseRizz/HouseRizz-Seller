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
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            Group {
                ProductsPageView()
                    .tabItem { Label("Products", systemImage: "list.bullet")}
                OrdersPageView()
                    .tabItem { Label("Orders", systemImage: "bag") }
                ProfilePageView()
                    .tabItem { Label("Profile", systemImage: "person") }
            }
        }
    }
}

#Preview {
    MainView()
}
