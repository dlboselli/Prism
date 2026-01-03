import SwiftUI

// MARK: - Badge Configuration

/// Badge configuration for navigation actions
enum PDSTabBadge {
    case dot                    // Simple notification dot
    case count(Int)             // Numeric badge
    case text(String)           // Text badge (e.g., "NEW")
    
    var displayText: String? {
        switch self {
        case .dot: return nil
        case .count(let value): return value > 99 ? "99+" : "\(value)"
        case .text(let text): return text
        }
    }
}

// MARK: - Navigation Bar Style

/// Visual style variants for the navigation bar
enum PDSNavigationBarStyle {
    case standard       // Solid background
    case transparent    // Transparent with optional blur
    case large          // Large title style
}

// MARK: - Navigation Bar Context

/// Context for navigation bar colors
enum PDSNavigationBarContext {
    case surface        // Standard surface background
    case onMedia        // Over images/video content
    case onColor        // Over colored backgrounds
}

// MARK: - Navigation Action

/// Represents a navigation bar action button
struct PDSNavigationAction: Identifiable {
    let id: String
    let icon: String
    var badge: PDSTabBadge? = nil
    var accessibilityLabel: String
    var action: () -> Void
    
    init(
        id: String = UUID().uuidString,
        icon: String,
        badge: PDSTabBadge? = nil,
        accessibilityLabel: String? = nil,
        action: @escaping () -> Void
    ) {
        self.id = id
        self.icon = icon
        self.badge = badge
        self.accessibilityLabel = accessibilityLabel ?? icon
        self.action = action
    }
}

// MARK: - Navigation Bar

/// PDS Navigation Bar with full SF Symbol support
struct PDSNavigationBar<TitleContent: View, LeadingContent: View, TrailingContent: View>: View {
    var style: PDSNavigationBarStyle = .standard
    var context: PDSNavigationBarContext = .surface
    var showDivider: Bool = true
    
    @ViewBuilder var title: () -> TitleContent
    @ViewBuilder var leading: () -> LeadingContent
    @ViewBuilder var trailing: () -> TrailingContent
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                // Leading content
                HStack(spacing: 4) {
                    leading()
                }
                .frame(minWidth: 44, alignment: .leading)
                
                Spacer()
                
                // Title
                title()
                    .foregroundStyle(titleColor)
                
                Spacer()
                
                // Trailing content
                HStack(spacing: 4) {
                    trailing()
                }
                .frame(minWidth: 44, alignment: .trailing)
            }
            .frame(height: style == .large ? 96 : 44)
            .padding(.horizontal, 16)
            .background(backgroundColor)
            
            if showDivider && style == .standard {
                Rectangle()
                    .fill(Colors.backgroundDivider)
                    .frame(height: 1)
            }
        }
    }
    
    private var titleColor: Color {
        switch context {
        case .surface:
            return Colors.textPrimary
        case .onMedia:
            return Colors.textPrimaryOnMedia
        case .onColor:
            return Colors.textPrimaryOnColor
        }
    }
    
    private var backgroundColor: some ShapeStyle {
        switch (style, context) {
        case (.standard, _):
            return AnyShapeStyle(Colors.backgroundNavBar)
        case (.transparent, .surface):
            return AnyShapeStyle(Color.clear)
        case (.transparent, .onMedia), (.transparent, .onColor):
            return AnyShapeStyle(Color.clear)
        case (.large, _):
            return AnyShapeStyle(Colors.backgroundNavBar)
        }
    }
}

// MARK: - Simple Navigation Bar

/// Simplified navigation bar with string title
struct PDSSimpleNavigationBar: View {
    let title: String
    var subtitle: String? = nil
    var style: PDSNavigationBarStyle = .standard
    var context: PDSNavigationBarContext = .surface
    var showBackButton: Bool = true
    var leadingActions: [PDSNavigationAction] = []
    var trailingActions: [PDSNavigationAction] = []
    var onBack: (() -> Void)? = nil
    
