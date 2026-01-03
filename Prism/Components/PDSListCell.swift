import SwiftUI

// MARK: - Cell Configuration

/// Configuration for cell appearance and behavior
struct PDSCellConfiguration {
    var horizontalPadding: CGFloat = Spacing.cellHorizontal
    var verticalPadding: CGFloat = Spacing.cellVertical
    var contentSpacing: CGFloat = Spacing.sm
    var showDivider: Bool = true
    var dividerLeadingInset: CGFloat = 16
    var backgroundColor: Color = Colors.backgroundCardFlat
    var pressedBackgroundColor: Color = Colors.backgroundDeemphasized
    
    static let `default` = PDSCellConfiguration()
    
    /// Configuration for cells with leading icons
    static let withIcon = PDSCellConfiguration(dividerLeadingInset: 64)
    
    /// Configuration for cells with avatars
    static let withAvatar = PDSCellConfiguration(dividerLeadingInset: 72)
}

// MARK: - Cell Button Style

/// Button style for list cells with press state animation
struct PDSCellButtonStyle: ButtonStyle {
    var backgroundColor: Color = Colors.backgroundCard
    var pressedBackgroundColor: Color = Colors.backgroundDeemphasized
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? pressedBackgroundColor : backgroundColor)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Core List Cell

/// PDS List Cell - Composable cell with flexible leading and trailing accessories
///
/// Usage:
/// ```swift
/// // Simple cell
/// PDSCell("Profile")
///
/// // With subtitle
/// PDSCell("Account", subtitle: "john@example.com")
///
/// // With accessories
/// PDSCell("Privacy") {
///     PDSCellChevron()
/// }
///
/// // Full configuration
/// PDSCell("Messages", subtitle: "3 unread") {
///     PDSCellIcon(systemName: "message.fill", color: .blue)
/// } trailing: {
///     PDSCellBadge(count: 3)
/// } action: {
///     navigateToMessages()
/// }
/// ```
struct PDSCell<LeadingAccessory: View, TrailingAccessory: View>: View {
    let title: String
    var subtitle: String? = nil
    var titleColor: Color = Colors.textPrimary
    var subtitleColor: Color = Colors.textSecondary
    var configuration: PDSCellConfiguration = .default
    let leadingAccessory: LeadingAccessory
    let trailingAccessory: TrailingAccessory
    var action: (() -> Void)? = nil
    
    // MARK: - Initializers
    
    init(
        _ title: String,
        subtitle: String? = nil,
        titleColor: Color = Colors.textPrimary,
        subtitleColor: Color = Colors.textSecondary,
        configuration: PDSCellConfiguration = .default,
        @ViewBuilder leading: () -> LeadingAccessory,
        @ViewBuilder trailing: () -> TrailingAccessory,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.configuration = configuration
        self.leadingAccessory = leading()
        self.trailingAccessory = trailing()
        self.action = action
    }
    
    var body: some View {
        if let action = action {
            Button(action: action) {
                cellContent
            }
            .buttonStyle(PDSCellButtonStyle(
                backgroundColor: configuration.backgroundColor,
                pressedBackgroundColor: configuration.pressedBackgroundColor
            ))
            .accessibilityLabel(title)
            .accessibilityHint(subtitle ?? "")
        } else {
            cellContent
                .background(configuration.backgroundColor)
        }
    }
    
    private var cellContent: some View {
        HStack(spacing: configuration.contentSpacing) {
            leadingAccessory
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text(title)
                    .typography(Typography.headline4)
                    .foregroundColor(titleColor)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.meta4)
                        .foregroundColor(subtitleColor)
                }
            }
            
            Spacer(minLength: 0)
            
            trailingAccessory
        }
        .padding(.horizontal, configuration.horizontalPadding)
        .padding(.vertical, configuration.verticalPadding)
        .contentShape(Rectangle())
    }
}

// MARK: - Convenience Initializers

extension PDSCell where LeadingAccessory == EmptyView, TrailingAccessory == EmptyView {
    /// Simple cell with just title
    init(_ title: String, subtitle: String? = nil, action: (() -> Void)? = nil) {
        self.init(title, subtitle: subtitle, leading: { EmptyView() }, trailing: { EmptyView() }, action: action)
    }
}

