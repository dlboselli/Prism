//
//  Typography.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

/// Spectrum Typography Tokens
/// Part of the Prism Design System (PDS)
///
struct Typography {
    // MARK: - Typography Style
    
    /// Represents a complete typography style with font, line spacing, and letter spacing
    struct Style {
        let font: Font
        let lineSpacing: CGFloat
        let letterSpacing: CGFloat
        
        /// Creates a typography style
        /// - Parameters:
        ///   - font: The font to use
        ///   - lineSpacing: The line spacing (leading minus font size)
        ///   - letterSpacing: The letter spacing (tracking) in points
        init(font: Font, lineSpacing: CGFloat, letterSpacing: CGFloat = 0) {
            self.font = font
            self.lineSpacing = lineSpacing
            self.letterSpacing = letterSpacing
        }
        
        /// Applies the typography style to a view
        func apply(to view: some View) -> some View {
            view
                .font(font)
                .lineSpacing(lineSpacing)
                .tracking(letterSpacing)
        }
    }
    
    // MARK: - Headlines
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: Headline 0 (28pt)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Headline 0 (FB Sans)
    /// Medium, 28pt, 32pt leading, 0.36pt letter spacing
    /// Note: FB Sans font family not available in system fonts, using SF Pro
    static var headline0FBSans: Style {
        Style(
            font: .system(size: 28, weight: .medium, design: .default),
            lineSpacing: 32 - 28,
            letterSpacing: 0.36
        )
    }
    
    /// Headline 0 Emphasized (FB Sans)
    /// Bold, 28pt, 32pt leading, 0.36pt letter spacing
    /// Note: FB Sans font family not available in system fonts, using SF Pro
    static var headline0EmphasizedFBSans: Style {
        Style(
            font: .system(size: 28, weight: .bold, design: .default),
            lineSpacing: 32 - 28,
            letterSpacing: 0.36
        )
    }
    
    /// Headline 0 Deemphasized (FB Sans)
    /// Light, 28pt, 32pt leading, 0.36pt letter spacing
    /// Note: FB Sans font family not available in system fonts, using SF Pro
    static var headline0DeemphasizedFBSans: Style {
        Style(
            font: .system(size: 28, weight: .light, design: .default),
            lineSpacing: 32 - 28,
            letterSpacing: 0.36
        )
    }
    
    /// Headline 0
    /// Medium, 28pt, 32pt leading, 0.36pt letter spacing
    static var headline0: Style {
        Style(
            font: .system(size: 28, weight: .medium, design: .default),
            lineSpacing: 32 - 28,
            letterSpacing: 0.36
        )
    }
    
    /// Headline 0 Emphasized
    /// Bold, 28pt, 32pt leading, 0.36pt letter spacing
    static var headline0Emphasized: Style {
        Style(
            font: .system(size: 28, weight: .bold, design: .default),
            lineSpacing: 32 - 28,
            letterSpacing: 0.36
        )
    }
    