    var body: some View {
        PDSNavigationBar(
            style: style,
            context: context,
            title: {
                VStack(spacing: 2) {
                    Text(title)
                        .typography(style == .large ? Typography.headline2 : Typography.headline4Emphasized)
                        .lineLimit(1)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .typography(Typography.meta3)
                            .foregroundStyle(subtitleColor)
                            .lineLimit(1)
                    }
                }
            },
            leading: {
                if showBackButton {
                    NavBarIconButton(
                        icon: "chevron.left",
                        context: context,
                        accessibilityLabel: "Back",
                        action: { onBack?() }
                    )
                }
                
                ForEach(leadingActions) { action in
                    NavBarIconButton(
                        icon: action.icon,
                        badge: action.badge,
                        context: context,
                        accessibilityLabel: action.accessibilityLabel,
                        action: action.action
                    )
                }
            },
            trailing: {
                ForEach(trailingActions) { action in
                    NavBarIconButton(
                        icon: action.icon,
                        badge: action.badge,
                        context: context,
                        accessibilityLabel: action.accessibilityLabel,
                        action: action.action
                    )
                }
            }
        )
    }
    
    private var subtitleColor: Color {
        switch context {
        case .surface:
            return Colors.textSecondary
        case .onMedia:
            return Colors.textSecondaryOnMedia
        case .onColor:
            return Colors.textSecondaryOnColor
        }
    }
}

// MARK: - Navigation Bar Icon Button

/// Icon button optimized for navigation bar use
struct NavBarIconButton: View {
    let icon: String
    var badge: PDSTabBadge? = nil
    var context: PDSNavigationBarContext = .surface
    var accessibilityLabel: String
    var action: () -> Void
    
    @State private var animationTrigger = false
    
    var body: some View {
        Button {
            animationTrigger.toggle()
            action()
        } label: {
            ZStack(alignment: .topTrailing) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(iconColor)
                    .symbolEffect(.bounce, value: animationTrigger)
                    .frame(width: 44, height: 44)
                
                // Badge
                if let badge = badge {
                    badgeView(for: badge)
                        .offset(x: 8, y: 4)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(accessibilityLabel)
    }
    
    private var iconColor: Color {
        switch context {
        case .surface:
            return Colors.iconPrimary
        case .onMedia:
            return Colors.iconPrimaryOnMedia
        case .onColor:
            return Colors.iconPrimaryOnColor
        }
    }
    
    @ViewBuilder
    private func badgeView(for badge: PDSTabBadge) -> some View {
        switch badge {
        case .dot:
            Circle()
                .fill(Colors.persistentNegative)
                .frame(width: 8, height: 8)
        case .count(let value) where value > 0:
            Text(badge.displayText ?? "")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(
                    Capsule()
                        .fill(Colors.persistentNegative)
                )
                .fixedSize()
        default:
            EmptyView()
        }
    }
}

// MARK: - Search Navigation Bar

/// Navigation bar with integrated search field
struct PDSSearchNavigationBar: View {
    @Binding var searchText: String
    var placeholder: String = "Search"
    var context: PDSNavigationBarContext = .surface
    var showCancelButton: Bool = true
    var leadingActions: [PDSNavigationAction] = []
    var trailingActions: [PDSNavigationAction] = []
    var onCancel: (() -> Void)? = nil
    var onSubmit: (() -> Void)? = nil
    
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                // Leading actions
                ForEach(leadingActions) { action in
                    NavBarIconButton(
                        icon: action.icon,
                        badge: action.badge,
                        context: context,
                        accessibilityLabel: action.accessibilityLabel,
                        action: action.action
                    )
                }
                
                // Search field
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Colors.iconSecondary)
                    
                    TextField(placeholder, text: $searchText)
                        .typography(Typography.body2)
                        .foregroundStyle(Colors.textPrimary)
                        .focused($isSearchFocused)
                        .submitLabel(.search)
                        .onSubmit {
                            onSubmit?()
                        }
                    
                    if !searchText.isEmpty {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 16))
                                .foregroundStyle(Colors.iconSecondary)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(Colors.backgroundDeemphasized)
                )
                
                // Trailing actions or Cancel
                if showCancelButton && isSearchFocused {
                    Button("Cancel") {
                        isSearchFocused = false
                        searchText = ""
                        onCancel?()
                    }
                    .typography(Typography.button2)
                    .foregroundStyle(Colors.accentText)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                } else {
                    ForEach(trailingActions) { action in
                        NavBarIconButton(
                            icon: action.icon,
                            badge: action.badge,
                            context: context,
                            accessibilityLabel: action.accessibilityLabel,
                            action: action.action
                        )
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(Colors.backgroundNavBar)
            .animation(.easeInOut(duration: 0.2), value: isSearchFocused)
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
        }
    }
}

