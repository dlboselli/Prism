import SwiftUI

// MARK: - Icon Size

/// Standard icon sizes aligned with the design system
enum PDSIconSize {
    case extraSmall  // 12pt - inline text, badges
    case small       // 16pt - compact UI, chips
    case medium      // 20pt - standard UI elements
    case large       // 24pt - prominent actions (default)
    case extraLarge  // 32pt - featured icons
    case display     // 48pt - empty states, onboarding
    
    var pointSize: CGFloat {
        switch self {
        case .extraSmall: return 12
        case .small: return 16
        case .medium: return 20
        case .large: return 24
        case .extraLarge: return 32
        case .display: return 48
        }
    }
    
    /// Recommended font weight for each size
    var weight: Font.Weight {
        switch self {
        case .extraSmall, .small: return .medium
        case .medium, .large: return .regular
        case .extraLarge, .display: return .light
        }
    }
}

// MARK: - Icon Variant

/// Color variants for icons
enum PDSIconVariant {
    case primary              // Standard primary icon color
    case secondary            // Muted secondary color
    case placeholder          // Very muted, for placeholders
    case disabled             // Disabled state
    case accent               // Accent/brand color
    case positive             // Success/positive actions
    case negative             // Error/destructive actions
    case warning              // Warning state
    case primaryOnColor       // On colored backgrounds
    case secondaryOnColor     // Secondary on colored backgrounds
    case primaryOnMedia       // On images/videos
    case secondaryOnMedia     // Secondary on images/videos
}

// MARK: - Symbol Rendering

/// Symbol rendering modes for SF Symbols
enum PDSSymbolRenderingMode {
    case monochrome    // Single color (default)
    case hierarchical  // Primary color with opacity layers
    case palette       // Custom multi-color
    case multicolor    // Apple's designed colors
    
    @available(iOS 15.0, *)
    var swiftUIMode: SymbolRenderingMode {
        switch self {
        case .monochrome: return .monochrome
        case .hierarchical: return .hierarchical
        case .palette: return .palette
        case .multicolor: return .multicolor
        }
    }
}

// MARK: - Symbol Effect Wrapper

/// Wrapper for iOS 17+ symbol effects with fallback
enum PDSSymbolEffect {
    case none
    case bounce
    case pulse
    case variableColor
    case scale
    @available(iOS 18.0, *)
    case wiggle
    @available(iOS 18.0, *)
    case breathe
    @available(iOS 18.0, *)
    case rotate
}

// MARK: - PDSIcon View

/// A design system wrapper for SF Symbols with full feature support
struct PDSIcon: View {
    let systemName: String
    var size: PDSIconSize = .large
    var variant: PDSIconVariant = .primary
    var renderingMode: PDSSymbolRenderingMode = .monochrome
    var weight: Font.Weight? = nil
    var variableValue: Double? = nil
    
    // Palette colors (only used when renderingMode == .palette)
    var paletteColors: [Color]? = nil
    
    var body: some View {
        iconImage
            .font(.system(size: size.pointSize, weight: weight ?? size.weight))
            .foregroundStyle(foregroundColor)
            .symbolRenderingMode(renderingMode.swiftUIMode)
    }
    
    @ViewBuilder
    private var iconImage: some View {
        if let variableValue = variableValue {
            Image(systemName: systemName, variableValue: variableValue)
        } else {
            Image(systemName: systemName)
        }
    }
    
    private var foregroundColor: Color {
        switch variant {
        case .primary:
            return Colors.iconPrimary
        case .secondary:
            return Colors.iconSecondary
        case .placeholder:
            return Colors.iconPlaceholder
        case .disabled:
            return Colors.iconDisabled
        case .accent:
            return Colors.persistentAccent
        case .positive:
            return Colors.persistentPositive
        case .negative:
            return Colors.persistentNegative
        case .warning:
            return Colors.persistentWarning
        case .primaryOnColor:
            return Colors.iconPrimaryOnColor
        case .secondaryOnColor:
            return Colors.iconSecondaryOnColor
        case .primaryOnMedia:
            return Colors.iconPrimaryOnMedia
        case .secondaryOnMedia:
            return Colors.iconSecondaryOnMedia
        }
    }
}

