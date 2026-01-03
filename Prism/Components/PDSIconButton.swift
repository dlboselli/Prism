import SwiftUI

// MARK: - Icon Button Size

/// Icon button size variants
enum PDSIconButtonSize {
    case large      // 28pt icon, 48pt touch target
    case regular    // 24pt icon, 44pt touch target (default)
    case small      // 20pt icon, 40pt touch target
    case compact    // 16pt icon, 36pt touch target
    
    var iconSize: CGFloat {
        switch self {
        case .large: return 28
        case .regular: return 24
        case .small: return 20
        case .compact: return 16
        }
    }
    
    var touchTargetSize: CGFloat {
        switch self {
        case .large: return 48
        case .regular: return 44
        case .small: return 40
        case .compact: return 36
        }
    }
    
    var fontWeight: Font.Weight {
        switch self {
        case .large: return .regular
        case .regular: return .medium
        case .small: return .medium
        case .compact: return .semibold
        }
    }
}

// MARK: - Icon Button Variant

/// Icon button color variants
enum PDSIconButtonVariant {
    case primary            // Primary icon color (default)
    case secondary          // Secondary/muted icon color
    case accent             // Accent/brand color
    case negative           // Destructive/error actions
    case onMediaPrimary     // Primary on media/images
    case onMediaSecondary   // Secondary on media/images
    case onColorPrimary     // Primary on colored backgrounds
    case onColorSecondary   // Secondary on colored backgrounds
}

// MARK: - Icon Button Effect

/// Symbol effects for icon buttons
enum PDSIconButtonEffect {
    case none           // No effect
    case bounce         // Bounce on tap
    case pulse          // Pulse while active
    case wiggle         // Wiggle on tap (iOS 18+)
}

// MARK: - Icon Button Style

/// PDS Icon Button Style with full SF Symbol support
struct PDSIconButtonStyle: ButtonStyle {
    var size: PDSIconButtonSize = .regular
    var variant: PDSIconButtonVariant = .primary
    var renderingMode: PDSSymbolRenderingMode = .monochrome
    var effect: PDSIconButtonEffect = .bounce
    var isEnabled: Bool = true
    var accessibilityLabel: String? = nil
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.iconSize, weight: size.fontWeight))
            .symbolRenderingMode(renderingMode.swiftUIMode)
            .foregroundStyle(foregroundColor(isPressed: configuration.isPressed))
            .frame(width: size.touchTargetSize, height: size.touchTargetSize)
            .contentShape(Rectangle())
            .modifier(IconButtonEffectModifier(
                effect: effect,
                isPressed: configuration.isPressed
            ))
            .accessibilityLabel(accessibilityLabel ?? "Button")
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return disabledColor
        }
        
        let baseColor: Color
        switch variant {
        case .primary:
            baseColor = Colors.iconPrimary
        case .secondary:
            baseColor = Colors.iconSecondary
        case .accent:
            baseColor = Colors.persistentAccent
        case .negative:
            baseColor = Colors.persistentNegative
        case .onMediaPrimary:
            baseColor = Colors.iconPrimaryOnMedia
        case .onMediaSecondary:
            baseColor = Colors.iconSecondaryOnMedia
        case .onColorPrimary:
            baseColor = Colors.iconPrimaryOnColor
        case .onColorSecondary:
            baseColor = Colors.iconSecondaryOnColor
        }
        
        return isPressed ? baseColor.opacity(0.7) : baseColor
    }
    
    private var disabledColor: Color {
        switch variant {
        case .primary, .secondary, .accent, .negative:
            return Colors.iconDisabled
        case .onMediaPrimary, .onMediaSecondary:
            return Colors.iconDisabledOnMedia
        case .onColorPrimary, .onColorSecondary:
            return Colors.iconDisabledOnColor
        }
    }
}

// MARK: - Icon Button Effect Modifier

struct IconButtonEffectModifier: ViewModifier {
    var effect: PDSIconButtonEffect
    var isPressed: Bool
    
