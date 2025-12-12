//
//  ProfileTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct ProfileTabView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(systemName: "person.circle.fill")
                .font(.system(size: 48, weight: .light))
                .foregroundStyle(Colors.iconSecondary)
                .frame(width: 64, height: 64)
            
            Text("Profile")
                .typography(Typography.headline2Emphasized)
                .foregroundColor(Colors.textPrimary)
            
            Text("Manage your account")
                .typography(Typography.body3)
                .foregroundColor(Colors.textSecondary)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.backgroundSurface)
    }
}

#Preview {
    NavigationStack {
        ProfileTabView()
    }
}