    /// Headline 0 Deemphasized
    /// Light, 28pt, 32pt leading, 0.36pt letter spacing
    static var headline0Deemphasized: Style {
        Style(
            font: .system(size: 28, weight: .light, design: .default),
            lineSpacing: 32 - 28,
            letterSpacing: 0.36
        )
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: Headline 1 (24pt)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Headline 1
    /// Medium, 24pt, 28pt leading, 0.36pt letter spacing
    static var headline1: Style {
        Style(
            font: .system(size: 24, weight: .medium, design: .default),
            lineSpacing: 28 - 24,
            letterSpacing: 0.36
        )
    }
    
    /// Headline 1 Emphasized
    /// Bold, 24pt, 28pt leading, 0.36pt letter spacing
    static var headline1Emphasized: Style {
        Style(
            font: .system(size: 24, weight: .bold, design: .default),
            lineSpacing: 28 - 24,
            letterSpacing: 0.36
        )
    }
    
    /// Headline 1 Deemphasized
    /// Light, 24pt, 28pt leading, 0.36pt letter spacing
    static var headline1Deemphasized: Style {
        Style(
            font: .system(size: 24, weight: .light, design: .default),
            lineSpacing: 28 - 24,
            letterSpacing: 0.36
        )
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: Headline 2 (20pt)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Headline 2
    /// Medium, 20pt, 24pt leading, 0.38pt letter spacing
    static var headline2: Style {
        Style(
            font: .system(size: 20, weight: .medium, design: .default),
            lineSpacing: 24 - 20,
            letterSpacing: 0.38
        )
    }
    
    /// Headline 2 Emphasized
    /// Bold, 20pt, 24pt leading, 0.38pt letter spacing
    static var headline2Emphasized: Style {
        Style(
            font: .system(size: 20, weight: .bold, design: .default),
            lineSpacing: 24 - 20,
            letterSpacing: 0.38
        )
    }
    
    /// Headline 2 Deemphasized
    /// Light, 20pt, 24pt leading, 0.38pt letter spacing
    static var headline2Deemphasized: Style {
        Style(
            font: .system(size: 20, weight: .light, design: .default),
            lineSpacing: 24 - 20,
            letterSpacing: 0.38
        )
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: Headline 3 (17pt)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Headline 3
    /// Medium, 17pt, 20pt leading, -0.41pt letter spacing
    static var headline3: Style {
        Style(
            font: .system(size: 17, weight: .medium, design: .default),
            lineSpacing: 20 - 17,
            letterSpacing: -0.41
        )
    }
    
    /// Headline 3 Emphasized
    /// Bold, 17pt, 20pt leading, -0.41pt letter spacing
    static var headline3Emphasized: Style {
        Style(
            font: .system(size: 17, weight: .bold, design: .default),
            lineSpacing: 20 - 17,
            letterSpacing: -0.41
        )
    }
    
    /// Headline 3 Deemphasized
    /// Regular, 17pt, 20pt leading, -0.41pt letter spacing
    static var headline3Deemphasized: Style {
        Style(
            font: .system(size: 17, weight: .regular, design: .default),
            lineSpacing: 20 - 17,
            letterSpacing: -0.41
        )
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: Headline 4 (15pt)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Headline 4
    /// Medium, 15pt, 20pt leading, -0.24pt letter spacing
    static var headline4: Style {
        Style(
            font: .system(size: 15, weight: .medium, design: .default),
            lineSpacing: 20 - 15,
            letterSpacing: -0.24
        )
    }
    
    /// Headline 4 Emphasized
    /// Bold, 15pt, 20pt leading, -0.24pt letter spacing
    static var headline4Emphasized: Style {
        Style(
            font: .system(size: 15, weight: .bold, design: .default),
            lineSpacing: 20 - 15,
            letterSpacing: -0.24
        )
    }
    
    /// Headline 4 Deemphasized
    /// Regular, 15pt, 20pt leading, -0.24pt letter spacing
    static var headline4Deemphasized: Style {
        Style(
            font: .system(size: 15, weight: .regular, design: .default),
            lineSpacing: 20 - 15,
            letterSpacing: -0.24
        )
    }
    
    // MARK: - Body
    
    /// Body 1
    /// Regular, 20pt, 24pt leading, 0.38pt letter spacing
    static var body1: Style {
        Style(
            font: .system(size: 20, weight: .regular, design: .default),
            lineSpacing: 24 - 20,
            letterSpacing: 0.38
        )
    }
    
    /// Body 2
    /// Regular, 17pt, 20pt leading, -0.41pt letter spacing
    static var body2: Style {
        Style(
            font: .system(size: 17, weight: .regular, design: .default),
            lineSpacing: 20 - 17,
            letterSpacing: -0.41
        )
    }
    
    /// Body 3
    /// Regular, 15pt, 20pt leading, -0.24pt letter spacing
    static var body3: Style {
        Style(
            font: .system(size: 15, weight: .regular, design: .default),
            lineSpacing: 20 - 15,
            letterSpacing: -0.24
        )
    }
    
    /// Body 4
    /// Regular, 13pt, 16pt leading, -0.08pt letter spacing
    static var body4: Style {
        Style(
            font: .system(size: 13, weight: .regular, design: .default),
            lineSpacing: 16 - 13,
            letterSpacing: -0.08
        )
    }
    
    /// Body 1 Link
    /// Semibold, 20pt, 24pt leading, 0.38pt letter spacing
    static var body1Link: Style {
        Style(
            font: .system(size: 20, weight: .semibold, design: .default),
            lineSpacing: 24 - 20,
            letterSpacing: 0.38
        )
    }
    
    /// Body 2 Link
    /// Semibold, 17pt, 20pt leading, -0.41pt letter spacing
    static var body2Link: Style {
        Style(
            font: .system(size: 17, weight: .semibold, design: .default),
            lineSpacing: 20 - 17,
            letterSpacing: -0.41
        )
    }
    
    /// Body 3 Link
    /// Semibold, 15pt, 20pt leading, -0.24pt letter spacing
    static var body3Link: Style {
        Style(
            font: .system(size: 15, weight: .semibold, design: .default),
            lineSpacing: 20 - 15,
            letterSpacing: -0.24
        )
    }
    
    /// Body 4 Link
    /// Semibold, 13pt, 16pt leading, -0.08pt letter spacing
    static var body4Link: Style {
        Style(
            font: .system(size: 13, weight: .semibold, design: .default),
            lineSpacing: 16 - 13,
            letterSpacing: -0.08
        )
    }
    
    // MARK: - Button
    
    /// Button 1
    /// Semibold, 17pt, 20pt leading, -0.41pt letter spacing
    static var button1: Style {
        Style(
            font: .system(size: 17, weight: .semibold, design: .default),
            lineSpacing: 20 - 17,
            letterSpacing: -0.41
        )
    }
    
    /// Button 2
    /// Semibold, 15pt, 20pt leading, -0.24pt letter spacing
    static var button2: Style {
        Style(
            font: .system(size: 15, weight: .semibold, design: .default),
            lineSpacing: 20 - 15,
            letterSpacing: -0.24
        )
    }
    
    /// Button 3
    /// Semibold, 13pt, 16pt leading, -0.08pt letter spacing
    static var button3: Style {
        Style(
            font: .system(size: 13, weight: .semibold, design: .default),
            lineSpacing: 16 - 13,
            letterSpacing: -0.08
        )
    }
    
    // MARK: - Meta
    
    /// Meta 1
    /// Semibold, 13pt, 16pt leading, -0.08pt letter spacing
    static var meta1: Style {
        Style(
            font: .system(size: 13, weight: .semibold, design: .default),
            lineSpacing: 16 - 13,
            letterSpacing: -0.08
        )
    }
    
    /// Meta 2
    /// Semibold, 13pt, 16pt leading, -0.08pt letter spacing
    static var meta2: Style {
        Style(
            font: .system(size: 13, weight: .semibold, design: .default),
            lineSpacing: 16 - 13,
            letterSpacing: -0.08
        )
    }
    
    /// Meta 3
    /// Regular, 13pt, 16pt leading, -0.08pt letter spacing
    static var meta3: Style {
        Style(
            font: .system(size: 13, weight: .regular, design: .default),
            lineSpacing: 16 - 13,
            letterSpacing: -0.08
        )
    }
    
    /// Meta 3 Link
    /// Semibold, 13pt, 16pt leading, -0.08pt letter spacing
    static var meta3Link: Style {
        Style(
            font: .system(size: 13, weight: .semibold, design: .default),
            lineSpacing: 16 - 13,
            letterSpacing: -0.08
        )
    }
    
    /// Meta 4
    /// Regular, 12pt, 16pt leading, 0pt letter spacing
    static var meta4: Style {
        Style(
            font: .system(size: 12, weight: .regular, design: .default),
            lineSpacing: 16 - 12,
            letterSpacing: 0
        )
    }
    
    /// Meta 4 Link
    /// Semibold, 12pt, 16pt leading, 0pt letter spacing
    static var meta4Link: Style {
        Style(
            font: .system(size: 12, weight: .semibold, design: .default),
            lineSpacing: 16 - 12,
            letterSpacing: 0
        )
    }
    
    // MARK: - Semantic Typography Styles
    
    /// Semantic typography style that combines typography with color
    /// Useful for creating complete text styles that adapt to light/dark mode
    struct SemanticStyle {
        let typography: Style
        let color: Color
        
        /// Applies the semantic typography style (typography + color) to a view
        func apply(to view: some View) -> some View {
            view
                .typography(typography)
                .foregroundColor(color)
        }
    }
    
    /// Headline with primary text color
    /// Combines headline3Emphasized with Colors.textPrimary
    static var headlinePrimary: SemanticStyle {
        SemanticStyle(
            typography: headline3Emphasized,
            color: Colors.textPrimary
        )
    }
    
    /// Body text with primary text color
    /// Combines body2 with Colors.textPrimary
    static var bodyPrimary: SemanticStyle {
        SemanticStyle(
            typography: body2,
            color: Colors.textPrimary
        )
    }
    
    /// Body text with secondary text color
    /// Combines body2 with Colors.textSecondary
    static var bodySecondary: SemanticStyle {
        SemanticStyle(
            typography: body2,
            color: Colors.textSecondary
        )
    }
    
    /// Link text with link color
    /// Combines body2Link with Colors.textBlueLink
    static var link: SemanticStyle {
        SemanticStyle(
            typography: body2Link,
            color: Colors.textBlueLink
        )
    }
    
    /// Meta text with secondary text color
    /// Combines meta3 with Colors.textSecondary
    static var metaSecondary: SemanticStyle {
        SemanticStyle(
            typography: meta3,
            color: Colors.textSecondary
        )
    }
}

// MARK: - View Extension

extension View {
    /// Applies a typography style to the view
    /// - Parameter style: The typography style to apply
    /// - Returns: A view with the typography style applied
    func typography(_ style: Typography.Style) -> some View {
        style.apply(to: self)
    }
    
    /// Applies a semantic typography style (typography + color) to the view
    /// - Parameter style: The semantic typography style to apply
    /// - Returns: A view with the semantic typography style applied
    func typography(_ style: Typography.SemanticStyle) -> some View {
        style.apply(to: self)
    }
}

