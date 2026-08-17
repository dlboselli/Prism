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
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(Tab.home)

                ExploreTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .explore ? "map.fill" : "map")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(Tab.explore)

                ActivityTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .activity ? "heart.fill" : "heart")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(Tab.activity)
                    .badge(showActivityBadge ? unreadNotificationCount : 0)

                ProfileTabView()
                    .tabItem {
                        Image(systemName: selectedTab == .profile ? "person.fill" : "person")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(Tab.profile)
            }
            .navigationTitle(selectedTab.title)
            .navigationBarTitleDisplayMode(.large)
            .tint(Colors.tabSelected)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navigationPath.append(NavigationDestination.components)
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
                case .components:
                    ComponentsView()
                        .navigationTitle("Components")
                        .navigationBarTitleDisplayMode(.large)
                }
            }
        }
    }
}

// MARK: - Navigation Destination

enum NavigationDestination: Hashable {
    case components
}

// MARK: - Tab Enum

enum Tab: Hashable {
    case home
    case explore
    case activity
    case profile

    var title: String {
        switch self {
        case .home: return "Home"
        case .explore: return "Explore"
        case .activity: return "Activity"
        case .profile: return "Profile"
        }
    }
}

#Preview {
    ContentView()
}
