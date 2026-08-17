//
//  Typography.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

/// Prism Design System Typography
/// Uses Inter font family
struct Typography {
    
    // MARK: - Font Family
    
    private enum Inter {
        static let regular = "Inter-Regular"
        static let medium = "Inter-Medium"
        static let semibold = "Inter-SemiBold"
        static let bold = "Inter-Bold"
    }
    
    // MARK: - Style
    
    struct Style {
        let font: Font
        let lineSpacing: CGFloat
        let letterSpacing: CGFloat

        init(_ fontName: String, size: CGFloat, leading: CGFloat, tracking: CGFloat = 0, relativeTo textStyle: Font.TextStyle = .body) {
            self.font = .custom(fontName, size: size, relativeTo: textStyle)
            self.lineSpacing = leading - size
            self.letterSpacing = tracking
        }
        
        func apply(to view: some View) -> some View {
            view.font(font).lineSpacing(lineSpacing).tracking(letterSpacing)
        }
    }
    
    // MARK: - Headlines
    
    // Headline 0 (28pt)
    static let headline0 = Style(Inter.medium, size: 28, leading: 32, relativeTo: .title)
    static let headline0Emphasized = Style(Inter.bold, size: 28, leading: 32, relativeTo: .title)
    static let headline0Deemphasized = Style(Inter.regular, size: 28, leading: 32, relativeTo: .title)

    // Headline 1 (24pt)
    static let headline1 = Style(Inter.medium, size: 24, leading: 28, relativeTo: .title2)
    static let headline1Emphasized = Style(Inter.bold, size: 24, leading: 28, relativeTo: .title2)
    static let headline1Deemphasized = Style(Inter.regular, size: 24, leading: 28, relativeTo: .title2)

    // Headline 2 (20pt)
    static let headline2 = Style(Inter.medium, size: 20, leading: 24, relativeTo: .title3)
    static let headline2Emphasized = Style(Inter.bold, size: 20, leading: 24, relativeTo: .title3)
    static let headline2Deemphasized = Style(Inter.regular, size: 20, leading: 24, relativeTo: .title3)

    // Headline 3 (17pt)
    static let headline3 = Style(Inter.medium, size: 17, leading: 20, relativeTo: .headline)
    static let headline3Emphasized = Style(Inter.bold, size: 17, leading: 20, relativeTo: .headline)
    static let headline3Deemphasized = Style(Inter.regular, size: 17, leading: 20, relativeTo: .headline)

    // Headline 4 (15pt)
    static let headline4 = Style(Inter.medium, size: 15, leading: 20, relativeTo: .subheadline)
    static let headline4Emphasized = Style(Inter.bold, size: 15, leading: 20, relativeTo: .subheadline)
    static let headline4Deemphasized = Style(Inter.regular, size: 15, leading: 20, relativeTo: .subheadline)

    // MARK: - Body

    static let body1 = Style(Inter.regular, size: 20, leading: 24, relativeTo: .title3)
    static let body2 = Style(Inter.regular, size: 17, leading: 20, relativeTo: .body)
    static let body3 = Style(Inter.regular, size: 15, leading: 20, relativeTo: .subheadline)
    static let body4 = Style(Inter.regular, size: 13, leading: 16, relativeTo: .footnote)

    static let body1Link = Style(Inter.semibold, size: 20, leading: 24, relativeTo: .title3)
    static let body2Link = Style(Inter.semibold, size: 17, leading: 20, relativeTo: .body)
    static let body3Link = Style(Inter.semibold, size: 15, leading: 20, relativeTo: .subheadline)
    static let body4Link = Style(Inter.semibold, size: 13, leading: 16, relativeTo: .footnote)

    // MARK: - Button

    static let button1 = Style(Inter.semibold, size: 17, leading: 20, relativeTo: .body)
    static let button2 = Style(Inter.semibold, size: 15, leading: 20, relativeTo: .subheadline)
    static let button3 = Style(Inter.semibold, size: 13, leading: 16, relativeTo: .footnote)

    // MARK: - Caption

    static let caption1 = Style(Inter.regular, size: 13, leading: 16, relativeTo: .footnote)
    static let caption1Emphasized = Style(Inter.semibold, size: 13, leading: 16, relativeTo: .footnote)
    static let caption2 = Style(Inter.regular, size: 12, leading: 16, relativeTo: .caption)
    static let caption2Emphasized = Style(Inter.semibold, size: 12, leading: 16, relativeTo: .caption)
    
    // MARK: - Semantic Styles
    
    struct SemanticStyle {
        let typography: Style
        let color: Color
        
        func apply(to view: some View) -> some View {
            view.typography(typography).foregroundColor(color)
        }
    }
    