// MARK: - Profile Navigation Bar

/// Navigation bar with profile avatar and title
struct PDSProfileNavigationBar: View {
    let title: String
    var subtitle: String? = nil
    var avatarImage: Image? = nil
    var showBackButton: Bool = true
    var trailingActions: [PDSNavigationAction] = []
    var onBack: (() -> Void)? = nil
    var onAvatarTap: (() -> Void)? = nil
    
    var body: some View {
        PDSNavigationBar(
            style: .standard,
            context: .surface,
            title: {
                Button {
                    onAvatarTap?()
                } label: {
                    HStack(spacing: 12) {
                        // Avatar
                        Group {
                            if let image = avatarImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .foregroundStyle(Colors.iconSecondary)
                            }
                        }
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(title)
                                .typography(PDSTextScale.content.headline)
                                .foregroundStyle(Colors.textPrimary)
                            
                            if let subtitle = subtitle {
                                Text(subtitle)
                                    .typography(Typography.meta4)
                                    .foregroundStyle(Colors.textSecondary)
                            }
                        }
                        
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(Colors.iconSecondary)
                    }
                }
                .buttonStyle(.plain)
            },
            leading: {
                if showBackButton {
                    NavBarIconButton(
                        icon: "chevron.left",
                        accessibilityLabel: "Back",
                        action: { onBack?() }
                    )
                }
            },
            trailing: {
                ForEach(trailingActions) { action in
                    NavBarIconButton(
                        icon: action.icon,
                        badge: action.badge,
                        accessibilityLabel: action.accessibilityLabel,
                        action: action.action
                    )
                }
            }
        )
    }
}

// MARK: - View Extension

extension View {
    /// Applies a PDS navigation bar at the top of the view
    func pdsNavigationBar(
        title: String,
        subtitle: String? = nil,
        style: PDSNavigationBarStyle = .standard,
        showBackButton: Bool = true,
        leadingActions: [PDSNavigationAction] = [],
        trailingActions: [PDSNavigationAction] = [],
        onBack: (() -> Void)? = nil
    ) -> some View {
        VStack(spacing: 0) {
            PDSSimpleNavigationBar(
                title: title,
                subtitle: subtitle,
                style: style,
                showBackButton: showBackButton,
                leadingActions: leadingActions,
                trailingActions: trailingActions,
                onBack: onBack
            )
            
            self
        }
    }
}

// MARK: - Preview

#Preview("Navigation Bar Variants") {
    NavigationBarPreview()
}

struct NavigationBarPreview: View {
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Standard Navigation Bar
                VStack(alignment: .leading, spacing: 8) {
                    Text("Standard")
                        .typography(Typography.headline4Emphasized)
                        .foregroundColor(Colors.textPrimary)
                        .padding(.horizontal, 24)
                    
                    PDSSimpleNavigationBar(
                        title: "Messages",
                        trailingActions: [
                            PDSNavigationAction(icon: "square.and.pencil", accessibilityLabel: "Compose") {},
                            PDSNavigationAction(icon: "ellipsis", accessibilityLabel: "More") {}
                        ]
                    )
                }
                