extension PDSCell where LeadingAccessory == EmptyView {
    /// Cell with trailing accessory only
    init(
        _ title: String,
        subtitle: String? = nil,
        @ViewBuilder trailing: () -> TrailingAccessory,
        action: (() -> Void)? = nil
    ) {
        self.init(title, subtitle: subtitle, leading: { EmptyView() }, trailing: trailing, action: action)
    }
}

extension PDSCell where TrailingAccessory == EmptyView {
    /// Cell with leading accessory only
    init(
        _ title: String,
        subtitle: String? = nil,
        configuration: PDSCellConfiguration = .withIcon,
        @ViewBuilder leading: () -> LeadingAccessory,
        action: (() -> Void)? = nil
    ) {
        self.init(title, subtitle: subtitle, configuration: configuration, leading: leading, trailing: { EmptyView() }, action: action)
    }
}

// MARK: - Cell Accessories

/// Chevron indicator for navigation cells
struct PDSCellChevron: View {
    var color: Color = Colors.iconSecondary
    
    var body: some View {
        Image(systemName: "chevron.right")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(color)
    }
}

/// Checkmark indicator for selection cells
struct PDSCellCheckmark: View {
    let isSelected: Bool
    var color: Color = Colors.persistentAccent
    
    var body: some View {
        if isSelected {
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(color)
        }
    }
}

/// Radio button indicator for single-selection cells
struct PDSCellRadio: View {
    let isSelected: Bool
    var selectedColor: Color = Colors.persistentAccent
    var unselectedColor: Color = Colors.iconSecondary
    
    var body: some View {
        Circle()
            .strokeBorder(isSelected ? selectedColor : unselectedColor, lineWidth: 2)
            .background(
                Circle()
                    .fill(isSelected ? selectedColor : Color.clear)
                    .padding(4)
            )
            .frame(width: 22, height: 22)
    }
}

/// Status dot indicator
struct PDSCellStatusDot: View {
    let status: PDSStatusType
    
    var body: some View {
        Circle()
            .fill(status.color)
            .frame(width: 8, height: 8)
    }
}

/// Leading icon with background
struct PDSCellIcon: View {
    let systemName: String
    var color: Color = Colors.iconSecondary
    var backgroundColor: Color = Colors.backgroundDeemphasized
    var size: CGFloat = 36
    var iconSize: CGFloat = 18
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: iconSize, weight: .medium))
            .foregroundColor(color)
            .frame(width: size, height: size)
            .background(
                RoundedRectangle(cornerRadius: CornerRadius.button)
                    .fill(backgroundColor)
            )
            .accessibilityHidden(true)
    }
}

/// Count badge for cells
struct PDSCellBadge: View {
    let count: Int
    var variant: PDSBadgeVariant = .accent
    var size: PDSBadgeSize = .small
    
    var body: some View {
        PDSBadge("\(count)", variant: variant, size: size)
    }
}

// MARK: - Cell Group

/// Groups cells with card styling
///
/// Usage:
/// ```swift
/// PDSCellGroup {
///     PDSCell("Profile")
///     PDSCell("Account", subtitle: "john@example.com")
///     PDSCell("Settings") { PDSCellChevron() }
/// }
/// ```
struct PDSCellGroup<Content: View>: View {
    var cornerRadius: CGFloat = CornerRadius.card
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(spacing: 0) {
            content
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

// MARK: - Specialized Cell Types

// MARK: Navigation Cell

/// Navigation cell with chevron
struct PDSNavigationCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    var action: () -> Void
    
    var body: some View {
        if let icon = leadingIcon {
            PDSCell(title, subtitle: subtitle, configuration: .withIcon) {
                PDSCellIcon(systemName: icon, color: leadingIconColor)
            } trailing: {
                PDSCellChevron()
            } action: {
                action()
            }
        } else {
            PDSCell(title, subtitle: subtitle) {
                PDSCellChevron()
            } action: {
                action()
            }
        }
    }
}

// MARK: Toggle Cell

/// Cell with toggle switch
struct PDSToggleCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    @Binding var isOn: Bool
    var isEnabled: Bool = true
    