    func body(content: Content) -> some View {
        switch effect {
        case .none:
            content
                .scaleEffect(isPressed ? 0.92 : 1.0)
                .animation(.easeInOut(duration: 0.15), value: isPressed)
        case .bounce:
            content
                .scaleEffect(isPressed ? 0.85 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                .symbolEffect(.bounce, value: isPressed)
        case .pulse:
            content
                .scaleEffect(isPressed ? 0.92 : 1.0)
                .animation(.easeInOut(duration: 0.15), value: isPressed)
                .symbolEffect(.pulse, value: isPressed)
        case .wiggle:
            if #available(iOS 18.0, *) {
                content
                    .scaleEffect(isPressed ? 0.92 : 1.0)
                    .animation(.easeInOut(duration: 0.15), value: isPressed)
                    .symbolEffect(.wiggle, value: isPressed)
            } else {
                content
                    .scaleEffect(isPressed ? 0.85 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
            }
        }
    }
}

// MARK: - Toggle Icon Button

/// A toggleable icon button that switches between two states
struct PDSToggleIconButton: View {
    let defaultIcon: String
    let activeIcon: String
    @Binding var isActive: Bool
    var size: PDSIconButtonSize = .regular
    var defaultVariant: PDSIconButtonVariant = .secondary
    var activeVariant: PDSIconButtonVariant = .accent
    var renderingMode: PDSSymbolRenderingMode = .monochrome
    var accessibilityLabel: String? = nil
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isActive.toggle()
            }
            action?()
        } label: {
            Image(systemName: isActive ? activeIcon : defaultIcon)
                .contentTransition(.symbolEffect(.replace.downUp.byLayer))
        }
        .buttonStyle(PDSIconButtonStyle(
            size: size,
            variant: isActive ? activeVariant : defaultVariant,
            renderingMode: renderingMode,
            effect: .bounce,
            accessibilityLabel: accessibilityLabel
        ))
        .symbolEffect(.bounce, value: isActive)
        .accessibilityValue(isActive ? "On" : "Off")
        .accessibilityHint("Double tap to toggle")
    }
}

// MARK: - View Extensions

extension View {
    /// Applies PDS icon button style with full customization
    /// - Parameters:
    ///   - size: Icon size (.large, .regular, .small, .compact)
    ///   - variant: Color variant
    ///   - renderingMode: SF Symbol rendering mode
    ///   - effect: Animation effect on tap
    ///   - isEnabled: Whether the button is enabled
    ///   - accessibilityLabel: VoiceOver label for the button
    func pdsIconButtonStyle(
        size: PDSIconButtonSize = .regular,
        variant: PDSIconButtonVariant = .primary,
        renderingMode: PDSSymbolRenderingMode = .monochrome,
        effect: PDSIconButtonEffect = .bounce,
        isEnabled: Bool = true,
        accessibilityLabel: String? = nil
    ) -> some View {
        self.buttonStyle(PDSIconButtonStyle(
            size: size,
            variant: variant,
            renderingMode: renderingMode,
            effect: effect,
            isEnabled: isEnabled,
            accessibilityLabel: accessibilityLabel
        ))
    }
    
    /// Legacy: Applies PDS icon button style (simplified)
    func pdsIconButton(
        size: PDSIconButtonSize = .regular,
        variant: PDSIconButtonVariant = .primary,
        isEnabled: Bool = true,
        accessibilityLabel: String? = nil
    ) -> some View {
        self.buttonStyle(PDSIconButtonStyle(
            size: size,
            variant: variant,
            isEnabled: isEnabled,
            accessibilityLabel: accessibilityLabel
        ))
    }
}

// MARK: - Preview

