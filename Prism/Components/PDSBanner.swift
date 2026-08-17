//
//  PDSBanner.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A toast-style feedback component that displays brief messages
//  to provide instant feedback for user actions.
//

import SwiftUI

// MARK: - Instant Feedback Types

/// Defines the semantic type of instant feedback
enum PDSBannerType {
    case neutral     // Default informational feedback
    case success     // Positive confirmation (action completed)
    case error       // Error or failure state
    case warning     // Warning or caution
    
    /// Icon for the feedback type
    var icon: String? {
        switch self {
        case .neutral: return nil
        case .success: return "checkmark.circle.fill"
        case .error: return "exclamationmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        }
    }
    
    /// Icon color for the feedback type (semantic colors, dark mode forced on dark card)
    var iconColor: Color {
        switch self {
        case .neutral: return Colors.iconPrimaryOnColor
        case .success: return Colors.fixedPositive
        case .error: return Colors.fixedNegative
        case .warning: return Colors.fixedWarning
        }
    }
}

/// Position of the instant feedback on screen
enum PDSBannerPosition {
    case top
    case bottom
}

// MARK: - Instant Feedback View

/// A toast-style feedback component for brief messages
///
/// Usage:
/// ```swift
/// PDSBanner(
///     message: "Post shared successfully",
///     type: .success,
///     isPresented: $showFeedback
/// )
/// ```
struct PDSBanner: View {
    // MARK: - Properties
    
    /// The message to display
    let message: String
    
    /// The type of feedback (determines icon and color)
    var type: PDSBannerType = .neutral
    
    /// Optional custom icon (overrides type icon)
    var icon: String? = nil
    
    /// Optional actor URL (displays avatar before message)
    var avatarURL: URL? = nil
    
    /// Optional actor initials (displays avatar before message, used if no URL)
    var avatarInitials: String? = nil
    
    /// Optional action button text
    var actionText: String? = nil
    
    /// Action callback
    var action: (() -> Void)? = nil
    
    /// Binding to control visibility
    @Binding var isPresented: Bool
    
    /// Auto-dismiss duration (nil = no auto-dismiss)
    var autoDismissAfter: TimeInterval? = 3.0
    
    /// Position on screen
    var position: PDSBannerPosition = .bottom
    
    /// Whether to show an actor (computed)
    private var hasAvatar: Bool {
        avatarURL != nil || avatarInitials != nil
    }
    
    // MARK: - Private State
    
    @State private var offset: CGFloat = 0
    @State private var opacity: Double = 0
    
    // MARK: - Body
    
    var body: some View {
        if isPresented {
            feedbackContent
                .transition(.asymmetric(
                    insertion: .move(edge: position == .top ? .top : .bottom).combined(with: .opacity),
                    removal: .move(edge: position == .top ? .top : .bottom).combined(with: .opacity)
                ))
                .onAppear {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        opacity = 1
                    }
                    
                    // Auto-dismiss
                    if let duration = autoDismissAfter {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            dismiss()
                        }
                    }
                }
        }
    }
    
    // MARK: - Feedback Content
    
    private var feedbackContent: some View {
        HStack(spacing: 12) {
            // Actor (takes precedence over icon)
            if hasAvatar {
                if let url = avatarURL {
                    PDSAvatar(url: url, size: .small)
                } else if let initials = avatarInitials {
                    PDSAvatar(initials: initials, size: .small)
                }
            } else if let iconName = icon ?? type.icon {
                // Icon (only shown if no actor)
                Image(systemName: iconName)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(icon != nil ? Colors.iconPrimaryOnColor : type.iconColor)
                    .accessibilityHidden(true)
            }
            
            // Message
            Text(message)
                .typography(Typography.body3)
                .foregroundColor(Colors.textPrimaryOnColor)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Action Button
            if let actionText = actionText {
                Button {
                    action?()
                    dismiss()
                } label: {
                    Text(actionText)
                        .typography(Typography.button3)
                        .foregroundColor(Colors.textAccent)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.card)
                .fill(Colors.backgroundCardInverse)
                .shadow(Shadows.responsiveUI)
        )
        .padding(.horizontal, 16)
        .gesture(
            DragGesture()
                .onChanged { value in
                    let translation = position == .top ? value.translation.height : -value.translation.height
                    if translation < 0 {
                        offset = value.translation.height
                    }
                }
                .onEnded { value in
                    let translation = position == .top ? value.translation.height : -value.translation.height
                    if translation < -50 {
                        dismiss()
                    } else {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            offset = 0
                        }
                    }
                }
        )
        .offset(y: offset)
        .environment(\.colorScheme, .dark) // Force dark mode colors on dark card background
    }
    
    // MARK: - Actions
    
    private func dismiss() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            isPresented = false
        }
    }
}