    var body: some View {
        HStack(spacing: Spacing.sm) {
            if let icon = leadingIcon {
                PDSCellIcon(systemName: icon, color: leadingIconColor)
            }
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text(title)
                    .typography(Typography.headline4)
                    .foregroundColor(isEnabled ? Colors.textPrimary : Colors.textDisabled)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.meta4)
                        .foregroundColor(isEnabled ? Colors.textSecondary : Colors.textDisabled)
                }
            }
            
            Spacer(minLength: 0)
            
            PDSSwitch(isOn: $isOn, isEnabled: isEnabled)
        }
        .padding(.horizontal, Spacing.cellHorizontal)
        .padding(.vertical, Spacing.cellVertical)
        .background(Colors.backgroundCard)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(title)
        .accessibilityValue(isOn ? "On" : "Off")
        .accessibilityHint(subtitle ?? "Double tap to toggle")
    }
}

// MARK: Checkmark Cell

/// Cell with checkmark for multi-selection
struct PDSCheckmarkCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    @Binding var isSelected: Bool
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack(spacing: Spacing.sm) {
                if let icon = leadingIcon {
                    PDSCellIcon(systemName: icon, color: leadingIconColor)
                }
                
                VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                    Text(title)
                        .typography(Typography.headline4)
                        .foregroundColor(Colors.textPrimary)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
                
                Spacer(minLength: 0)
                
                PDSCellCheckmark(isSelected: isSelected)
            }
            .padding(.horizontal, Spacing.cellHorizontal)
            .padding(.vertical, Spacing.cellVertical)
            .contentShape(Rectangle())
        }
        .buttonStyle(PDSCellButtonStyle())
        .accessibilityLabel(title)
        .accessibilityValue(isSelected ? "Selected" : "Not selected")
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

// MARK: Radio Cell

/// Cell with radio button for single-selection
struct PDSRadioCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    let isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.sm) {
                if let icon = leadingIcon {
                    PDSCellIcon(systemName: icon, color: leadingIconColor)
                }
                
                VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                    Text(title)
                        .typography(Typography.headline4)
                        .foregroundColor(Colors.textPrimary)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
                
                Spacer(minLength: 0)
                
                PDSCellRadio(isSelected: isSelected)
            }
            .padding(.horizontal, Spacing.cellHorizontal)
            .padding(.vertical, Spacing.cellVertical)
            .contentShape(Rectangle())
        }
        .buttonStyle(PDSCellButtonStyle())
        .accessibilityLabel(title)
        .accessibilityValue(isSelected ? "Selected" : "Not selected")
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

// MARK: Status Cell

/// Status type for PDSStatusCell
enum PDSStatusType {
    case online
    case away
    case busy
    case offline
    
    var color: Color {
        switch self {
        case .online: return Colors.persistentPositive
        case .away: return Colors.persistentWarning
        case .busy: return Colors.persistentNegative
        case .offline: return Colors.gray400
        }
    }
    
    var label: String {
        switch self {
        case .online: return "Online"
        case .away: return "Away"
        case .busy: return "Busy"
        case .offline: return "Offline"
        }
    }
}

/// Cell with status dot indicator
struct PDSStatusCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    let status: PDSStatusType
    var showChevron: Bool = false
    var action: (() -> Void)? = nil
    
    private var displaySubtitle: String {
        subtitle ?? status.label
    }
    
    var body: some View {
        if let action = action {
            Button(action: action) {
                cellContent
            }
            .buttonStyle(PDSCellButtonStyle())
            .accessibilityLabel(title)
            .accessibilityValue(status.label)
        } else {
            cellContent
                .background(Colors.backgroundCard)
        }
    }
    
    private var cellContent: some View {
        HStack(spacing: Spacing.sm) {
            if let icon = leadingIcon {
                PDSCellIcon(systemName: icon, color: leadingIconColor)
            }
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text(title)
                    .typography(Typography.headline4)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 6) {
                    PDSCellStatusDot(status: status)
                    
                    Text(displaySubtitle)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer(minLength: 0)
            
            if showChevron {
                PDSCellChevron()
            }
        }
        .padding(.horizontal, Spacing.cellHorizontal)
        .padding(.vertical, Spacing.cellVertical)
        .contentShape(Rectangle())
    }
}

// MARK: Badge Cell

