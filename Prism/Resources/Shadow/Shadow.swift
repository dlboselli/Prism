//
//  Shadow.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

/// Spectrum Shadow Tokens
/// Part of the Prism Design System (PDS)
///
/// Source of truth: Spectrum Tokens JSON
/// All shadow colors use PDS color tokens from Colors.swift
/// to maintain design system consistency.
struct Shadow {
    
    // MARK: - Shadow Style
    
    /// Represents a complete shadow style with color, radius, and offsets
    struct Style {
        let color: Color
        let radius: CGFloat
        let x: CGFloat
        let y: CGFloat
        
        /// Applies the shadow style to a view
        func apply(to view: some View) -> some View {
            view.shadow(color: color, radius: radius, x: x, y: y)
        }
    }
    
    /// Represents a multi-shadow style for shadows that require multiple layers
    struct MultiStyle {
        let shadows: [Style]
        
        /// Applies all shadow styles to a view
        func apply(to view: some View) -> AnyView {
            var result: AnyView = AnyView(view)
            for shadow in shadows {
                result = AnyView(
                    result.shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
                )
            }
            return result
        }
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Persistent UI
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Persistent UI shadow
    /// Two-layer shadow for sticky headers, tab bars, and persistent UI elements
    /// Shadow 1: x=0, y=-1, blur=0 (border line)
    /// Shadow 2: x=0, y=-1, blur=8 (soft shadow)
    static var persistentUI: MultiStyle {
        MultiStyle(shadows: [
            // Shadow 1: Top border line
            Style(
                color: Colors.blackAlpha05,
                radius: 0,
                x: 0,
                y: -1
            ),
            // Shadow 2: Soft shadow
            Style(
                color: Colors.blackAlpha10,
                radius: 8,
                x: 0,
                y: -1
            )
        ])
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - UI Emphasis
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// UI Emphasis shadow
    /// For elevated UI elements like cards, buttons, and floating components
    /// x=0, y=2, blur=16
    static var uiEmphasis: Style {
        Style(
            color: Colors.blackAlpha10,
            radius: 16,
            x: 0,
            y: 2
        )
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Responsive UI
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Responsive UI shadow
    /// For floating dialogs, sheets, and popovers
    /// x=0, y=8, blur=16
    static var responsiveUI: Style {
        Style(
            color: Colors.blackAlpha10,
            radius: 16,
            x: 0,
            y: 8
        )
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Text and Icon on Media
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Text and Icon on Media shadow
    /// Four-layer shadow for text/icon visibility on media backgrounds (photos, videos)
    /// Creates a subtle text shadow for legibility over images
    static var textAndIconOnMedia: MultiStyle {
        MultiStyle(shadows: [
            // Shadow 4: blur=1.5
            Style(
                color: Colors.blackAlpha60,
                radius: 1.5,
                x: 0,
                y: 0
            ),
            // Shadow 3: blur=1.25
            Style(
                color: Colors.blackAlpha40,
                radius: 1.25,
                x: 0,
                y: 0
            ),
            // Shadow 2: blur=1
            Style(
                color: Colors.blackAlpha50,
                radius: 1,
                x: 0,
                y: 0
            ),
            // Shadow 1: blur=0.5
            Style(
                color: Colors.black,
                radius: 0.5,
                x: 0,
                y: 0
            )
        ])
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Text and Icon on Overlay
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Text and Icon on Overlay shadow
    /// Four-layer shadow for text/icon visibility on overlay backgrounds
    /// Uses different alpha values optimized for overlay contexts
    static var textAndIconOnOverlay: MultiStyle {
        MultiStyle(shadows: [
            // Shadow 4: blur=1.5
            Style(
                color: Colors.blackAlpha20,
                radius: 1.5,
                x: 0,
                y: 0
            ),
            // Shadow 3: blur=1.25
            Style(
                color: Colors.blackAlpha40,
                radius: 1.25,
                x: 0,
                y: 0
            ),
            // Shadow 2: blur=1
            Style(
                color: Colors.blackAlpha30,
                radius: 1,
                x: 0,
                y: 0
            ),
            // Shadow 1: blur=0.5
            Style(
                color: Colors.blackAlpha50,
                radius: 0.5,
                x: 0,
                y: 0
            )
        ])
    }
}

// MARK: - View Extension

extension View {
    /// Applies a shadow style to the view
    func shadow(_ style: Shadow.Style) -> some View {
        style.apply(to: self)
    }
    
    /// Applies a multi-shadow style to the view
    func shadow(_ style: Shadow.MultiStyle) -> some View {
        style.apply(to: self)
    }
}

