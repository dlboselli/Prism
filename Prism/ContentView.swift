//
//  ContentView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            TabView(selection: $selectedTab) {
                HomeTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .home ? "house.fill" : "house")
                    }
                    .tag(Tab.home)
                
                FriendsTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .friends ? "person.2.fill" : "person.2")
                    }
                    .tag(Tab.friends)
                
                SearchTabView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(Tab.search)
                
                ProfileTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .profile ? "person.circle.fill" : "person.circle")
                    }
                    .tag(Tab.profile)
            }
            .tint(Colors.tabSelected)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navigationPath.append(NavigationDestination.more)
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(Colors.iconPrimary)
                    }
                }
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .more:
                    MoreTabView()
                        .navigationTitle("More")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

// MARK: - Navigation Destination

enum NavigationDestination: Hashable {
    case more
}

// MARK: - Tab Enum

enum Tab: Hashable {
    case home
    case friends
    case search
    case profile
}

#Preview {
    ContentView()
}
