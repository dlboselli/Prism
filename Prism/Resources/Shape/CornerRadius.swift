//
//  CornerRadius.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

/// Spectrum Corner Radius Tokens
/// Part of the Prism Design System (PDS)
///
/// Source of truth: Spectrum Tokens JSON
/// These values define the corner radii used throughout the app.
struct CornerRadius {
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Semantic Corner Radii (Base Values)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Square corners (0pt)
    static let square: CGFloat = 0
    
    /// XXSmall rounded corners (2pt)
    static let roundedXXSmall: CGFloat = 2
    
    /// XSmall rounded corners (4pt)
    static let roundedXSmall: CGFloat = 4
    
    /// Small rounded corners (6pt)
    static let roundedSmall: CGFloat = 6
    
    /// Medium rounded corners (8pt)
    static let roundedMedium: CGFloat = 8
    
    /// Large rounded corners (12pt)
    static let roundedLarge: CGFloat = 12
    
    /// XLarge rounded corners (16pt)
    static let roundedXLarge: CGFloat = 16
    
    /// XXLarge rounded corners (24pt)
    static let roundedXXLarge: CGFloat = 24
    
    /// Fully rounded / pill shape (255pt)
    static let round: CGFloat = 255
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Component Corner Radii
    // ═══════════════════════════════════════════════════════════════════════════
    
    // MARK: Actions & Buttons
    
    /// Action corner radius (6pt)
    static let action: CGFloat = roundedSmall
    
    /// Button corner radius (8pt)
    static let button: CGFloat = roundedMedium
    
    /// Icon action corner radius - fully rounded (255pt)
    static let iconAction: CGFloat = round
    
    /// Sub nav action corner radius - fully rounded (255pt)
    static let subNavAction: CGFloat = round
    
    // MARK: Cards & Containers
    
    /// Card corner radius (12pt)
    static let card: CGFloat = roundedLarge
    
    /// Card large corner radius (16pt)
    static let cardLarge: CGFloat = roundedXLarge
    
    /// Card small corner radius (12pt)
    static let cardSmall: CGFloat = roundedLarge
    
    /// Dialog corner radius (12pt)
    static let dialog: CGFloat = roundedLarge
    
    /// Bottom sheet corner radius (20pt)
    static let bottomSheet: CGFloat = 20
    
    /// Tooltip corner radius (12pt)
    static let tooltip: CGFloat = roundedLarge
    
    /// Bubble corner radius (16pt)
    static let bubble: CGFloat = roundedXLarge
    
    /// Action tile radius (16pt)
    static let actionTile: CGFloat = roundedXLarge
    
    // MARK: Media
    
    /// Media corner radius (12pt)
    static let media: CGFloat = roundedLarge
    
    /// Media large corner radius (16pt)
    static let mediaLarge: CGFloat = roundedXLarge
    
    /// Media small corner radius (12pt)
    static let mediaSmall: CGFloat = roundedLarge
    
    /// Reshare radius (16pt)
    static let reshare: CGFloat = roundedXLarge
    
    // MARK: Inputs & Controls
    
    /// Input field corner radius (12pt)
    static let inputField: CGFloat = roundedLarge
    
    /// Input bar corner radius - fully rounded (255pt)
    static let inputBar: CGFloat = round
    
    /// Selection control corner radius (4pt)
    static let selectionControl: CGFloat = roundedXSmall
    
    /// Selection control large corner radius - fully rounded (255pt)
    static let selectionControlLarge: CGFloat = round
    
    /// Checkbox corner radius (4pt)
    static let checkbox: CGFloat = roundedXSmall
    
    /// Handle corner radius - fully rounded (255pt)
    static let handle: CGFloat = round
    
    /// Progress corner radius - fully rounded (255pt)
    static let progress: CGFloat = round
    
    // MARK: Chips & Badges
    
    /// Chip corner radius - fully rounded (255pt)
    static let chip: CGFloat = round
    
    /// Badge corner radius - fully rounded (255pt)
    static let badge: CGFloat = round
    
    /// Infochip large radius (8pt)
    static let infochipLarge: CGFloat = roundedMedium
    
    /// Infochip medium radius (4pt)
    static let infochipMedium: CGFloat = roundedXSmall
    
    /// Infochip small radius (4pt)
    static let infochipSmall: CGFloat = roundedXSmall
    
    // MARK: Lists & Grids
    
    /// Listcell inset radius (16pt)
    static let listcellInset: CGFloat = roundedXLarge
    
    /// Vertical grid corner radius (12pt)
    static let verticalGrid: CGFloat = roundedLarge
    
    /// Vertical grid inset corner radius (16pt)
    static let verticalGridInset: CGFloat = roundedXLarge
    
    // MARK: Glimmer (Loading Placeholders)
    
    /// Glimmer corner radius - square (0pt)
    static let glimmer: CGFloat = square
    
    /// Glimmer XSmall corner radius (4pt)
    static let glimmerXSmall: CGFloat = roundedXSmall
    
    /// Glimmer small corner radius (6pt)
    static let glimmerSmall: CGFloat = roundedSmall
    
    /// Glimmer medium corner radius (8pt)
    static let glimmerMedium: CGFloat = roundedMedium
    
    /// Glimmer large corner radius (12pt)
    static let glimmerLarge: CGFloat = roundedLarge
    
    /// Glimmer XLarge corner radius (16pt)
    static let glimmerXLarge: CGFloat = roundedXLarge
    
    // MARK: Pressed States
    
    /// Pressed state square corner radius (0pt)
    static let pressedStateSquare: CGFloat = square
    
    /// Pressed state XSmall corner radius (4pt)
    static let pressedStateXSmall: CGFloat = roundedXSmall
    
    /// Pressed state small corner radius (6pt)
    static let pressedStateSmall: CGFloat = roundedSmall
    
    /// Pressed state medium corner radius (8pt)
    static let pressedStateMedium: CGFloat = roundedMedium
    
    /// Pressed state large corner radius (12pt)
    static let pressedStateLarge: CGFloat = roundedLarge
    
    /// Pressed state XLarge corner radius (16pt)
    static let pressedStateXLarge: CGFloat = roundedXLarge
    
    /// Pressed state rounded - fully rounded (255pt)
    static let pressedStateRounded: CGFloat = round
}

// MARK: - View Extensions

extension View {
    /// Clips the view to a rounded rectangle with the specified corner radius
    func cornerRadius(_ radius: CGFloat) -> some View {
        clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
}

// MARK: - RoundedRectangle Convenience

extension RoundedRectangle {
    /// Creates a rounded rectangle with a PDS corner radius
    static func pds(_ radius: CGFloat) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: radius, style: .continuous)
    }
}