                // With Subtitle
                VStack(alignment: .leading, spacing: 8) {
                    Text("With Subtitle")
                        .typography(Typography.headline4Emphasized)
                        .foregroundColor(Colors.textPrimary)
                        .padding(.horizontal, 24)
                    
                    PDSSimpleNavigationBar(
                        title: "Settings",
                        subtitle: "Account & Privacy",
                        trailingActions: [
                            PDSNavigationAction(icon: "questionmark.circle", accessibilityLabel: "Help") {}
                        ]
                    )
                }
                
                // With Badges
                VStack(alignment: .leading, spacing: 8) {
                    Text("With Badges")
                        .typography(Typography.headline4Emphasized)
                        .foregroundColor(Colors.textPrimary)
                        .padding(.horizontal, 24)
                    
                    PDSSimpleNavigationBar(
                        title: "Home",
                        showBackButton: false,
                        trailingActions: [
                            PDSNavigationAction(icon: "bell", badge: .count(5), accessibilityLabel: "Notifications") {},
                            PDSNavigationAction(icon: "message", badge: .dot, accessibilityLabel: "Messages") {}
                        ]
                    )
                }
                
                // Search Navigation Bar
                VStack(alignment: .leading, spacing: 8) {
                    Text("Search Bar")
                        .typography(Typography.headline4Emphasized)
                        .foregroundColor(Colors.textPrimary)
                        .padding(.horizontal, 24)
                    
                    PDSSearchNavigationBar(
                        searchText: $searchText,
                        placeholder: "Search messages..."
                    )
                }
                
                // Profile Navigation Bar
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile Header")
                        .typography(Typography.headline4Emphasized)
                        .foregroundColor(Colors.textPrimary)
                        .padding(.horizontal, 24)
                    
                    PDSProfileNavigationBar(
                        title: "Jane Doe",
                        subtitle: "Online",
                        showBackButton: true,
                        trailingActions: [
                            PDSNavigationAction(icon: "phone", accessibilityLabel: "Call") {},
                            PDSNavigationAction(icon: "video", accessibilityLabel: "Video") {},
                            PDSNavigationAction(icon: "info.circle", accessibilityLabel: "Info") {}
                        ]
                    )
                }
                
                // On Media Context
                VStack(alignment: .leading, spacing: 8) {
                    Text("On Media")
                        .typography(Typography.headline4Emphasized)
                        .foregroundColor(Colors.textPrimary)
                        .padding(.horizontal, 24)
                    
                    ZStack(alignment: .top) {
                        LinearGradient(
                            colors: [Colors.gray700, Colors.gray400],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 120)
                        
                        PDSSimpleNavigationBar(
                            title: "Photo",
                            style: .transparent,
                            context: .onMedia,
                            trailingActions: [
                                PDSNavigationAction(icon: "square.and.arrow.up", accessibilityLabel: "Share") {},
                                PDSNavigationAction(icon: "trash", accessibilityLabel: "Delete") {}
                            ]
                        )
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 24)
                }
                
                // Common Icon Examples
                VStack(alignment: .leading, spacing: 16) {
                    Text("Common Nav Icons")
                        .typography(Typography.headline4Emphasized)
                        .foregroundColor(Colors.textPrimary)
                        .padding(.horizontal, 24)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ForEach([
                            ("chevron.left", "Back"),
                            ("xmark", "Close"),
                            ("ellipsis", "More"),
                            ("gear", "Settings"),
                            ("bell", "Alerts"),
                            ("magnifyingglass", "Search"),
                            ("plus", "Add"),
                            ("square.and.pencil", "Edit"),
                            ("square.and.arrow.up", "Share"),
                            ("trash", "Delete")
                        ], id: \.0) { icon, label in
                            VStack(spacing: 8) {
                                Image(systemName: icon)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(Colors.iconPrimary)
                                    .frame(width: 44, height: 44)
                                    .background(
                                        Circle()
                                            .fill(Colors.backgroundDeemphasized)
                                    )
                                
                                Text(label)
                                    .typography(Typography.meta4)
                                    .foregroundColor(Colors.textSecondary)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                }
            }
            .padding(.vertical, 24)
        }
        .background(Colors.backgroundSurface)
    }
}