/// Cell with count badge
struct PDSBadgeCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    let count: Int
    var badgeVariant: PDSBadgeVariant = .accent
    var showChevron: Bool = false
    var action: (() -> Void)? = nil
    
    var body: some View {
        if let action = action {
            Button(action: action) {
                cellContent
            }
            .buttonStyle(PDSCellButtonStyle())
            .accessibilityLabel(title)
            .accessibilityValue("\(count) items")
        } else {
            cellContent
                .background(Colors.backgroundCard)
        }
    }
    
    private var cellContent: some View {
        HStack(spacing: Spacing.sm) {
            if let icon = leadingIcon {
                PDSCellIcon(systemName: icon, color: leadingIconColor)
            }
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text(title)
                    .typography(Typography.headline4)
                    .foregroundColor(Colors.textPrimary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer(minLength: 0)
            
            PDSCellBadge(count: count, variant: badgeVariant)
            
            if showChevron {
                PDSCellChevron()
            }
        }
        .padding(.horizontal, Spacing.cellHorizontal)
        .padding(.vertical, Spacing.cellVertical)
        .contentShape(Rectangle())
    }
}

// MARK: Avatar Cell

/// Cell with avatar for user/contact lists
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
    
    var body: some View {
        if let action = action {
            Button(action: action) {
                cellContent
            }
            .buttonStyle(PDSCellButtonStyle())
            .accessibilityLabel(title)
            .accessibilityHint(subtitle ?? "")
        } else {
            cellContent
                .background(Colors.backgroundCard)
        }
    }
    
    private var cellContent: some View {
        HStack(spacing: Spacing.sm) {
            actorView
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text(title)
                    .typography(Typography.headline4)
                    .foregroundColor(Colors.textPrimary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer(minLength: 0)
            
            if showChevron {
                PDSCellChevron()
            }
        }
        .padding(.horizontal, Spacing.cellHorizontal)
        .padding(.vertical, Spacing.cellVertical)
        .contentShape(Rectangle())
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

// MARK: Detail Cell

/// Cell with right-aligned detail value (iOS Settings style)
struct PDSDetailCell: View {
    let title: String
    let detail: String
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    var showChevron: Bool = false
    var action: (() -> Void)? = nil
    
    var body: some View {
        if let action = action {
            Button(action: action) {
                cellContent
            }
            .buttonStyle(PDSCellButtonStyle())
            .accessibilityLabel(title)
            .accessibilityValue(detail)
        } else {
            cellContent
                .background(Colors.backgroundCard)
        }
    }
    
    private var cellContent: some View {
        HStack(spacing: Spacing.sm) {
            if let icon = leadingIcon {
                PDSCellIcon(systemName: icon, color: leadingIconColor)
            }
            
            Text(title)
                .typography(Typography.headline4)
                .foregroundColor(Colors.textPrimary)
            
            Spacer(minLength: 0)
            
            Text(detail)
                .typography(Typography.meta4)
                .foregroundColor(Colors.textSecondary)
            
            if showChevron {
                PDSCellChevron()
            }
        }
        .padding(.horizontal, Spacing.cellHorizontal)
        .padding(.vertical, Spacing.cellVertical)
        .contentShape(Rectangle())
    }
}

// MARK: Destructive Cell

/// Cell with red styling for dangerous actions
struct PDSDestructiveCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            cellContent
        }
        .buttonStyle(PDSCellButtonStyle())
        .accessibilityLabel(title)
        .accessibilityHint(subtitle ?? "")
    }
    
    private var cellContent: some View {
        HStack(spacing: Spacing.sm) {
            if let icon = leadingIcon {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Colors.persistentNegative)
                    .frame(width: 36, height: 36)
                    .background(
                        RoundedRectangle(cornerRadius: CornerRadius.button)
                            .fill(Colors.persistentNegative.opacity(0.12))
                    )
            }
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text(title)
                    .typography(Typography.headline4)
                    .foregroundColor(Colors.persistentNegative)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, Spacing.cellHorizontal)
        .padding(.vertical, Spacing.cellVertical)
        .contentShape(Rectangle())
    }
}

// MARK: Action Cell

/// Cell with action button on right
struct PDSActionCell: View {
    let title: String
    var subtitle: String? = nil
    var leadingIcon: String? = nil
    var leadingIconColor: Color = Colors.iconSecondary
    let actionTitle: String
    var actionVariant: PDSButtonVariant = .primary
    var onAction: () -> Void
    var onCellTap: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: Spacing.sm) {
            if let icon = leadingIcon {
                PDSCellIcon(systemName: icon, color: leadingIconColor)
            }
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text(title)
                    .typography(Typography.headline4)
                    .foregroundColor(Colors.textPrimary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Spacer(minLength: 0)
            
            Button(actionTitle, action: onAction)
                .pdsButton(variant: actionVariant, size: .small)
        }
        .padding(.horizontal, Spacing.cellHorizontal)
        .padding(.vertical, Spacing.cellVertical)
        .background(Colors.backgroundCard)
        .contentShape(Rectangle())
        .onTapGesture {
            onCellTap?()
        }
    }
}

