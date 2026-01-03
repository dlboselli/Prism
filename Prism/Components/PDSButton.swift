import SwiftUI

// MARK: - Button Variant Enum

/// Button style variants
enum PDSButtonVariant {
    case primary                  // Filled accent background
    case primaryDeemphasized      // Light accent background with accent text
    case secondary                // Gray background
    case destructive              // Red filled background
    case destructiveDeemphasized  // Light red background with red text
    case warning                  // Warning filled background
    case warningDeemphasized      // Light warning background with warning text
}

/// Button context for specialized backgrounds
enum PDSButtonContext {
    case surface    // Standard surface background
    case onColor    // On colored backgrounds (e.g., accent cards)
    case onMedia    // On images/videos
}

/// Button size variants
enum PDSButtonSize {
    case large      // Large size for prominent actions
    case medium     // Standard size (default)
    case small      // Compact size for inline actions
}

/// Button width mode
enum PDSButtonWidth {
    case flexible   // Fits content
    case fullWidth  // Expands to fill container
}

// MARK: - Unified Button Style

/// Unified PDS Button Style supporting all variants
struct PDSButtonStyle: ButtonStyle {
    var variant: PDSButtonVariant = .primary
    var context: PDSButtonContext = .surface
    var size: PDSButtonSize = .medium
    var width: PDSButtonWidth = .flexible
    var icon: String? = nil
    var iconPosition: PDSButtonIconPosition = .leading
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            if let icon = icon, iconPosition == .leading {
                Image(systemName: icon)
                    .font(.system(size: iconSize, weight: .semibold))
            }
            
        configuration.label
                .typography(typography)
            
            if let icon = icon, iconPosition == .trailing {
                Image(systemName: icon)
                    .font(.system(size: iconSize, weight: .semibold))
            }
        }
        .foregroundColor(foregroundColor(isPressed: configuration.isPressed))
        .padding(.horizontal, horizontalPadding)
        .frame(height: buttonHeight)
        .frame(maxWidth: width == .fullWidth ? .infinity : nil)
            .background(
            RoundedRectangle(cornerRadius: CornerRadius.button)
                    .fill(backgroundColor(isPressed: configuration.isPressed))
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    // MARK: - Computed Properties
    
    private var typography: Typography.Style {
        switch size {
        case .large: return Typography.button1
        case .medium: return Typography.button2
        case .small: return Typography.button3
        }
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .large: return 16
        case .medium: return 16
        case .small: return 12
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .large: return 20
        case .medium: return 16
        case .small: return 12
        }
    }
    
    private var buttonHeight: CGFloat {
        switch size {
        case .large: return 40
        case .medium: return 36
        case .small: return 28
        }
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        // Use semantic disabled text color for disabled state
        if !isEnabled {
            return Colors.textDisabled
        }
        
        switch (variant, context) {
        // Primary variants
        case (.primary, .surface):
            return Colors.primaryButtonText
        case (.primary, .onColor):
            return Colors.primaryButtonTextOnColor
        case (.primary, .onMedia):
            return Colors.primaryButtonTextOnMedia
            
        // Primary Deemphasized variants
        case (.primaryDeemphasized, .surface):
            return Colors.primaryDeemphasizedButtonText
        case (.primaryDeemphasized, .onColor):
            return Colors.textPrimaryOnColor
        case (.primaryDeemphasized, .onMedia):
            return Colors.textPrimaryOnMedia
            
        // Secondary variants
        case (.secondary, .surface):
            return Colors.secondaryButtonText
        case (.secondary, .onColor):
            return Colors.secondaryButtonTextOnColor
        case (.secondary, .onMedia):
            return Colors.secondaryButtonTextOnMedia
            
        // Destructive
        case (.destructive, _):
            return Colors.destructiveButtonText
            
        // Destructive Secondary
        case (.destructiveDeemphasized, _):
            return Colors.destructiveDeemphasizedButtonText
            
        // Warning
        case (.warning, _):
            return Colors.warningButtonText
            
        // Warning Secondary
        case (.warningDeemphasized, _):
            return Colors.warningDeemphasizedButtonText
        }
    }
    
    private func backgroundColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return disabledBackgroundColor
        }
        
        let baseColor: Color
        let pressedColor: Color
        
        switch (variant, context) {
        // Primary variants
        case (.primary, .surface):
            baseColor = Colors.primaryButtonBackground
            pressedColor = Colors.primaryButtonBackgroundPressed
        case (.primary, .onColor):
            baseColor = Colors.primaryButtonBackgroundOnColor
            pressedColor = Colors.primaryButtonBackgroundOnColor.opacity(0.8)
        case (.primary, .onMedia):
            baseColor = Colors.primaryButtonOnMedia
            pressedColor = Colors.primaryButtonOnMedia.opacity(0.8)
            
        // Primary Deemphasized variants
        case (.primaryDeemphasized, .surface):
            baseColor = Colors.primaryDeemphasizedButtonBackground
            pressedColor = Colors.primaryDeemphasizedButtonBackground.opacity(0.7)
        case (.primaryDeemphasized, .onColor):
            baseColor = Colors.whiteAlpha20
            pressedColor = Colors.whiteAlpha30
        case (.primaryDeemphasized, .onMedia):
            baseColor = Colors.whiteAlpha20
            pressedColor = Colors.whiteAlpha30
            
        // Secondary variants
        case (.secondary, .surface):
            baseColor = Colors.secondaryButtonBackground
            pressedColor = Colors.secondaryButtonBackground.opacity(0.7)
        case (.secondary, .onColor):
            baseColor = Colors.secondaryButtonBackgroundOnColor
            pressedColor = Colors.secondaryButtonBackgroundOnColor.opacity(0.8)
        case (.secondary, .onMedia):
            baseColor = Colors.secondaryButtonBackgroundOnMedia
            pressedColor = Colors.secondaryButtonBackgroundOnMedia.opacity(0.8)
            
        // Destructive
        case (.destructive, _):
            baseColor = Colors.destructiveButtonBackground
            pressedColor = Colors.destructiveButtonBackgroundPressed
            
        // Destructive Secondary
        case (.destructiveDeemphasized, _):
            baseColor = Colors.destructiveDeemphasizedButtonBackground
            pressedColor = Colors.destructiveDeemphasizedButtonBackground.opacity(0.7)
            
        // Warning
        case (.warning, _):
            baseColor = Colors.warningButtonBackground
            pressedColor = Colors.warningButtonBackgroundPressed
            
        // Warning Secondary
        case (.warningDeemphasized, _):
            baseColor = Colors.warningDeemphasizedButtonBackground
            pressedColor = Colors.warningDeemphasizedButtonBackground.opacity(0.7)
        }
        
        return isPressed ? pressedColor : baseColor
    }
    
    private var disabledBackgroundColor: Color {
        switch variant {
        case .primary, .primaryDeemphasized, .secondary, .destructiveDeemphasized, .warningDeemphasized:
            return Colors.disabledButtonBackground
        case .destructive, .warning:
            return Colors.disabledButtonBackground
        }
    }
}

