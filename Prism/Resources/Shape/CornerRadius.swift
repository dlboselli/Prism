//
//  CornerRadius.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

/// Prism Design System Corner Radii
struct CornerRadius {
    
    // MARK: - Base Scale
    
    static let square: CGFloat = 0
    static let xxSmall: CGFloat = 2
    static let xSmall: CGFloat = 4
    static let small: CGFloat = 6
    static let medium: CGFloat = 8
    static let large: CGFloat = 12
    static let xLarge: CGFloat = 16
    static let xxLarge: CGFloat = 24
    static let pill: CGFloat = 255  // Larger than any control; clamps to a capsule
    
    // MARK: - Components
    
    // Actions & Buttons
    static let action: CGFloat = small
    static let button: CGFloat = medium
    static let iconAction: CGFloat = pill
    static let subNavAction: CGFloat = pill
    
    // Cards & Containers
    static let card: CGFloat = large
    static let cardLarge: CGFloat = xLarge
    static let cardSmall: CGFloat = large
    static let dialog: CGFloat = large
    static let bottomSheet: CGFloat = 20
    static let tooltip: CGFloat = large
    static let bubble: CGFloat = xLarge
    static let actionTile: CGFloat = xLarge
    
    // Media
    static let media: CGFloat = large
    static let mediaLarge: CGFloat = xLarge
    static let mediaSmall: CGFloat = large
    static let reshare: CGFloat = xLarge
    
    // Inputs & Controls
    static let inputField: CGFloat = large
    static let inputBar: CGFloat = pill
    static let selectionControl: CGFloat = xSmall
    static let selectionControlLarge: CGFloat = pill
    static let checkbox: CGFloat = xSmall
    static let handle: CGFloat = pill
    static let progress: CGFloat = pill
    
    // Chips & Badges
    static let chip: CGFloat = pill
    static let badge: CGFloat = pill
    static let infochipLarge: CGFloat = medium
    static let infochipMedium: CGFloat = xSmall
    static let infochipSmall: CGFloat = xSmall
    
    // Lists & Grids
    static let listcellInset: CGFloat = xLarge
    static let verticalGrid: CGFloat = large
    static let verticalGridInset: CGFloat = xLarge
    
    // Glimmer (Loading)
    static let glimmer: CGFloat = square
    static let glimmerXSmall: CGFloat = xSmall
    static let glimmerSmall: CGFloat = small
    static let glimmerMedium: CGFloat = medium
    static let glimmerLarge: CGFloat = large
    static let glimmerXLarge: CGFloat = xLarge
    
    // Pressed States
    static let pressedStateSquare: CGFloat = square
    static let pressedStateXSmall: CGFloat = xSmall
    static let pressedStateSmall: CGFloat = small
    static let pressedStateMedium: CGFloat = medium
    static let pressedStateLarge: CGFloat = large
    static let pressedStateXLarge: CGFloat = xLarge
    static let pressedStateRounded: CGFloat = pill
}

// MARK: - View Extension

extension View {
    func cornerRadius(_ radius: CGFloat) -> some View {
        clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
}

// MARK: - RoundedRectangle Convenience

extension RoundedRectangle {
    static func pds(_ radius: CGFloat) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: radius, style: .continuous)
    }
}
