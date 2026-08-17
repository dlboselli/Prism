//
//  ActivityTabView.swift
//  Prism
//
//  Activity feed built from PDSNotificationCell and sample data.
//

import SwiftUI

struct ActivityTabView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                Text("Activity")
                    .typography(Typography.headline1Emphasized)
                    .foregroundColor(Colors.textPrimary)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 8)

                ForEach(sampleNotifications) { notification in
                    PDSNotificationCell(
                        type: notification.type.pdsType,
                        actorName: notification.actor.name,
                        actorInitials: initials(for: notification.actor.name),
                        message: notification.message,
                        timestamp: relativeTimeString(from: notification.timestamp),
                        isRead: notification.isRead,
                        actionButtons: notification.type == .friendRequest ? [
                            PDSNotificationAction(title: "Confirm", isPrimary: true) { },
                            PDSNotificationAction(title: "Delete") { }
                        ] : nil
                    )
                }
            }
        }
        .pdsSurfaceBackground()
    }

    private func initials(for name: String) -> String {
        name.split(separator: " ").prefix(2).compactMap(\.first).map(String.init).joined()
    }
}

private extension NotificationType {
    var pdsType: PDSNotificationType {
        switch self {
        case .like: return .like
        case .comment: return .comment
        case .follow: return .follow
        case .mention: return .mention
        case .share: return .share
        case .friendRequest: return .friendRequest
        case .groupInvite: return .groupInvite
        case .birthday: return .birthday
        case .memory: return .memory
        }
    }
}

#Preview {
    NavigationStack {
        ActivityTabView()
    }
}