/// Icon position for buttons with icons
enum PDSButtonIconPosition {
    case leading
    case trailing
}

// MARK: - Icon Only Button Style

/// Icon-only button style (circular)
struct PDSIconOnlyButtonStyle: ButtonStyle {
    var variant: PDSButtonVariant = .primary
    var context: PDSButtonContext = .surface
    var size: PDSButtonSize = .medium
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: iconSize, weight: .semibold))
            .foregroundColor(foregroundColor(isPressed: configuration.isPressed))
            .frame(width: buttonSize, height: buttonSize)
            .background(
                Circle()
                    .fill(backgroundColor(isPressed: configuration.isPressed))
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .large: return 16
        case .medium: return 16
        case .small: return 12
        }
    }
    
    private var buttonSize: CGFloat {
        switch size {
        case .large: return 40
        case .medium: return 36
        case .small: return 28
        }
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        // Use semantic disabled icon color for disabled state
        if !isEnabled {
            return Colors.iconDisabled
        }
        
        switch (variant, context) {
        case (.primary, .surface):
            return Colors.primaryButtonIcon
        case (.primary, .onColor):
            return Colors.primaryButtonIconOnColor
        case (.primary, .onMedia):
            return Colors.primaryButtonIconOnMedia
        case (.primaryDeemphasized, .surface):
            return Colors.primaryDeemphasizedButtonIcon
        case (.primaryDeemphasized, .onColor), (.primaryDeemphasized, .onMedia):
            return Colors.textPrimaryOnColor
        case (.secondary, .surface):
            return Colors.secondaryButtonIcon
        case (.secondary, .onColor):
            return Colors.secondaryButtonIconOnColor
        case (.secondary, .onMedia):
            return Colors.secondaryButtonIconOnMedia
        case (.destructive, _):
            return Colors.destructiveButtonText
            
        case (.destructiveDeemphasized, _):
            return Colors.destructiveDeemphasizedButtonText
            
        case (.warning, _):
            return Colors.warningButtonText
            
        case (.warningDeemphasized, _):
            return Colors.warningDeemphasizedButtonText
        }
    }
    
    private func backgroundColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return disabledBackgroundColor
        }
        
        let baseColor: Color
        let pressedColor: Color
        
        switch (variant, context) {
        case (.primary, .surface):
            baseColor = Colors.primaryButtonBackground
            pressedColor = Colors.primaryButtonBackgroundPressed
        case (.primary, .onColor):
            baseColor = Colors.primaryButtonBackgroundOnColor
            pressedColor = Colors.primaryButtonBackgroundOnColor.opacity(0.8)
        case (.primary, .onMedia):
            baseColor = Colors.primaryButtonOnMedia
            pressedColor = Colors.primaryButtonOnMedia.opacity(0.8)
        case (.primaryDeemphasized, .surface):
            baseColor = Colors.primaryDeemphasizedButtonBackground
            pressedColor = Colors.primaryDeemphasizedButtonBackground.opacity(0.7)
        case (.primaryDeemphasized, .onColor), (.primaryDeemphasized, .onMedia):
            baseColor = Colors.whiteAlpha20
            pressedColor = Colors.whiteAlpha30
        case (.secondary, .surface):
            baseColor = Colors.secondaryButtonBackground
            pressedColor = Colors.secondaryButtonBackground.opacity(0.7)
        case (.secondary, .onColor), (.secondary, .onMedia):
            baseColor = Colors.secondaryButtonBackgroundOnMedia
            pressedColor = Colors.secondaryButtonBackgroundOnMedia.opacity(0.8)
        case (.destructive, _):
            baseColor = Colors.destructiveButtonBackground
            pressedColor = Colors.destructiveButtonBackgroundPressed
        case (.destructiveDeemphasized, _):
            baseColor = Colors.destructiveDeemphasizedButtonBackground
            pressedColor = Colors.destructiveDeemphasizedButtonBackground.opacity(0.7)
        case (.warning, _):
            baseColor = Colors.warningButtonBackground
            pressedColor = Colors.warningButtonBackgroundPressed
        case (.warningDeemphasized, _):
            baseColor = Colors.warningDeemphasizedButtonBackground
            pressedColor = Colors.warningDeemphasizedButtonBackground.opacity(0.7)
        }
        
        return isPressed ? pressedColor : baseColor
    }
    
    private var disabledBackgroundColor: Color {
        switch variant {
        case .primary, .primaryDeemphasized, .secondary, .destructiveDeemphasized, .warningDeemphasized:
            return Colors.disabledButtonBackground
        case .destructive, .warning:
            return Colors.disabledButtonBackground
        }
    }
}

