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
        
        init(_ fontName: String, size: CGFloat, leading: CGFloat, tracking: CGFloat = 0) {
            self.font = .custom(fontName, size: size)
            self.lineSpacing = leading - size
            self.letterSpacing = tracking
        }
        
        func apply(to view: some View) -> some View {
            view.font(font).lineSpacing(lineSpacing).tracking(letterSpacing)
        }
    }
    
    // MARK: - Headlines
    
    // Headline 0 (28pt)
    static let headline0 = Style(Inter.medium, size: 28, leading: 32, tracking: 0.36)
    static let headline0Emphasized = Style(Inter.bold, size: 28, leading: 32, tracking: 0.36)
    static let headline0Deemphasized = Style(Inter.light, size: 28, leading: 32, tracking: 0.36)
    
    // Headline 1 (24pt)
    static let headline1 = Style(Inter.medium, size: 24, leading: 28, tracking: 0.36)
    static let headline1Emphasized = Style(Inter.bold, size: 24, leading: 28, tracking: 0.36)
    static let headline1Deemphasized = Style(Inter.light, size: 24, leading: 28, tracking: 0.36)
    
    // Headline 2 (20pt)
    static let headline2 = Style(Inter.medium, size: 20, leading: 24, tracking: 0.38)
    static let headline2Emphasized = Style(Inter.bold, size: 20, leading: 24, tracking: 0.38)
    static let headline2Deemphasized = Style(Inter.light, size: 20, leading: 24, tracking: 0.38)
    
    // Headline 3 (17pt)
    static let headline3 = Style(Inter.medium, size: 17, leading: 20, tracking: -0.41)
    static let headline3Emphasized = Style(Inter.bold, size: 17, leading: 20, tracking: -0.41)
    static let headline3Deemphasized = Style(Inter.regular, size: 17, leading: 20, tracking: -0.41)
    
    // Headline 4 (15pt)
    static let headline4 = Style(Inter.medium, size: 15, leading: 20, tracking: -0.24)
    static let headline4Emphasized = Style(Inter.bold, size: 15, leading: 20, tracking: -0.24)
    static let headline4Deemphasized = Style(Inter.regular, size: 15, leading: 20, tracking: -0.24)
    
    // MARK: - Body
    
    static let body1 = Style(Inter.regular, size: 20, leading: 24, tracking: 0.38)
    static let body2 = Style(Inter.regular, size: 17, leading: 20, tracking: -0.41)
    static let body3 = Style(Inter.regular, size: 15, leading: 20, tracking: -0.24)
    static let body4 = Style(Inter.regular, size: 13, leading: 16, tracking: -0.08)
    
    static let body1Link = Style(Inter.semibold, size: 20, leading: 24, tracking: 0.38)
    static let body2Link = Style(Inter.semibold, size: 17, leading: 20, tracking: -0.41)
    static let body3Link = Style(Inter.semibold, size: 15, leading: 20, tracking: -0.24)
    static let body4Link = Style(Inter.semibold, size: 13, leading: 16, tracking: -0.08)
    
    // MARK: - Button
    
    static let button1 = Style(Inter.semibold, size: 17, leading: 20, tracking: -0.41)
    static let button2 = Style(Inter.semibold, size: 15, leading: 20, tracking: -0.24)
    static let button3 = Style(Inter.semibold, size: 13, leading: 16, tracking: -0.08)
    
    // MARK: - Meta
    
    static let meta1 = Style(Inter.semibold, size: 13, leading: 16, tracking: -0.08)
    static let meta2 = Style(Inter.semibold, size: 13, leading: 16, tracking: -0.08)
    static let meta3 = Style(Inter.regular, size: 13, leading: 16, tracking: -0.08)
    static let meta3Link = Style(Inter.semibold, size: 13, leading: 16, tracking: -0.08)
    static let meta4 = Style(Inter.regular, size: 12, leading: 16)
    static let meta4Link = Style(Inter.semibold, size: 12, leading: 16)
    
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

// MARK: - View Extension

extension View {
    func typography(_ style: Typography.Style) -> some View {
        style.apply(to: self)
    }
    
    func typography(_ style: Typography.SemanticStyle) -> some View {
        style.apply(to: self)
    }
}