// MARK: - Animated Icon View

/// An icon view with built-in animation support for iOS 17+
struct PDSAnimatedIcon: View {
    let systemName: String
    var size: PDSIconSize = .large
    var variant: PDSIconVariant = .primary
    var renderingMode: PDSSymbolRenderingMode = .monochrome
    var weight: Font.Weight? = nil
    var isActive: Bool = false
    var activeSymbolName: String? = nil
    var activeVariant: PDSIconVariant? = nil
    
    var body: some View {
        Group {
            if isActive, let activeName = activeSymbolName {
                PDSIcon(
                    systemName: activeName,
                    size: size,
                    variant: activeVariant ?? variant,
                    renderingMode: renderingMode,
                    weight: weight
                )
            } else {
                PDSIcon(
                    systemName: systemName,
                    size: size,
                    variant: variant,
                    renderingMode: renderingMode,
                    weight: weight
                )
            }
        }
        .contentTransition(.symbolEffect(.replace))
        .symbolEffect(.bounce, value: isActive)
    }
}

// MARK: - Variable Icon View

/// An icon that displays variable values (like volume, signal strength)
struct PDSVariableIcon: View {
    let systemName: String
    var value: Double
    var size: PDSIconSize = .large
    var variant: PDSIconVariant = .primary
    var weight: Font.Weight? = nil
    var animateChanges: Bool = true
    
    var body: some View {
        PDSIcon(
            systemName: systemName,
            size: size,
            variant: variant,
            renderingMode: .hierarchical,
            weight: weight,
            variableValue: value
        )
        .animation(animateChanges ? .easeInOut(duration: 0.3) : nil, value: value)
    }
}

// MARK: - Tab Icon View

/// Specialized icon for tab bars with selection state
struct PDSTabIcon: View {
    let systemName: String
    let filledSystemName: String
    var isSelected: Bool
    var size: PDSIconSize = .large
    
    var body: some View {
        Image(systemName: isSelected ? filledSystemName : systemName)
            .font(.system(size: size.pointSize, weight: isSelected ? .semibold : .regular))
            .symbolRenderingMode(isSelected ? .hierarchical : .monochrome)
            .foregroundStyle(isSelected ? Colors.tabSelected : Colors.tabUnselected)
            .contentTransition(.symbolEffect(.replace.downUp.byLayer))
            .symbolEffect(.bounce.up, value: isSelected)
    }
}

// MARK: - Convenience Initializers

extension PDSIcon {
    /// Creates an icon with palette colors
    static func palette(
        _ systemName: String,
        size: PDSIconSize = .large,
        colors: [Color]
    ) -> some View {
        Image(systemName: systemName)
            .font(.system(size: size.pointSize, weight: size.weight))
            .symbolRenderingMode(.palette)
            .foregroundStyle(colors[0], colors.count > 1 ? colors[1] : colors[0], colors.count > 2 ? colors[2] : colors[0])
    }
    
    /// Creates a hierarchical icon
    static func hierarchical(
        _ systemName: String,
        size: PDSIconSize = .large,
        color: Color = Colors.iconPrimary
    ) -> some View {
        Image(systemName: systemName)
            .font(.system(size: size.pointSize, weight: size.weight))
            .symbolRenderingMode(.hierarchical)
            .foregroundStyle(color)
    }
    
    /// Creates a multicolor icon (uses Apple's built-in colors)
    static func multicolor(
        _ systemName: String,
        size: PDSIconSize = .large
    ) -> some View {
        Image(systemName: systemName)
            .font(.system(size: size.pointSize, weight: size.weight))
            .symbolRenderingMode(.multicolor)
    }
}

// MARK: - View Modifier for Symbol Effects