// MARK: - View Extensions

extension View {
    /// Applies PDS button style with full customization
    func pdsButton(
        variant: PDSButtonVariant = .primary,
        context: PDSButtonContext = .surface,
        size: PDSButtonSize = .medium,
        width: PDSButtonWidth = .flexible,
        icon: String? = nil,
        iconPosition: PDSButtonIconPosition = .leading,
        isEnabled: Bool = true
    ) -> some View {
        self.buttonStyle(PDSButtonStyle(
            variant: variant,
            context: context,
            size: size,
            width: width,
            icon: icon,
            iconPosition: iconPosition,
            isEnabled: isEnabled
        ))
    }
    
    /// Applies PDS circular icon-only button style (filled background)
    func pdsCircularButton(
        variant: PDSButtonVariant = .secondary,
        context: PDSButtonContext = .surface,
        size: PDSButtonSize = .medium,
        isEnabled: Bool = true
    ) -> some View {
        self.buttonStyle(PDSIconOnlyButtonStyle(
            variant: variant,
            context: context,
            size: size,
            isEnabled: isEnabled
        ))
    }
    
    // MARK: - Convenience Methods
    
    /// Primary button - filled accent background
    func pdsPrimaryButton(size: PDSButtonSize = .medium, isEnabled: Bool = true) -> some View {
        pdsButton(variant: .primary, size: size, isEnabled: isEnabled)
    }
    
    /// Primary Deemphasized button - light accent background
    func pdsPrimaryDeemphasizedButton(size: PDSButtonSize = .medium, isEnabled: Bool = true) -> some View {
        pdsButton(variant: .primaryDeemphasized, size: size, isEnabled: isEnabled)
    }
    
    /// Secondary button - gray background
    func pdsSecondaryButton(size: PDSButtonSize = .medium, isEnabled: Bool = true) -> some View {
        pdsButton(variant: .secondary, size: size, isEnabled: isEnabled)
    }
    
    /// Destructive button - red background
    func pdsDestructiveButton(size: PDSButtonSize = .medium, isEnabled: Bool = true) -> some View {
        pdsButton(variant: .destructive, size: size, isEnabled: isEnabled)
    }
    
