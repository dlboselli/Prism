import SwiftUI

// MARK: - Icon Button Size

/// Icon button size variants
enum PDSIconButtonSize {
    case regular    // 24pt icon (default)
    case small      // 20pt icon
    
    var iconSize: CGFloat {
        switch self {
        case .regular: return 24
        case .small: return 20
        }
    }
    
    var touchTargetSize: CGFloat {
        switch self {
        case .regular: return 44
        case .small: return 40
        }
    }
}

// MARK: - Icon Button Variant

/// Icon button color variants
enum PDSIconButtonVariant {
    case primary            // Primary icon color (default)
    case secondary          // Secondary/muted icon color
    case onMediaPrimary     // Primary on media/images
    case onMediaSecondary   // Secondary on media/images
}

// MARK: - Icon Button Style

/// PDS Icon Button Style
struct PDSIconButtonStyle: ButtonStyle {
    var size: PDSIconButtonSize = .regular
    var variant: PDSIconButtonVariant = .primary
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.iconSize, weight: .medium))
            .foregroundColor(foregroundColor(isPressed: configuration.isPressed))
            .frame(width: size.touchTargetSize, height: size.touchTargetSize)
            .contentShape(Rectangle())
            .scaleEffect(configuration.isPressed ? 0.90 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return disabledColor
        }
        
        switch variant {
        case .primary:
            return isPressed ? Colors.iconPrimary.opacity(0.7) : Colors.iconPrimary
        case .secondary:
            return isPressed ? Colors.iconSecondary.opacity(0.7) : Colors.iconSecondary
        case .onMediaPrimary:
            return isPressed ? Colors.iconPrimaryOnMedia.opacity(0.7) : Colors.iconPrimaryOnMedia
        case .onMediaSecondary:
            return isPressed ? Colors.iconSecondaryOnMedia.opacity(0.7) : Colors.iconSecondaryOnMedia
        }
    }
    
    private var disabledColor: Color {
        switch variant {
        case .primary, .secondary:
            return Colors.iconDisabled
        case .onMediaPrimary, .onMediaSecondary:
            return Colors.iconDisabledOnMedia
        }
    }
}

// MARK: - View Extensions

extension View {
    /// Applies PDS icon button style
    /// - Parameters:
    ///   - size: Icon size (.regular = 24pt, .small = 20pt)
    ///   - variant: Color variant (.primary, .secondary, .onMediaPrimary, .onMediaSecondary)
    ///   - isEnabled: Whether the button is enabled
    func pdsIconButton(
        size: PDSIconButtonSize = .regular,
        variant: PDSIconButtonVariant = .primary,
        isEnabled: Bool = true
    ) -> some View {
        self.buttonStyle(PDSIconButtonStyle(
            size: size,
            variant: variant,
            isEnabled: isEnabled
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
                
                HStack(spacing: 24) {
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(size: .regular)
                        
                        Text("24pt")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 8) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(size: .small)
                        
                        Text("20pt")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Divider()
            
            // Primary Color (Default)
            VStack(alignment: .leading, spacing: 16) {
                Text("Primary (Default)")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 16) {
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
                        Image(systemName: "ellipsis")
                    }
                    .pdsIconButton(variant: .primary)
                }
            }
            
            Divider()
            
            // Secondary Color
            VStack(alignment: .leading, spacing: 16) {
                Text("Secondary")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 16) {
                    Button { } label: {
                        Image(systemName: "heart")
                    }
                    .pdsIconButton(variant: .secondary)
                    
                    Button { } label: {
                        Image(systemName: "message")
                    }
                    .pdsIconButton(variant: .secondary)
                    
                    Button { } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .pdsIconButton(variant: .secondary)
                    
                    Button { } label: {
                        Image(systemName: "ellipsis")
                    }
                    .pdsIconButton(variant: .secondary)
                }
            }
            
            Divider()
            
            // On Media
            VStack(alignment: .leading, spacing: 16) {
                Text("On Media")
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                
                ZStack {
                    RoundedRectangle(cornerRadius: CornerRadius.card)
                        .fill(
                            LinearGradient(
                                colors: [Colors.gray30, Colors.gray50],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 160)
                    
                    HStack(spacing: 32) {
                        VStack(spacing: 12) {
                            Text("Primary")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textPrimaryOnMedia)
                            
                            HStack(spacing: 16) {
                                Button { } label: {
                                    Image(systemName: "heart")
                                }
                                .pdsIconButton(variant: .onMediaPrimary)
                                
                                Button { } label: {
                                    Image(systemName: "message")
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
                            
                            HStack(spacing: 16) {
                                Button { } label: {
                                    Image(systemName: "heart")
                                }
                                .pdsIconButton(variant: .onMediaSecondary)
                                
                                Button { } label: {
                                    Image(systemName: "message")
                                }
                                .pdsIconButton(variant: .onMediaSecondary)
                                
                                Button { } label: {
                                    Image(systemName: "xmark")
                                }
                                .pdsIconButton(variant: .onMediaSecondary)
                            }
                        }
                    }
                }
            }
            
            Divider()
            
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
                    .pdsIconButton(variant: .secondary, isEnabled: false)
                }
            }
        }
        .padding(24)
    }
    .background(Colors.backgroundSurface)
}
