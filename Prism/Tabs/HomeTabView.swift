//
//  HomeTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        PDSEmptyState(
            icon: "house.fill",
            title: "Home",
            message: "Your feed will appear here"
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.backgroundSurface)
    }
}

#Preview {
    NavigationStack {
        HomeTabView()
    }
}
