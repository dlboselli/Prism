//
//  IconSize.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Standard icon size tokens for consistent iconography throughout the app.
//

import SwiftUI

/// Prism Design System Icon Size Tokens
///
/// Usage:
/// ```swift
/// Image(systemName: "heart.fill")
///     .font(.system(size: IconSize.medium))
///
/// PDSIcon(systemName: "star", size: .large)
/// ```
struct IconSize {
    
    // MARK: - Base Scale
    
    /// 10pt - Extra extra small icons (badges, indicators)
    static let xxSmall: CGFloat = 10
    
    /// 12pt - Extra small icons (inline, compact)
    static let xSmall: CGFloat = 12
    
    /// 14pt - Small icons (list accessories, buttons)
    static let small: CGFloat = 14
    
    /// 16pt - Medium icons (standard UI)
    static let medium: CGFloat = 16
    
    /// 20pt - Large icons (prominent actions)
    static let large: CGFloat = 20
    
    /// 24pt - Extra large icons (navigation, headers)
    static let xLarge: CGFloat = 24
    
    /// 28pt - Extra extra large icons (feature icons)
    static let xxLarge: CGFloat = 28
    
    /// 32pt - Hero icons (empty states, onboarding)
    static let hero: CGFloat = 32
    
    /// 48pt - Display icons (large illustrations)
    static let display: CGFloat = 48
    
    // MARK: - Semantic Aliases
    
    /// Navigation bar icons (24pt)
    static let navBar: CGFloat = xLarge
    
    /// Tab bar icons (24pt)
    static let tabBar: CGFloat = xLarge
    
    /// Toolbar icons (20pt)
    static let toolbar: CGFloat = large
    
    /// Button icons (16pt)
    static let button: CGFloat = medium
    
    /// Button icons - small buttons (12pt)
    static let buttonSmall: CGFloat = xSmall
    
    /// List cell leading icons (20pt)
    static let listLeading: CGFloat = large
    
    /// List cell trailing icons (14pt)
    static let listTrailing: CGFloat = small
    
    /// Input field icons (16pt)
    static let input: CGFloat = medium
    
    /// Badge/indicator icons (10pt)
    static let badge: CGFloat = xxSmall
    
    /// Action chip icons (14pt)
    static let chip: CGFloat = small
    
    /// Inline text icons (14pt)
    static let inline: CGFloat = small
    
    /// Card action icons (20pt)
    static let cardAction: CGFloat = large
    
    /// Empty state icons (48pt)
    static let emptyState: CGFloat = display
}

// MARK: - Icon Weight

/// Standard icon weights for different contexts
enum IconWeight {
    case light
    case regular
    case medium
    case semibold
    case bold
    
    var fontWeight: Font.Weight {
        switch self {
        case .light: return .light
        case .regular: return .regular
        case .medium: return .medium
        case .semibold: return .semibold
        case .bold: return .bold
        }
    }
}

// MARK: - View Extension

extension Image {
    /// Apply PDS icon styling
    func pdsIcon(size: CGFloat = IconSize.medium, weight: IconWeight = .medium) -> some View {
        self
            .font(.system(size: size, weight: weight.fontWeight))
    }
    
    /// Apply PDS icon styling with semantic size
    func pdsNavBarIcon() -> some View {
        self.pdsIcon(size: IconSize.navBar, weight: .medium)
    }
    
    func pdsToolbarIcon() -> some View {
        self.pdsIcon(size: IconSize.toolbar, weight: .medium)
    }
    
    func pdsButtonIcon() -> some View {
        self.pdsIcon(size: IconSize.button, weight: .semibold)
    }
    
    func pdsListIcon() -> some View {
        self.pdsIcon(size: IconSize.listLeading, weight: .regular)
    }
}