struct SymbolEffectModifier: ViewModifier {
    var effect: PDSSymbolEffect
    var isActive: Bool
    
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            switch effect {
            case .none:
                content
            case .bounce:
                content.symbolEffect(.bounce, value: isActive)
            case .pulse:
                content.symbolEffect(.pulse, options: isActive ? .repeating : .nonRepeating)
            case .variableColor:
                content.symbolEffect(.variableColor, options: isActive ? .repeating : .nonRepeating)
            case .scale:
                content.symbolEffect(.scale.up, isActive: isActive)
            case .wiggle:
                if #available(iOS 18.0, *) {
                    content.symbolEffect(.wiggle, value: isActive)
                } else {
                    content
                }
            case .breathe:
                if #available(iOS 18.0, *) {
                    content.symbolEffect(.breathe, options: isActive ? .repeating : .nonRepeating)
                } else {
                    content
                }
            case .rotate:
                if #available(iOS 18.0, *) {
                    content.symbolEffect(.rotate, value: isActive)
                } else {
                    content
                }
            }
        } else {
            content
        }
    }
}

extension View {
    /// Applies a PDS symbol effect to the view
    func pdsSymbolEffect(_ effect: PDSSymbolEffect, isActive: Bool = true) -> some View {
        modifier(SymbolEffectModifier(effect: effect, isActive: isActive))
    }
}

// MARK: - Preview

#Preview("Icon Sizes") {
    ScrollView {
        VStack(spacing: 32) {
            // Size Scale
            VStack(alignment: .leading, spacing: 16) {
                Text("Size Scale")
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 24) {
                    VStack(spacing: 8) {
                        PDSIcon(systemName: "heart.fill", size: .extraSmall)
                        Text("XS 12pt")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon(systemName: "heart.fill", size: .small)
                        Text("S 16pt")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon(systemName: "heart.fill", size: .medium)
                        Text("M 20pt")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon(systemName: "heart.fill", size: .large)
                        Text("L 24pt")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon(systemName: "heart.fill", size: .extraLarge)
                        Text("XL 32pt")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon(systemName: "heart.fill", size: .display)
                        Text("Display")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Divider()
            
            // Color Variants
            VStack(alignment: .leading, spacing: 16) {
                Text("Color Variants")
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "star.fill", variant: .primary)
                        Text("Primary")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "star.fill", variant: .secondary)
                        Text("Secondary")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "star.fill", variant: .accent)
                        Text("Accent")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "star.fill", variant: .disabled)
                        Text("Disabled")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "checkmark.circle.fill", variant: .positive)
                        Text("Positive")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "xmark.circle.fill", variant: .negative)
                        Text("Negative")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "exclamationmark.triangle.fill", variant: .warning)
                        Text("Warning")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 4) {
                        PDSIcon(systemName: "star.fill", variant: .placeholder)
                        Text("Placeholder")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Divider()
            
            // Rendering Modes
            VStack(alignment: .leading, spacing: 16) {
                Text("Rendering Modes")
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 32) {
                    VStack(spacing: 8) {
                        PDSIcon(
                            systemName: "cloud.sun.rain.fill",
                            size: .extraLarge,
                            renderingMode: .monochrome
                        )
                        Text("Mono")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon(
                            systemName: "cloud.sun.rain.fill",
                            size: .extraLarge,
                            renderingMode: .hierarchical
                        )
                        Text("Hierarchical")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon.palette(
                            "cloud.sun.rain.fill",
                            size: .extraLarge,
                            colors: [Colors.persistentAccent, Colors.persistentWarning, Colors.gray600]
                        )
                        Text("Palette")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        PDSIcon.multicolor("cloud.sun.rain.fill", size: .extraLarge)
                        Text("Multicolor")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Divider()
            
            // Variable Value Icons
            VStack(alignment: .leading, spacing: 16) {
                Text("Variable Value")
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 24) {
                    PDSVariableIcon(systemName: "speaker.wave.3.fill", value: 0.0, size: .extraLarge)
                    PDSVariableIcon(systemName: "speaker.wave.3.fill", value: 0.33, size: .extraLarge)
                    PDSVariableIcon(systemName: "speaker.wave.3.fill", value: 0.66, size: .extraLarge)
                    PDSVariableIcon(systemName: "speaker.wave.3.fill", value: 1.0, size: .extraLarge)
                }
                
                HStack(spacing: 24) {
                    PDSVariableIcon(systemName: "wifi", value: 0.0, size: .extraLarge)
                    PDSVariableIcon(systemName: "wifi", value: 0.33, size: .extraLarge)
                    PDSVariableIcon(systemName: "wifi", value: 0.66, size: .extraLarge)
                    PDSVariableIcon(systemName: "wifi", value: 1.0, size: .extraLarge)
                }
            }
            
            Divider()
            
            // On Media
            VStack(alignment: .leading, spacing: 16) {
                Text("On Media")
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                ZStack {
                    RoundedRectangle(cornerRadius: CornerRadius.card)
                        .fill(
                            LinearGradient(
                                colors: [Colors.gray700, Colors.gray400],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 120)
                    
                    HStack(spacing: 24) {
                        VStack(spacing: 8) {
                            PDSIcon(systemName: "heart.fill", size: .large, variant: .primaryOnMedia)
                            Text("Primary")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textPrimaryOnMedia)
                        }
                        
                        VStack(spacing: 8) {
                            PDSIcon(systemName: "heart.fill", size: .large, variant: .secondaryOnMedia)
                            Text("Secondary")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondaryOnMedia)
                        }
                    }
                }
            }
        }
        .padding(24)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Animated Icons") {
    AnimatedIconsPreview()
}

