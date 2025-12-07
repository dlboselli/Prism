//
//  ContentView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeTabView()
                .tabItem {
                    Label("Home", systemImage: selectedTab == .home ? "house.fill" : "house")
                }
                .tag(Tab.home)
            
            FriendsTabView()
                .tabItem {
                    Label("Friends", systemImage: selectedTab == .friends ? "person.2.fill" : "person.2")
                }
                .tag(Tab.friends)
            
            ReelsTabView()
                .tabItem {
                    Label("Video", systemImage: selectedTab == .reels ? "play.square.stack.fill" : "play.square.stack")
                }
                .tag(Tab.reels)
            
            MarketplaceTabView()
                .tabItem {
                    Label("Marketplace", systemImage: selectedTab == .marketplace ? "storefront.fill" : "storefront")
                }
                .tag(Tab.marketplace)
            
            MoreTabView()
                .tabItem {
                    Label("More", systemImage: "line.3.horizontal")
                }
                .tag(Tab.more)
        }
        .tint(Colors.tabSelected)
    }
}

// MARK: - Tab Enum

enum Tab: Hashable {
    case home
    case friends
    case reels
    case marketplace
    case more
}

#Preview {
    ContentView()
}
