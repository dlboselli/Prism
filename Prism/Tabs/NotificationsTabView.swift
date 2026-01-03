//
//  NotificationsTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct NotificationsTabView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Notifications")
                    .typography(Typography.headline1Emphasized)
                    .foregroundColor(Colors.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Notifications")
    }
}

#Preview {
    NavigationStack {
        NotificationsTabView()
    }
}

