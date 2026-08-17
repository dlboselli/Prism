//
//  PDSBadge.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Badge components for displaying status indicators, counts, and labels.
//  Supports multiple variants, sizes, and optional icons.
//
//  Usage:
//  ```swift
//  // Status badge
//  PDSBadge("Active", variant: .positive)
//
//  // Count badge
//  PDSBadge.count(5)
//
//  // Badge with icon
//  PDSBadge("Verified", icon: "checkmark.seal.fill", variant: .accent)
//
//  // Dot indicator
//  PDSBadge.dot(variant: .negative)
//  ```
//

import SwiftUI

// MARK: - Badge Variant

enum PDSBadgeVariant {
    case neutral
    case accent
    case positive
    case negative
    case warning
    
    var backgroundColor: Color {
        switch self {
        case .neutral: return Colors.backgroundDeemphasized
        case .accent: return Colors.persistentAccentDeemphasized
        case .positive: return Colors.persistentPositiveDeemphasized
        case .negative: return Colors.persistentNegativeDeemphasized
        case .warning: return Colors.persistentWarningDeemphasized
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .neutral: return Colors.textSecondary
        case .accent: return Colors.persistentAccent
        case .positive: return Colors.persistentPositive
        case .negative: return Colors.persistentNegative
        case .warning: return Colors.persistentWarning
        }
    }
    
    var solidBackgroundColor: Color {
        switch self {
        case .neutral: return Colors.backgroundDeemphasized
        case .accent: return Colors.persistentAccent
        case .positive: return Colors.persistentPositive
        case .negative: return Colors.persistentNegative
        case .warning: return Colors.persistentWarning
        }
    }
    
    var solidForegroundColor: Color {
        switch self {
        case .neutral: return Colors.textSecondary  // Dark text on light gray background
        case .accent, .positive, .negative, .warning: return .white
        }
    }
}

// MARK: - Badge Size

enum PDSBadgeSize {
    case small
    case medium
    case large
    
    var font: Typography.Style {
        switch self {
        case .small: return Typography.meta2   // 13pt semibold
        case .medium: return Typography.meta2  // 13pt semibold
        case .large: return Typography.button2 // 15pt semibold
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .small: return 10
        case .medium: return 12
        case .large: return 14
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .small: return 6
        case .medium: return 8
        case .large: return 10
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .small: return 2
        case .medium: return 4
        case .large: return 6
        }
    }
    
    var dotSize: CGFloat {
        switch self {
        case .small: return 6
        case .medium: return 8
        case .large: return 10
        }
    }
}

// MARK: - PDSBadge

struct PDSBadge: View {
    let text: String?
    let icon: String?
    let variant: PDSBadgeVariant
    let size: PDSBadgeSize
    let isSolid: Bool
    
    init(
        _ text: String,
        icon: String? = nil,
        variant: PDSBadgeVariant = .neutral,
        size: PDSBadgeSize = .medium,
        isSolid: Bool = false
    ) {
        self.text = text
        self.icon = icon
        self.variant = variant
        self.size = size
        self.isSolid = isSolid
    }
    
    private init(
        text: String?,
        icon: String?,
        variant: PDSBadgeVariant,
        size: PDSBadgeSize,
        isSolid: Bool
    ) {
        self.text = text
        self.icon = icon
        self.variant = variant
        self.size = size
        self.isSolid = isSolid
    }
    
    var body: some View {
        HStack(spacing: 4) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: size.iconSize, weight: .medium))
            }
            
            if let text = text {
                Text(text)
                    .typography(size.font)
                    .lineLimit(1)
            }
        }
        .foregroundColor(isSolid ? variant.solidForegroundColor : variant.foregroundColor)
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .background(isSolid ? variant.solidBackgroundColor : variant.backgroundColor)
        .clipShape(Capsule())
        .accessibilityElement(children: .combine)
    }
    
    // MARK: - Static Factories
    
    /// Count badge (e.g., notification count)
    static func count(_ count: Int, max: Int = 99, variant: PDSBadgeVariant = .negative, size: PDSBadgeSize = .small) -> PDSBadge {
        let displayText = count > max ? "\(max)+" : "\(count)"
        return PDSBadge(text: displayText, icon: nil, variant: variant, size: size, isSolid: true)
    }
    
    /// Dot indicator (no text)
    static func dot(variant: PDSBadgeVariant = .negative, size: PDSBadgeSize = .medium) -> some View {
        Circle()
            .fill(variant.solidBackgroundColor)
            .frame(width: size.dotSize, height: size.dotSize)
    }
    
    /// Icon-only badge
    static func icon(_ systemName: String, variant: PDSBadgeVariant = .neutral, size: PDSBadgeSize = .medium, isSolid: Bool = false) -> PDSBadge {
        PDSBadge(text: nil, icon: systemName, variant: variant, size: size, isSolid: isSolid)
    }
}