    /// Large button variant
    func pdsLargeButton(_ variant: PDSButtonVariant = .primary, isEnabled: Bool = true) -> some View {
        pdsButton(variant: variant, size: .large, isEnabled: isEnabled)
    }
    
    /// Small button variant
    func pdsSmallButton(_ variant: PDSButtonVariant = .primary, isEnabled: Bool = true) -> some View {
        pdsButton(variant: variant, size: .small, isEnabled: isEnabled)
    }
    
    // Legacy support - Tertiary maps to Primary Deemphasized
    func pdsTertiaryButton(isEnabled: Bool = true) -> some View {
        pdsPrimaryDeemphasizedButton(isEnabled: isEnabled)
    }
}

// MARK: - Preview

#Preview("Button Variants") {
    ScrollView {
        VStack(spacing: 32) {
            // Standard Variants
            VStack(alignment: .leading, spacing: 16) {
                Text("Standard Variants")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                VStack(spacing: 12) {
                    Button("Primary") { }
                        .pdsButton(variant: .primary, width: .fullWidth)
                    
                    Button("Primary Deemphasized") { }
                        .pdsButton(variant: .primaryDeemphasized, width: .fullWidth)
                    
                    Button("Secondary") { }
                        .pdsButton(variant: .secondary, width: .fullWidth)
                    
                    Button("Destructive") { }
                        .pdsButton(variant: .destructive, width: .fullWidth)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // On Color Context
            VStack(alignment: .leading, spacing: 16) {
                Text("On Color")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                VStack(spacing: 12) {
                    Button("Primary on Color") { }
                        .pdsButton(variant: .primary, context: .onColor, width: .fullWidth)
                    
                    Button("Secondary on Color") { }
                        .pdsButton(variant: .secondary, context: .onColor, width: .fullWidth)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: CornerRadius.card)
                        .fill(Colors.persistentPositive)
                )
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // On Media Context
            VStack(alignment: .leading, spacing: 16) {
                Text("On Media")
                    .typography(PDSTextScale.content.headline)
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
                        .frame(height: 160)
                    
                    VStack(spacing: 12) {
                        Button("Primary on Media") { }
                            .pdsButton(variant: .primary, context: .onMedia)
                        
                        Button("Secondary on Media") { }
                            .pdsButton(variant: .secondary, context: .onMedia)
                    }
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Icon + Label
            VStack(alignment: .leading, spacing: 16) {
                Text("Icon + Label")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                VStack(spacing: 12) {
                    Button("Add Photo") { }
                        .pdsButton(variant: .primary, width: .fullWidth, icon: "photo")
                    
                    Button("Share") { }
                        .pdsButton(variant: .secondary, width: .fullWidth, icon: "square.and.arrow.up", iconPosition: .trailing)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Icon Only
            VStack(alignment: .leading, spacing: 16) {
                Text("Icon Only")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 16) {
                    Button { } label: {
                        Image(systemName: "plus")
                    }
                    .pdsCircularButton(variant: .primary)
                    
                    Button { } label: {
                        Image(systemName: "heart")
                    }
                    .pdsCircularButton(variant: .primaryDeemphasized)
                    
                    Button { } label: {
                        Image(systemName: "ellipsis")
                    }
                    .pdsCircularButton(variant: .secondary)
                    
                    Button { } label: {
                        Image(systemName: "trash")
                    }
                    .pdsCircularButton(variant: .destructive)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Size Variants
            VStack(alignment: .leading, spacing: 16) {
                Text("Size Variants")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Large")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                    
                    Button("Large Button") { }
                        .pdsButton(variant: .primary, size: .large)
                    
                    Text("Medium (Default)")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                        .padding(.top, 8)
                    
                    Button("Medium Button") { }
                        .pdsButton(variant: .primary, size: .medium)
                    
                Text("Small")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                        .padding(.top, 8)
                    
                    Button("Small Button") { }
                        .pdsButton(variant: .primary, size: .small)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Width Modes
            VStack(alignment: .leading, spacing: 16) {
                Text("Width Modes")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Flexible (fits content)")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                    
                    Button("Save") { }
                        .pdsButton(variant: .primary, width: .flexible)
                    
                    Text("Full Width")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                    
                    Button("Save") { }
                        .pdsButton(variant: .primary, width: .fullWidth)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Disabled State
            VStack(alignment: .leading, spacing: 16) {
                Text("Disabled")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Button("Submit") { }
                    .pdsButton(variant: .primary, width: .fullWidth, isEnabled: false)
            }
        }
        .padding(24)
    }
    .background(Colors.backgroundSurface)
}
