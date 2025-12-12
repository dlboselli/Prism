//
//  Shadow.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

/// Prism Design System Shadows
struct Shadow {
    
    // MARK: - Style
    
    struct Style {
        let color: Color
        let radius: CGFloat
        let x: CGFloat
        let y: CGFloat
        
        func apply(to view: some View) -> some View {
            view.shadow(color: color, radius: radius, x: x, y: y)
        }
    }
    
    struct MultiStyle {
        let shadows: [Style]
        
        func apply(to view: some View) -> AnyView {
            shadows.reduce(AnyView(view)) { result, shadow in
                AnyView(result.shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y))
            }
        }
    }
    
    // MARK: - Shadows
    
    /// Persistent UI (tab bars, sticky headers)
    static let persistentUI = MultiStyle(shadows: [
        Style(color: Colors.blackAlpha05, radius: 0, x: 0, y: -1),
        Style(color: Colors.blackAlpha10, radius: 8, x: 0, y: -1)
    ])
    
    /// UI Emphasis (cards, buttons, floating components)
    static let uiEmphasis = Style(color: Colors.blackAlpha10, radius: 16, x: 0, y: 2)
    
    /// Responsive UI (dialogs, sheets, popovers)
    static let responsiveUI = Style(color: Colors.blackAlpha10, radius: 16, x: 0, y: 8)
    
    /// Text/Icon on Media (legibility over images)
    static let textAndIconOnMedia = MultiStyle(shadows: [
        Style(color: Colors.blackAlpha60, radius: 1.5, x: 0, y: 0),
        Style(color: Colors.blackAlpha40, radius: 1.25, x: 0, y: 0),
        Style(color: Colors.blackAlpha50, radius: 1, x: 0, y: 0),
        Style(color: Colors.black, radius: 0.5, x: 0, y: 0)
    ])
    
    /// Text/Icon on Overlay
    static let textAndIconOnOverlay = MultiStyle(shadows: [
        Style(color: Colors.blackAlpha20, radius: 1.5, x: 0, y: 0),
        Style(color: Colors.blackAlpha40, radius: 1.25, x: 0, y: 0),
        Style(color: Colors.blackAlpha30, radius: 1, x: 0, y: 0),
        Style(color: Colors.blackAlpha50, radius: 0.5, x: 0, y: 0)
    ])
}

// MARK: - View Extension

extension View {
    func shadow(_ style: Shadow.Style) -> some View { style.apply(to: self) }
    func shadow(_ style: Shadow.MultiStyle) -> some View { style.apply(to: self) }
}