// MARK: - Swipeable Cell

/// Swipe action configuration
struct PDSSwipeAction {
    let title: String
    let icon: String?
    let tint: Color
    let action: () -> Void
    
    init(title: String, icon: String? = nil, tint: Color = Colors.persistentAccent, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.tint = tint
        self.action = action
    }
}

/// Swipeable cell with reveal actions
struct PDSSwipeableCell<Content: View>: View {
    let leadingActions: [PDSSwipeAction]
    let trailingActions: [PDSSwipeAction]
    @ViewBuilder let content: () -> Content
    
    init(
        leadingActions: [PDSSwipeAction] = [],
        trailingActions: [PDSSwipeAction] = [],
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.leadingActions = leadingActions
        self.trailingActions = trailingActions
        self.content = content
    }
    
    var body: some View {
        content()
            .swipeActions(edge: .leading, allowsFullSwipe: leadingActions.count == 1) {
                ForEach(Array(leadingActions.enumerated()), id: \.offset) { _, action in
                    Button(action: action.action) {
                        if let icon = action.icon {
                            Label(action.title, systemImage: icon)
                        } else {
                            Text(action.title)
                        }
                    }
                    .tint(action.tint)
                }
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: trailingActions.count == 1) {
                ForEach(Array(trailingActions.enumerated()), id: \.offset) { _, action in
                    Button(action: action.action) {
                        if let icon = action.icon {
                            Label(action.title, systemImage: icon)
                        } else {
                            Text(action.title)
                        }
                    }
                    .tint(action.tint)
                }
            }
    }
}

// MARK: - Preview

#Preview("Cell Components") {
    ScrollView {
        VStack(alignment: .leading, spacing: 32) {
            // Basic PDSCell usage
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text("Basic Cells")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
                
                PDSCellGroup {
                    PDSCell("Profile")
                    PDSCell("Account", subtitle: "john@example.com")
                    PDSCell("Language", subtitle: "English") {
                        PDSCellIcon(systemName: "globe")
                    }
                }
            }
            
            // Navigation cells
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text("Navigation Cells")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
                
                PDSCellGroup {
                    PDSNavigationCell(title: "Privacy") { }
                    PDSNavigationCell(title: "Notifications", subtitle: "Push, Email, SMS") { }
                    PDSNavigationCell(
                        title: "Appearance",
                        leadingIcon: "paintbrush",
                        leadingIconColor: Colors.persistentAccent
                    ) { }
                }
            }
            
            // Toggle cells
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text("Toggle Cells")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
                
                PDSCellGroup {
                    PDSToggleCell(title: "Dark Mode", isOn: .constant(true))
                    PDSToggleCell(title: "Notifications", subtitle: "Receive push notifications", isOn: .constant(false))
                }
            }
            
            // Status cells
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text("Status Cells")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
                
                PDSCellGroup {
                    PDSStatusCell(title: "Alex Johnson", status: .online)
                    PDSStatusCell(title: "Sarah Williams", subtitle: "In a meeting", status: .busy)
                    PDSStatusCell(title: "Mike Brown", subtitle: "Back in 30 min", status: .away, showChevron: true)
                    PDSStatusCell(title: "Emily Davis", status: .offline)
                }
            }
            
            // Checkmark cells
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text("Checkmark Cells")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
                
                PDSCellGroup {
                    PDSCheckmarkCell(title: "Email notifications", isSelected: .constant(true))
                    PDSCheckmarkCell(title: "Push notifications", subtitle: "Receive alerts on your device", isSelected: .constant(false))
                    PDSCheckmarkCell(title: "SMS notifications", isSelected: .constant(false))
                }
            }
            
            // Badge cells
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                Text("Badge Cells")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
                
                PDSCellGroup {
                    PDSBadgeCell(
                        title: "Messages",
                        leadingIcon: "message.fill",
                        leadingIconColor: Colors.persistentAccent,
                        count: 12,
                        showChevron: true
                    )
                    PDSBadgeCell(
                        title: "Notifications",
                        subtitle: "3 unread",
                        leadingIcon: "bell.fill",
                        leadingIconColor: Colors.persistentWarning,
                        count: 3
                    )
                }
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}