// MARK: - PDSStatusBadge

/// A pre-configured badge for common status states
struct PDSStatusBadge: View {
    enum Status {
        case active
        case inactive
        case pending
        case success
        case error
        case warning
        
        var text: String {
            switch self {
            case .active: return "Active"
            case .inactive: return "Inactive"
            case .pending: return "Pending"
            case .success: return "Success"
            case .error: return "Error"
            case .warning: return "Warning"
            }
        }
        
        var variant: PDSBadgeVariant {
            switch self {
            case .active, .success: return .positive
            case .inactive: return .neutral
            case .pending: return .accent
            case .error: return .negative
            case .warning: return .warning
            }
        }
        
        var icon: String? {
            switch self {
            case .active: return "checkmark.circle.fill"
            case .inactive: return "minus.circle.fill"
            case .pending: return "clock.fill"
            case .success: return "checkmark.circle.fill"
            case .error: return "xmark.circle.fill"
            case .warning: return "exclamationmark.triangle.fill"
            }
        }
    }
    
    let status: Status
    let showIcon: Bool
    let size: PDSBadgeSize
    
    init(_ status: Status, showIcon: Bool = true, size: PDSBadgeSize = .medium) {
        self.status = status
        self.showIcon = showIcon
        self.size = size
    }
    
    var body: some View {
        PDSBadge(
            status.text,
            icon: showIcon ? status.icon : nil,
            variant: status.variant,
            size: size
        )
    }
}

// MARK: - Preview

#Preview("PDSBadge") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Variants
            VStack(alignment: .leading, spacing: 12) {
                Text("Variants")
                    .typography(PDSTextScale.content.headline)
                
                HStack(spacing: 8) {
                    PDSBadge("Neutral", variant: .neutral)
                    PDSBadge("Accent", variant: .accent)
                    PDSBadge("Positive", variant: .positive)
                    PDSBadge("Negative", variant: .negative)
                    PDSBadge("Warning", variant: .warning)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Solid variants
            VStack(alignment: .leading, spacing: 12) {
                Text("Solid Variants")
                    .typography(PDSTextScale.content.headline)
                
                HStack(spacing: 8) {
                    PDSBadge("Neutral", variant: .neutral, isSolid: true)
                    PDSBadge("Accent", variant: .accent, isSolid: true)
                    PDSBadge("Positive", variant: .positive, isSolid: true)
                    PDSBadge("Negative", variant: .negative, isSolid: true)
                    PDSBadge("Warning", variant: .warning, isSolid: true)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Sizes
            VStack(alignment: .leading, spacing: 12) {
                Text("Sizes")
                    .typography(PDSTextScale.content.headline)
                
                HStack(spacing: 8) {
                    PDSBadge("Small", variant: .accent, size: .small)
                    PDSBadge("Medium", variant: .accent, size: .medium)
                    PDSBadge("Large", variant: .accent, size: .large)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // With icons
            VStack(alignment: .leading, spacing: 12) {
                Text("With Icons")
                    .typography(PDSTextScale.content.headline)
                
                HStack(spacing: 8) {
                    PDSBadge("Verified", icon: "checkmark.seal.fill", variant: .accent)
                    PDSBadge("New", icon: "sparkles", variant: .positive)
                    PDSBadge("Urgent", icon: "exclamationmark.triangle.fill", variant: .negative)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Count badges
            VStack(alignment: .leading, spacing: 12) {
                Text("Count Badges")
                    .typography(PDSTextScale.content.headline)
                
                HStack(spacing: 12) {
                    PDSBadge.count(3)
                    PDSBadge.count(12)
                    PDSBadge.count(99)
                    PDSBadge.count(150)
                    PDSBadge.count(5, variant: .accent)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Dot indicators
            VStack(alignment: .leading, spacing: 12) {
                Text("Dot Indicators")
                    .typography(PDSTextScale.content.headline)
                
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        PDSBadge.dot(variant: .positive)
                        Text("Online")
                            .typography(Typography.body3)
                    }
                    
                    HStack(spacing: 4) {
                        PDSBadge.dot(variant: .warning)
                        Text("Away")
                            .typography(Typography.body3)
                    }
                    
                    HStack(spacing: 4) {
                        PDSBadge.dot(variant: .neutral)
                        Text("Offline")
                            .typography(Typography.body3)
                    }
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Status badges
            VStack(alignment: .leading, spacing: 12) {
                Text("Status Badges")
                    .typography(PDSTextScale.content.headline)
                
                HStack(spacing: 8) {
                    PDSStatusBadge(.active)
                    PDSStatusBadge(.pending)
                    PDSStatusBadge(.inactive)
                }
                
                HStack(spacing: 8) {
                    PDSStatusBadge(.success)
                    PDSStatusBadge(.warning)
                    PDSStatusBadge(.error)
                }
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

