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
        NavigationStack{
            ZStack{
                TabView {
                    Group {
                        ItemsPageView()
                            .tabItem { Label("Items", systemImage: "list.bullet")}
                        OrdersPageView()
                            .tabItem { Label("Orders", systemImage: "bag") }
                        ProfilePageView()
                            .tabItem { Label("Profile", systemImage: "person") }
                    }
                }
            }
            .navigationTitle("HouseRizz Seller")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MainView()
}
