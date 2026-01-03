//
//  PDSNotificationCell.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Notification cell components for displaying activity notifications
//  with actor avatars, notification type icons, message text, timestamps,
//  and action buttons.
//
//  Usage:
//  ```swift
//  PDSNotificationCell(
//      type: .like,
//      actorName: "John Doe",
//      actorInitials: "JD",
//      message: "liked your post",
//      timestamp: "2h ago",
//      isUnread: true,
//      onTap: { }
//  )
//
//  // With action buttons
//  PDSNotificationCell(
//      type: .friendRequest,
//      actorName: "Jane Smith",
//      message: "sent you a friend request",
//      timestamp: "1d ago",
//      actions: [
//          PDSNotificationAction(title: "Accept", isPrimary: true) { },
//          PDSNotificationAction(title: "Delete") { }
//      ]
//  )
//  ```
//

import SwiftUI

// MARK: - Notification Type

enum PDSNotificationType {
    case like
    case comment
    case follow
    case mention
    case share
    case reply
    case tag
    case friendRequest
    case birthday
    case memory
    case groupInvite
    case eventInvite
    case custom(icon: String, color: Color)
    
    var icon: String {
        switch self {
        case .like: return "heart.fill"
        case .comment: return "bubble.left.fill"
        case .follow: return "person.badge.plus.fill"
        case .mention: return "at"
        case .share: return "arrowshape.turn.up.right.fill"
        case .reply: return "arrowshape.turn.up.left.fill"
        case .tag: return "tag.fill"
        case .friendRequest: return "person.2.fill"
        case .birthday: return "gift.fill"
        case .memory: return "clock.fill"
        case .groupInvite: return "person.3.fill"
        case .eventInvite: return "calendar"
        case .custom(let icon, _): return icon
        }
    }
    
    
    var color: Color {
        switch self {
        case .like: return Colors.persistentNegative
        case .comment: return Colors.persistentAccent
        case .follow: return Colors.persistentAccent
        case .mention: return Colors.persistentAccent
        case .share: return Colors.persistentPositive
        case .reply: return Colors.persistentAccent
        case .tag: return Colors.persistentWarning
        case .friendRequest: return Colors.persistentAccent
        case .birthday: return Colors.persistentWarning
        case .memory: return Colors.persistentAccent
        case .groupInvite: return Colors.persistentAccent
        case .eventInvite: return Colors.persistentWarning
        case .custom(_, let color): return color
        }
    }
}

// MARK: - PDSNotificationCell

/// A notification cell with actor avatar, notification type icon, message, and optional content preview
struct PDSNotificationCell: View {
    let type: PDSNotificationType
    let actorName: String
    let actorURL: URL?
    let actorInitials: String?
    let message: String
    let timestamp: String
    let isRead: Bool
    let thumbnailURL: URL?
    let thumbnailImage: String?
    let actionButtons: [PDSNotificationAction]?
    let customBadgeBorderColor: Color?
    let onTap: (() -> Void)?
    let onActorTap: (() -> Void)?
    
    /// Computed border color based on read state
    private var badgeBorderColor: Color {
        if let custom = customBadgeBorderColor {
            return custom
        }
        return isRead ? Colors.backgroundSurface : Colors.backgroundCard
    }
    
    init(
        type: PDSNotificationType,
        actorName: String,
        actorURL: URL? = nil,
        actorInitials: String? = nil,
        message: String,
        timestamp: String,
        isRead: Bool = false,
        thumbnailURL: URL? = nil,
        thumbnailImage: String? = nil,
        actionButtons: [PDSNotificationAction]? = nil,
        badgeBorderColor: Color? = nil,
        onTap: (() -> Void)? = nil,
        onActorTap: (() -> Void)? = nil
    ) {
        self.type = type
        self.actorName = actorName
        self.actorURL = actorURL
        self.actorInitials = actorInitials
        self.message = message
        self.timestamp = timestamp
        self.isRead = isRead
        self.thumbnailURL = thumbnailURL
        self.thumbnailImage = thumbnailImage
        self.actionButtons = actionButtons
        self.customBadgeBorderColor = badgeBorderColor
        self.onTap = onTap
        self.onActorTap = onActorTap
    }
    