    static let headlinePrimary = SemanticStyle(typography: headline3Emphasized, color: Colors.textPrimary)
    static let bodyPrimary = SemanticStyle(typography: body2, color: Colors.textPrimary)
    static let bodySecondary = SemanticStyle(typography: body2, color: Colors.textSecondary)
    static let link = SemanticStyle(typography: body2Link, color: Colors.textAccent)
    static let captionSecondary = SemanticStyle(typography: caption1, color: Colors.textSecondary)
}

// MARK: - Font Accessors

extension Typography {
    /// Get just the font from a style (useful for TextFields where tracking causes issues)
    static func font(_ style: Style) -> Font {
        style.font
    }
    
    // MARK: - Common Font Shortcuts
    
    /// Inter Regular fonts for TextField use
    enum Fonts {
        static let body1 = Font.custom("Inter-Regular", size: 20, relativeTo: .title3)
        static let body2 = Font.custom("Inter-Regular", size: 17, relativeTo: .body)
        static let body3 = Font.custom("Inter-Regular", size: 15, relativeTo: .subheadline)
        static let body4 = Font.custom("Inter-Regular", size: 13, relativeTo: .footnote)

        static let headline3 = Font.custom("Inter-Medium", size: 17, relativeTo: .headline)
        static let headline4 = Font.custom("Inter-Medium", size: 15, relativeTo: .subheadline)

        static let caption1 = Font.custom("Inter-Regular", size: 13, relativeTo: .footnote)
        static let caption2 = Font.custom("Inter-Regular", size: 12, relativeTo: .caption)
    }
}

// MARK: - View Extension

extension View {
    func typography(_ style: Typography.Style) -> some View {
        style.apply(to: self)
    }
    
    func typography(_ style: Typography.SemanticStyle) -> some View {
        style.apply(to: self)
    }
    
    /// Apply just the font from a typography style (no tracking)
    /// Use for TextFields where tracking causes placeholder misalignment
    func typographyFont(_ style: Typography.Style) -> some View {
        self.font(style.font)
    }
}

// MARK: - PDSTextScale

/// Unified typography + spacing scale for consistent text hierarchy
///
/// Each scale provides coordinated typography styles and spacing values
/// that work together to create clear visual hierarchy.
///
/// ## Usage
/// ```swift
/// // Apply spacing to a VStack
/// VStack(spacing: PDSTextScale.compact.lineSpacing) {
///     Text("Title")
///         .typography(PDSTextScale.compact.headline)
///     Text("Description")
///         .typography(PDSTextScale.compact.body)
/// }
/// .padding(.vertical, PDSTextScale.compact.verticalPadding)
///
/// // Or use the convenience modifier
/// VStack(spacing: PDSTextScale.compact.lineSpacing) { ... }
///     .pdsTextPadding(.compact)
/// ```
///
/// ## Scale Selection Guide
/// - **hero**: Page titles, onboarding headers, empty states
/// - **section**: Card headers, section titles, modal headers
/// - **content**: List items, table rows, navigation cells
/// - **compact**: Comments, notifications, post headers, metadata
enum PDSTextScale {
    /// Large scale (24pt headline) — Page titles, hero sections, onboarding
    case hero
    
    /// Standard scale (20pt headline) — Cards, section headers, modal titles
    case section
    
    /// Compact scale (17pt headline) — List items, table rows, navigation cells
    case content
    
    /// Dense scale (15pt headline) — Comments, notifications, post headers, metadata
    case compact
    
    // MARK: - Typography
    
    /// Headline style for this scale
    var headline: Typography.Style {
        switch self {
        case .hero: return Typography.headline1Emphasized
        case .section: return Typography.headline2Emphasized
        case .content: return Typography.headline3Emphasized
        case .compact: return Typography.headline4Emphasized
        }
    }
    
    /// Body text style for this scale
    var body: Typography.Style {
        switch self {
        case .hero: return Typography.body1
        case .section: return Typography.body2
        case .content: return Typography.body3
        case .compact: return Typography.body4
        }
    }
    
    /// Caption style for this scale
    var caption: Typography.Style {
        switch self {
        case .hero: return Typography.caption1Emphasized
        case .section: return Typography.caption1Emphasized
        case .content: return Typography.caption1
        case .compact: return Typography.caption2
        }
    }
    
    /// Link style for this scale (semibold body)
    var link: Typography.Style {
        switch self {
        case .hero: return Typography.body1Link
        case .section: return Typography.body2Link
        case .content: return Typography.body3Link
        case .compact: return Typography.body4Link
        }
    }
    
    // MARK: - Spacing
    
    /// Spacing between text lines (headline → body → caption)
    var lineSpacing: CGFloat {
        switch self {
        case .hero: return 4
        case .section: return 3
        case .content: return 2
        case .compact: return 2
        }
    }
    
    /// Vertical padding for containers using this scale
    var verticalPadding: CGFloat {
        switch self {
        case .hero: return 16
        case .section: return 14
        case .content: return 12
        case .compact: return 10
        }
    }
}