// MARK: - Instant Feedback Container

/// A container modifier that displays instant feedback overlaid on content
struct PDSBannerModifier: ViewModifier {
    let message: String
    var type: PDSBannerType = .neutral
    var icon: String? = nil
    var avatarURL: URL? = nil
    var avatarInitials: String? = nil
    var actionText: String? = nil
    var action: (() -> Void)? = nil
    @Binding var isPresented: Bool
    var autoDismissAfter: TimeInterval? = 3.0
    var position: PDSBannerPosition = .bottom
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            VStack {
                if position == .bottom {
                    Spacer()
                }
                
                PDSBanner(
                    message: message,
                    type: type,
                    icon: icon,
                    avatarURL: avatarURL,
                    avatarInitials: avatarInitials,
                    actionText: actionText,
                    action: action,
                    isPresented: $isPresented,
                    autoDismissAfter: autoDismissAfter,
                    position: position
                )
                .padding(.bottom, position == .bottom ? 16 : 0)
                .padding(.top, position == .top ? 16 : 0)
                
                if position == .top {
                    Spacer()
                }
            }
            .animation(.spring(response: 0.35, dampingFraction: 0.8), value: isPresented)
        }
    }
}

// MARK: - View Extension

extension View {
    /// Displays instant feedback (toast) overlaid on the view
    ///
    /// - Parameters:
    ///   - message: The message to display
    ///   - type: The type of feedback (neutral, success, error, warning)
    ///   - icon: Optional custom icon name (overrides type icon)
    ///   - actionText: Optional action button text
    ///   - action: Optional action callback
    ///   - isPresented: Binding to control visibility
    ///   - autoDismissAfter: Duration before auto-dismiss (nil = no auto-dismiss)
    ///   - position: Position on screen (top or bottom)
    /// Displays instant feedback (toast) overlaid on the view
    ///
    /// - Parameters:
    ///   - message: The message to display
    ///   - type: The type of feedback (neutral, success, error, warning)
    ///   - icon: Optional custom icon name (overrides type icon)
    ///   - avatarURL: Optional actor URL for user-context messages
    ///   - avatarInitials: Optional actor initials (used if no URL)
    ///   - actionText: Optional action button text
    ///   - action: Optional action callback
    ///   - isPresented: Binding to control visibility
    ///   - autoDismissAfter: Duration before auto-dismiss (nil = no auto-dismiss)
    ///   - position: Position on screen (top or bottom)
    func pdsBanner(
        message: String,
        type: PDSBannerType = .neutral,
        icon: String? = nil,
        avatarURL: URL? = nil,
        avatarInitials: String? = nil,
        actionText: String? = nil,
        action: (() -> Void)? = nil,
        isPresented: Binding<Bool>,
        autoDismissAfter: TimeInterval? = 3.0,
        position: PDSBannerPosition = .bottom
    ) -> some View {
        modifier(PDSBannerModifier(
            message: message,
            type: type,
            icon: icon,
            avatarURL: avatarURL,
            avatarInitials: avatarInitials,
            actionText: actionText,
            action: action,
            isPresented: isPresented,
            autoDismissAfter: autoDismissAfter,
            position: position
        ))
    }
}