    var body: some View {
        Button(action: { onTap?() }) {
            HStack(alignment: .center, spacing: 12) {
                // Actor with notification type badge
                actorWithBadge
                
                // Content
                VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                    // Message
                    HStack(alignment: .top) {
                        Text(attributedMessage)
                            .typography(Typography.body4)
                            .foregroundColor(Colors.textPrimary)
                            .lineLimit(3)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer(minLength: 8)
                        
                        // Thumbnail
                        if let thumbnailImage = thumbnailImage {
                            Image(thumbnailImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 44, height: 44)
                                .clipShape(RoundedRectangle(cornerRadius: CornerRadius.small))
                        } else if let thumbnailURL = thumbnailURL {
                            AsyncImage(url: thumbnailURL) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } else {
                                    Colors.backgroundDeemphasized
                                }
                            }
                            .frame(width: 44, height: 44)
                            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.small))
                        }
                    }
                    
                    // Timestamp
                    Text(timestamp)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                    
                    // Action buttons
                    if let actions = actionButtons, !actions.isEmpty {
                        HStack(spacing: 8) {
                            ForEach(0..<actions.count, id: \.self) { index in
                                let action = actions[index]
                                Button(action.title) {
                                    action.action()
                                }
                                .pdsButton(
                                    variant: action.isPrimary ? .primary : .secondary,
                                    context: .surface,
                                    size: .small
                                )
                            }
                        }
                        .padding(.top, 4)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(isRead ? Colors.backgroundSurface : Colors.persistentAccentDeemphasized.opacity(0.3))
        }
        .buttonStyle(.plain)
    }
    
    private var actorWithBadge: some View {
        ZStack(alignment: .bottomTrailing) {
            Button(action: { onActorTap?() }) {
                PDSActor(
                    url: actorURL,
                    fallbackInitials: actorInitials ?? String(actorName.prefix(2)),
                    size: .medium
                )
            }
            .buttonStyle(.plain)
            
            // Notification type badge
            Circle()
                .fill(type.color)
                .frame(width: 20, height: 20)
                .overlay(
                    Image(systemName: type.icon)
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                )
                .overlay(
                    Circle()
                        .stroke(badgeBorderColor, lineWidth: 2)
                )
                .offset(x: 4, y: 4)
        }
    }
    
    private var attributedMessage: AttributedString {
        var result = AttributedString(message)
        
        // Bold the actor name if it appears at the start
        if message.hasPrefix(actorName) {
            if let range = result.range(of: actorName) {
                result[range].font = Typography.body4Link.font
            }
        }
        
        return result
    }
}

// MARK: - Notification Action

struct PDSNotificationAction {
    let title: String
    let isPrimary: Bool
    let action: () -> Void
    
    init(title: String, isPrimary: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.isPrimary = isPrimary
        self.action = action
    }
}

// MARK: - Preview

#Preview("PDSNotificationCell") {
    ScrollView {
        VStack(spacing: 0) {
            PDSNotificationCell(
                type: .like,
                actorName: "John Doe",
                actorInitials: "JD",
                message: "John Doe liked your photo.",
                timestamp: "2h"
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSNotificationCell(
                type: .comment,
                actorName: "Jane Smith",
                actorInitials: "JS",
                message: "Jane Smith commented on your post: \"This is amazing!\"",
                timestamp: "1h",
                isRead: true
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSNotificationCell(
                type: .follow,
                actorName: "Alex Chen",
                actorInitials: "AC",
                message: "Alex Chen started following you.",
                timestamp: "30m"
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSNotificationCell(
                type: .friendRequest,
                actorName: "Sarah Wilson",
                actorInitials: "SW",
                message: "Sarah Wilson sent you a friend request.",
                timestamp: "5m",
                actionButtons: [
                    PDSNotificationAction(title: "Accept", isPrimary: true, action: {}),
                    PDSNotificationAction(title: "Decline", action: {})
                ]
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSNotificationCell(
                type: .birthday,
                actorName: "Mike Johnson",
                actorInitials: "MJ",
                message: "It's Mike Johnson's birthday today!",
                timestamp: "Today"
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSNotificationCell(
                type: .mention,
                actorName: "Emily Brown",
                actorInitials: "EB",
                message: "Emily Brown mentioned you in a comment.",
                timestamp: "3h",
                isRead: true
            )
        }
    }
    .background(Colors.backgroundSurface)
}

