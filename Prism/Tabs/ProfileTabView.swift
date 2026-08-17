//
//  ProfileTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct ProfileTabView: View {
    var body: some View {
        PDSEmptyState(
            icon: "person.fill",
            title: "Set up your profile",
            message: "Manage your account"
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.backgroundSurface)
    }
}

#Preview {
    NavigationStack {
        ProfileTabView()
    }
}