// Helper view for animated preview
struct AnimatedIconsPreview: View {
    @State private var isActive = false
    @State private var likeCount = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Tab-style icons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Tab Icons")
                        .typography(Typography.headline3Emphasized)
                        .foregroundColor(Colors.textPrimary)
                    
                    HStack(spacing: 32) {
                        PDSTabIcon(
                            systemName: "house",
                            filledSystemName: "house.fill",
                            isSelected: isActive
                        )
                        
                        PDSTabIcon(
                            systemName: "magnifyingglass",
                            filledSystemName: "magnifyingglass",
                            isSelected: !isActive
                        )
                        
                        PDSTabIcon(
                            systemName: "bell",
                            filledSystemName: "bell.fill",
                            isSelected: false
                        )
                    }
                    
                    Button("Toggle Selection") {
                        withAnimation {
                            isActive.toggle()
                        }
                    }
                    .pdsButton(variant: .secondary, size: .small)
                }
                
                Divider()
                
                // Animated state icons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Animated State Icons")
                        .typography(Typography.headline3Emphasized)
                        .foregroundColor(Colors.textPrimary)
                    
                    HStack(spacing: 32) {
                        Button {
                            withAnimation {
                                likeCount += 1
                            }
                        } label: {
                            PDSAnimatedIcon(
                                systemName: "heart",
                                size: .extraLarge,
                                variant: .secondary,
                                isActive: likeCount > 0,
                                activeSymbolName: "heart.fill",
                                activeVariant: .negative
                            )
                        }
                        
                        Button {
                            withAnimation {
                                isActive.toggle()
                            }
                        } label: {
                            PDSAnimatedIcon(
                                systemName: "bookmark",
                                size: .extraLarge,
                                variant: .secondary,
                                isActive: isActive,
                                activeSymbolName: "bookmark.fill",
                                activeVariant: .accent
                            )
                        }
                    }
                    
                    Text("Tap icons to toggle state")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                Divider()
                
                // Symbol Effects
                VStack(alignment: .leading, spacing: 16) {
                    Text("Symbol Effects (iOS 17+)")
                        .typography(Typography.headline3Emphasized)
                        .foregroundColor(Colors.textPrimary)
                    
                    HStack(spacing: 32) {
                        VStack(spacing: 8) {
                            PDSIcon(systemName: "bell.fill", size: .extraLarge)
                                .pdsSymbolEffect(.bounce, isActive: isActive)
                            Text("Bounce")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSIcon(systemName: "heart.fill", size: .extraLarge, variant: .negative)
                                .pdsSymbolEffect(.pulse, isActive: isActive)
                            Text("Pulse")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSIcon(systemName: "wifi", size: .extraLarge, renderingMode: .hierarchical)
                                .pdsSymbolEffect(.variableColor, isActive: isActive)
                            Text("Variable")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                    
                    Button(isActive ? "Stop Effects" : "Start Effects") {
                        isActive.toggle()
                    }
                    .pdsButton(variant: .secondary, size: .small)
                }
            }
            .padding(24)
        }
        .background(Colors.backgroundSurface)
    }
}