// MARK: - Instant Feedback Manager

/// Observable manager for displaying instant feedback programmatically
@MainActor
class PDSBannerManager: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var message: String = ""
    @Published var type: PDSBannerType = .neutral
    @Published var icon: String? = nil
    @Published var avatarURL: URL? = nil
    @Published var avatarInitials: String? = nil
    @Published var actionText: String? = nil
    @Published var position: PDSBannerPosition = .bottom
    
    private var action: (() -> Void)? = nil
    
    /// Shows instant feedback
    func show(
        _ message: String,
        type: PDSBannerType = .neutral,
        icon: String? = nil,
        avatarURL: URL? = nil,
        avatarInitials: String? = nil,
        actionText: String? = nil,
        action: (() -> Void)? = nil,
        position: PDSBannerPosition = .bottom
    ) {
        self.message = message
        self.type = type
        self.icon = icon
        self.avatarURL = avatarURL
        self.avatarInitials = avatarInitials
        self.actionText = actionText
        self.action = action
        self.position = position
        
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            isPresented = true
        }
    }
    
    /// Hides instant feedback
    func hide() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            isPresented = false
        }
    }
    
    /// Performs the action and hides feedback
    func performAction() {
        action?()
        hide()
    }
}

// MARK: - Instant Feedback Container View

/// A view that observes an BannerManager and displays feedback
struct PDSBannerContainer<Content: View>: View {
    @ObservedObject var manager: PDSBannerManager
    let content: Content
    var autoDismissAfter: TimeInterval? = 3.0
    
    init(
        manager: PDSBannerManager,
        autoDismissAfter: TimeInterval? = 3.0,
        @ViewBuilder content: () -> Content
    ) {
        self.manager = manager
        self.autoDismissAfter = autoDismissAfter
        self.content = content()
    }
    
    var body: some View {
        content
            .pdsBanner(
                message: manager.message,
                type: manager.type,
                icon: manager.icon,
                avatarURL: manager.avatarURL,
                avatarInitials: manager.avatarInitials,
                actionText: manager.actionText,
                action: manager.performAction,
                isPresented: $manager.isPresented,
                autoDismissAfter: autoDismissAfter,
                position: manager.position
            )
    }
}

// MARK: - Preview

