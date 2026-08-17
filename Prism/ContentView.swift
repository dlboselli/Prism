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
    @AppStorage(PrototypeSettings.showActivityBadge) private var showActivityBadge = true

    var body: some View {
        NavigationStack(path: $navigationPath) {
            TabView(selection: $selectedTab) {
                HomeTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .home ? "house.fill" : "house")
                    }
                    .tag(Tab.home)

                ExploreTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .explore ? "map.fill" : "map")
                    }
                    .tag(Tab.explore)

                ActivityTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .activity ? "bell.fill" : "bell")
                    }
                    .tag(Tab.activity)
                    .badge(showActivityBadge ? unreadNotificationCount : 0)

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
                        Image(systemName: "square.grid.2x2")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(Colors.iconPrimary)
                    }
                    .accessibilityLabel("Components")
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
    case explore
    case activity
    case profile
}

#Preview {
    ContentView()
}
