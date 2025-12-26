import SwiftUI

// MARK: - List Cell View

/// PDS List Cell - a styled row component for lists
struct PDSListCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    var showChevron: Bool = false
    var action: (() -> Void)? = nil
    
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 12) {
            // Leading icon
            if let iconName = leadingIcon {
                PDSIconLeading(systemName: iconName, color: leadingIconColor)
            }
            
            // Text content
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .typography(Typography.body2)
                    .foregroundColor(Colors.textPrimary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.body4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer()
            
            // Chevron for navigation
            if showChevron {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Colors.iconSecondary)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(isPressed ? Colors.backgroundDeemphasized : Colors.backgroundCard)
        .contentShape(Rectangle())
        .onTapGesture {
            if action != nil {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = false
                    }
                    action?()
                }
            }
        }
    }
}

// MARK: - Navigation Cell

/// PDS Navigation Cell - list cell with chevron for navigation
struct PDSNavigationCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    var action: () -> Void
    
    var body: some View {
        PDSListCell(
            title: title,
            subtitle: subtitle,
            leadingIcon: leadingIcon,
            leadingIconColor: leadingIconColor,
            showChevron: true,
            action: action
        )
    }
}

// MARK: - Toggle Cell

/// PDS Toggle Cell - list cell with a toggle switch
struct PDSToggleCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    @Binding var isOn: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            if let iconName = leadingIcon {
                PDSIconLeading(systemName: iconName)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .typography(Typography.body2)
                    .foregroundColor(Colors.textPrimary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.body4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer()
            
            PDSSwitch(isOn: $isOn)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Colors.backgroundCard)
    }
}

// MARK: - Avatar Cell

/// PDS Avatar Cell - list cell with avatar for user/contact lists
struct PDSAvatarCell: View {
    let title: String
    var subtitle: String? = nil
    var avatarURL: URL? = nil
    var avatarImage: String? = nil
    var avatarInitials: String? = nil
    var avatarBadge: PDSActorBadgeType? = nil
    var avatarSize: PDSActorSize = .medium
    var showChevron: Bool = false
    var action: (() -> Void)? = nil
    
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 12) {
            // Avatar using PDSActor
            actorView
            
            // Text content
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .typography(Typography.body2)
                    .foregroundColor(Colors.textPrimary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.body4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer()
            
            if showChevron {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Colors.iconSecondary)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(isPressed ? Colors.backgroundDeemphasized : Colors.backgroundCard)
        .contentShape(Rectangle())
        .onTapGesture {
            if action != nil {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = false
                    }
                    action?()
                }
            }
        }
    }
    
    @ViewBuilder
    private var actorView: some View {
        if let url = avatarURL {
            PDSActor(url: url, size: avatarSize, badge: avatarBadge)
        } else if let image = avatarImage {
            PDSActor(image: image, size: avatarSize, badge: avatarBadge)
        } else if let initials = avatarInitials {
            PDSActor(initials: initials, size: avatarSize, badge: avatarBadge)
        } else {
            PDSActor(size: avatarSize, badge: avatarBadge)
        }
    }
}

// MARK: - Helper Views

/// Helper for creating cells with SF Symbol icons
struct PDSIconLeading: View {
    let systemName: String
    var color: Color = Colors.iconSecondary
    var backgroundColor: Color = Colors.backgroundDeemphasized
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(color)
            .frame(width: 36, height: 36)
            .background(
                RoundedRectangle(cornerRadius: CornerRadius.button)
                    .fill(backgroundColor)
            )
    }
}

// MARK: - Preview

#Preview("List Cell Styles") {
    ScrollView {
        VStack(spacing: 0) {
            // Section header
            HStack {
                Text("SETTINGS")
                    .typography(Typography.meta1)
                    .foregroundColor(Colors.textSecondary)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            // Basic cells
            PDSListCell(title: "Profile")
            
            Divider()
                .padding(.leading, 16)
            
            PDSListCell(title: "Account", subtitle: "john@example.com")
            
            Divider()
                .padding(.leading, 16)
            
            // Navigation cells
            PDSNavigationCell(title: "Privacy") { }
            
            Divider()
                .padding(.leading, 16)
            
            PDSNavigationCell(title: "Notifications", subtitle: "Push, Email, SMS") { }
            
            // Section header
            HStack {
                Text("PREFERENCES")
                    .typography(Typography.meta1)
                    .foregroundColor(Colors.textSecondary)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .padding(.top, 16)
            
            // Cells with icons
            PDSListCell(
                title: "Language",
                subtitle: "English",
                leadingIcon: "globe",
                action: { }
            )
            
            Divider()
                .padding(.leading, 64)
            
            PDSNavigationCell(
                title: "Appearance",
                leadingIcon: "paintbrush",
                leadingIconColor: Colors.persistentAccent
            ) { }
            
            Divider()
                .padding(.leading, 64)
            
            // Toggle cells
            PDSToggleCell(
                title: "Dark Mode",
                isOn: .constant(true)
            )
            
            Divider()
                .padding(.leading, 16)
            
            PDSToggleCell(
                title: "Notifications",
                subtitle: "Receive push notifications",
                isOn: .constant(false)
            )
            
            // Section with avatars
            HStack {
                Text("RECENT")
                    .typography(Typography.meta1)
                    .foregroundColor(Colors.textSecondary)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .padding(.top, 16)
            
            PDSAvatarCell(
                title: "John Doe",
                subtitle: "Last seen 5 min ago",
                avatarInitials: "JD",
                avatarBadge: .offline,
                action: { }
            )
            
            Divider()
                .padding(.leading, 72)
            
            PDSAvatarCell(
                title: "Jane Smith",
                subtitle: "Online",
                avatarInitials: "JS",
                avatarBadge: .online,
                showChevron: true,
                action: { }
            )
        }
    }
    .background(Colors.backgroundSurface)
}