#Preview("Instant Feedback Types") {
    struct PreviewContainer: View {
        @State private var showNeutral = false
        @State private var showSuccess = false
        @State private var showError = false
        @State private var showWarning = false
        @State private var showWithAction = false
        @State private var showCustomIcon = false
        @State private var showTopPosition = false
        
        var body: some View {
            ZStack {
                Colors.backgroundSurface.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        Text("Instant Feedback")
                            .typography(Typography.headline2Emphasized)
                            .foregroundColor(Colors.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                        
                        // Feedback types
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Types")
                                .typography(PDSTextScale.content.headline)
                                .foregroundColor(Colors.textPrimary)
                            
                            Button("Neutral") { showNeutral = true }
                                .pdsPrimaryButton()
                                .frame(maxWidth: .infinity)
                            
                            Button("Success") { showSuccess = true }
                                .pdsPrimaryButton()
                                .frame(maxWidth: .infinity)
                            
                            Button("Error") { showError = true }
                                .pdsPrimaryButton()
                                .frame(maxWidth: .infinity)
                            
                            Button("Warning") { showWarning = true }
                                .pdsPrimaryButton()
                                .frame(maxWidth: .infinity)
                        }
                        
                        Rectangle()
                            .fill(Colors.backgroundDivider)
                            .frame(height: 1)
                            .padding(.vertical, 8)
                        
                        // Variations
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Variations")
                                .typography(PDSTextScale.content.headline)
                                .foregroundColor(Colors.textPrimary)
                            
                            Button("With Action") { showWithAction = true }
                                .pdsSecondaryButton()
                                .frame(maxWidth: .infinity)
                            
                            Button("Custom Icon") { showCustomIcon = true }
                                .pdsSecondaryButton()
                                .frame(maxWidth: .infinity)
                            
                            Button("Top Position") { showTopPosition = true }
                                .pdsSecondaryButton()
                                .frame(maxWidth: .infinity)
                        }
                        
                        Spacer().frame(height: 100)
                    }
                    .padding(24)
                }
            }
            .pdsBanner(
                message: "This is a neutral message",
                type: .neutral,
                isPresented: $showNeutral
            )
            .pdsBanner(
                message: "Post shared successfully!",
                type: .success,
                isPresented: $showSuccess
            )
            .pdsBanner(
                message: "Unable to connect. Check your network.",
                type: .error,
                isPresented: $showError
            )
            .pdsBanner(
                message: "Your session will expire soon",
                type: .warning,
                isPresented: $showWarning
            )
            .pdsBanner(
                message: "Post deleted",
                type: .neutral,
                actionText: "Undo",
                action: { print("Undo tapped") },
                isPresented: $showWithAction
            )
            .pdsBanner(
                message: "Link copied to clipboard",
                icon: "link",
                isPresented: $showCustomIcon
            )
            .pdsBanner(
                message: "New notification received",
                type: .neutral,
                icon: "bell.fill",
                isPresented: $showTopPosition,
                position: .top
            )
        }
    }
    
    return PreviewContainer()
}

#Preview("Instant Feedback Manager") {
    struct ManagerPreviewContainer: View {
        @StateObject private var feedbackManager = PDSBannerManager()
        
        var body: some View {
            PDSBannerContainer(manager: feedbackManager) {
                ZStack {
                    Colors.backgroundSurface.ignoresSafeArea()
                    
                    VStack(spacing: 16) {
                        Text("Manager Pattern")
                            .typography(Typography.headline2Emphasized)
                            .foregroundColor(Colors.textPrimary)
                        
                        Text("Use PDSBannerManager for programmatic control")
                            .typography(Typography.body3)
                            .foregroundColor(Colors.textSecondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Show Feedback") {
                            feedbackManager.show(
                                "Photo uploaded successfully",
                                type: .success,
                                actionText: "View",
                                action: { print("View tapped") }
                            )
                        }
                        .pdsPrimaryButton()
                    }
                    .padding(24)
                }
            }
        }
    }
    
    return ManagerPreviewContainer()
}

#Preview("Inline Feedback") {
    VStack(spacing: 24) {
        Text("Static Examples")
            .typography(PDSTextScale.content.headline)
            .foregroundColor(Colors.textPrimary)
        
        // Neutral
        PDSBanner(
            message: "This is a neutral message",
            type: .neutral,
            isPresented: .constant(true),
            autoDismissAfter: nil
        )
        
        // Success
        PDSBanner(
            message: "Changes saved successfully",
            type: .success,
            isPresented: .constant(true),
            autoDismissAfter: nil
        )
        
        // Error
        PDSBanner(
            message: "Unable to save changes",
            type: .error,
            isPresented: .constant(true),
            autoDismissAfter: nil
        )
        
        // Warning
        PDSBanner(
            message: "Your connection is unstable",
            type: .warning,
            isPresented: .constant(true),
            autoDismissAfter: nil
        )
        
        // With Action
        PDSBanner(
            message: "Item removed from list",
            type: .neutral,
            actionText: "Undo",
            isPresented: .constant(true),
            autoDismissAfter: nil
        )
        
        // Custom Icon
        PDSBanner(
            message: "Link copied to clipboard",
            icon: "doc.on.doc.fill",
            isPresented: .constant(true),
            autoDismissAfter: nil
        )
    }
    .padding(24)
    .background(Colors.backgroundSurface)
}