#Preview("Icon Button Variants") {
    ScrollView {
        VStack(spacing: 32) {
            // Size Variants
            VStack(alignment: .leading, spacing: 16) {
                Text("Size Variants")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 16) {
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(size: .large)
                        
                        Text("Large")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(size: .regular)
                        
                        Text("Regular")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(size: .small)
                        
                        Text("Small")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(size: .compact)
                        
                        Text("Compact")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Color Variants
            VStack(alignment: .leading, spacing: 16) {
                Text("Color Variants")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 12) {
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(variant: .primary)
                        Text("Primary")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(variant: .secondary)
                        Text("Secondary")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart.fill")
                        }
                        .pdsIconButton(variant: .accent)
                        Text("Accent")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "trash")
                        }
                        .pdsIconButton(variant: .negative)
                        Text("Negative")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Rendering Modes
            VStack(alignment: .leading, spacing: 16) {
                Text("Rendering Modes")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 16) {
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "person.crop.circle.badge.checkmark")
                        }
                        .pdsIconButtonStyle(renderingMode: .monochrome)
                        Text("Mono")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "person.crop.circle.badge.checkmark")
                        }
                        .pdsIconButtonStyle(renderingMode: .hierarchical)
                        Text("Hierarchical")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "sun.max.fill")
                        }
                        .pdsIconButtonStyle(renderingMode: .multicolor)
                        Text("Multicolor")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Common Action Icons
            VStack(alignment: .leading, spacing: 16) {
                Text("Common Actions")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 12) {
                    Button { } label: {
                        Image(systemName: "heart")
                    }
                    .pdsIconButton(variant: .primary)
                    
                    Button { } label: {
                        Image(systemName: "message")
                    }
                    .pdsIconButton(variant: .primary)
                    
                    Button { } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .pdsIconButton(variant: .primary)
                    
                    Button { } label: {
                        Image(systemName: "bookmark")
                    }
                    .pdsIconButton(variant: .primary)
                    
                    Button { } label: {
                        Image(systemName: "ellipsis")
                    }
                    .pdsIconButton(variant: .primary)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // On Media
            VStack(alignment: .leading, spacing: 16) {
                Text("On Media")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                ZStack {
                    RoundedRectangle(cornerRadius: CornerRadius.card)
                        .fill(
                            LinearGradient(
                                colors: [Colors.gray700, Colors.gray500],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 140)
                    
                    HStack(spacing: 32) {
                        VStack(spacing: 12) {
                            Text("Primary")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textPrimaryOnMedia)
                            
                            HStack(spacing: 12) {
                                Button { } label: {
                                    Image(systemName: "heart.fill")
                                }
                                .pdsIconButton(variant: .onMediaPrimary)
                                
                                Button { } label: {
                                    Image(systemName: "xmark")
                                }
                                .pdsIconButton(variant: .onMediaPrimary)
                            }
                        }
                        
                        VStack(spacing: 12) {
                            Text("Secondary")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textPrimaryOnMedia)
                            
                            HStack(spacing: 12) {
                                Button { } label: {
                                    Image(systemName: "heart")
                                }
                                .pdsIconButton(variant: .onMediaSecondary)
                                
                                Button { } label: {
                                    Image(systemName: "info.circle")
                                }
                                .pdsIconButton(variant: .onMediaSecondary)
                            }
                        }
                    }
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Disabled
            VStack(alignment: .leading, spacing: 16) {
                Text("Disabled")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 16) {
                    Button { } label: {
                        Image(systemName: "heart")
                    }
                    .pdsIconButton(variant: .primary, isEnabled: false)
                    
                    Button { } label: {
                        Image(systemName: "heart")
                    }
                    .pdsIconButton(variant: .accent, isEnabled: false)
                }
            }
        }
        .padding(24)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Toggle Icon Buttons") {
    ToggleIconButtonPreview()
}

// Helper view for toggle preview
struct ToggleIconButtonPreview: View {
    @State private var isLiked = false
    @State private var isBookmarked = false
    @State private var isMuted = false
    @State private var notificationsOn = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Toggle Buttons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Toggle Icon Buttons")
                        .typography(PDSTextScale.content.headline)
                        .foregroundColor(Colors.textPrimary)
                    
                    Text("Tap to toggle state with animated transitions")
                        .typography(Typography.body3)
                        .foregroundColor(Colors.textSecondary)
                    
                    HStack(spacing: 24) {
                        VStack(spacing: 8) {
                            PDSToggleIconButton(
                                defaultIcon: "heart",
                                activeIcon: "heart.fill",
                                isActive: $isLiked,
                                activeVariant: .negative
                            )
                            Text("Like")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSToggleIconButton(
                                defaultIcon: "bookmark",
                                activeIcon: "bookmark.fill",
                                isActive: $isBookmarked,
                                activeVariant: .accent
                            )
                            Text("Save")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSToggleIconButton(
                                defaultIcon: "speaker.wave.3.fill",
                                activeIcon: "speaker.slash.fill",
                                isActive: $isMuted
                            )
                            Text("Mute")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSToggleIconButton(
                                defaultIcon: "bell",
                                activeIcon: "bell.fill",
                                isActive: $notificationsOn,
                                activeVariant: .accent
                            )
                            Text("Notify")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
                
                Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
                
                // Action Effects
                VStack(alignment: .leading, spacing: 16) {
                    Text("Animation Effects")
                        .typography(PDSTextScale.content.headline)
                        .foregroundColor(Colors.textPrimary)
                    
                    HStack(spacing: 24) {
                        VStack(spacing: 8) {
                            Button { } label: {
                                Image(systemName: "bell.fill")
                            }
                            .pdsIconButtonStyle(effect: .bounce)
                            Text("Bounce")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            Button { } label: {
                                Image(systemName: "heart.fill")
                            }
                            .pdsIconButtonStyle(variant: .negative, effect: .pulse)
                            Text("Pulse")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            Button { } label: {
                                Image(systemName: "star.fill")
                            }
                            .pdsIconButtonStyle(variant: .accent, effect: .none)
                            Text("None")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
            }
            .padding(24)
        }
        .background(Colors.backgroundSurface)
    }
}
