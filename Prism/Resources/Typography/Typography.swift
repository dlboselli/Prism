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
        static let light = "Inter-Light"
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
    static let headline0Deemphasized = Style(Inter.light, size: 28, leading: 32, relativeTo: .title)

    // Headline 1 (24pt)
    static let headline1 = Style(Inter.medium, size: 24, leading: 28, relativeTo: .title2)
    static let headline1Emphasized = Style(Inter.bold, size: 24, leading: 28, relativeTo: .title2)
    static let headline1Deemphasized = Style(Inter.light, size: 24, leading: 28, relativeTo: .title2)

    // Headline 2 (20pt)
    static let headline2 = Style(Inter.medium, size: 20, leading: 24, relativeTo: .title3)
    static let headline2Emphasized = Style(Inter.bold, size: 20, leading: 24, relativeTo: .title3)
    static let headline2Deemphasized = Style(Inter.light, size: 20, leading: 24, relativeTo: .title3)

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

    // MARK: - Meta

    static let meta1 = Style(Inter.semibold, size: 13, leading: 16, relativeTo: .footnote)
    static let meta2 = Style(Inter.semibold, size: 13, leading: 16, relativeTo: .footnote)
    static let meta3 = Style(Inter.regular, size: 13, leading: 16, relativeTo: .footnote)
    static let meta3Link = Style(Inter.semibold, size: 13, leading: 16, relativeTo: .footnote)
    static let meta4 = Style(Inter.regular, size: 12, leading: 16, relativeTo: .caption)
    static let meta4Link = Style(Inter.semibold, size: 12, leading: 16, relativeTo: .caption)
    
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
    static let link = SemanticStyle(typography: body2Link, color: Colors.textBlueLink)
    static let metaSecondary = SemanticStyle(typography: meta3, color: Colors.textSecondary)
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

        static let meta3 = Font.custom("Inter-Regular", size: 13, relativeTo: .footnote)
        static let meta4 = Font.custom("Inter-Regular", size: 12, relativeTo: .caption)
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
