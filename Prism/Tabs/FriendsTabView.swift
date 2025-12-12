//
//  FriendsTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct FriendsTabView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(systemName: "person.2.fill")
                .font(.system(size: 48, weight: .light))
                .foregroundStyle(Colors.iconSecondary)
                .frame(width: 64, height: 64)
            
            Text("Friends")
                .typography(Typography.headline2Emphasized)
                .foregroundColor(Colors.textPrimary)
            
            Text("Connect with your friends")
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
        FriendsTabView()
    }
}
