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
///     .font(.system(size: IconSize.md))
///
/// PDSIcon(systemName: "star", size: .large)
/// ```
struct IconSize {
    
    // MARK: - Base Scale
    
    /// 10pt - Extra extra small icons (badges, indicators)
    static let xxs: CGFloat = 10
    
    /// 12pt - Extra small icons (inline, compact)
    static let xs: CGFloat = 12
    
    /// 14pt - Small icons (list accessories, buttons)
    static let sm: CGFloat = 14
    
    /// 16pt - Medium icons (standard UI)
    static let md: CGFloat = 16
    
    /// 20pt - Large icons (prominent actions)
    static let lg: CGFloat = 20
    
    /// 24pt - Extra large icons (navigation, headers)
    static let xl: CGFloat = 24
    
    /// 28pt - Extra extra large icons (feature icons)
    static let xxl: CGFloat = 28
    
    /// 32pt - Hero icons (empty states, onboarding)
    static let hero: CGFloat = 32
    
    /// 48pt - Display icons (large illustrations)
    static let display: CGFloat = 48
    
    // MARK: - Semantic Aliases
    
    /// Navigation bar icons (24pt)
    static let navBar: CGFloat = xl
    
    /// Tab bar icons (24pt)
    static let tabBar: CGFloat = xl
    
    /// Toolbar icons (20pt)
    static let toolbar: CGFloat = lg
    
    /// Button icons (16pt)
    static let button: CGFloat = md
    
    /// Button icons - small buttons (12pt)
    static let buttonSmall: CGFloat = xs
    
    /// List cell leading icons (20pt)
    static let listLeading: CGFloat = lg
    
    /// List cell trailing icons (14pt)
    static let listTrailing: CGFloat = sm
    
    /// Input field icons (16pt)
    static let input: CGFloat = md
    
    /// Badge/indicator icons (10pt)
    static let badge: CGFloat = xxs
    
    /// Action chip icons (14pt)
    static let chip: CGFloat = sm
    
    /// Inline text icons (14pt)
    static let inline: CGFloat = sm
    
    /// Card action icons (20pt)
    static let cardAction: CGFloat = lg
    
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
    func pdsIcon(size: CGFloat = IconSize.md, weight: IconWeight = .medium) -> some View {
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

