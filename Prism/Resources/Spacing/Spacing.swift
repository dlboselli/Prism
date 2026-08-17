//
//  Spacing.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Scale-based spacing tokens for consistent layout throughout the app.
//

import SwiftUI

/// Prism Design System Spacing Tokens
///
/// Usage:
/// ```swift
/// .padding(.horizontal, Spacing.md)
/// .padding(Spacing.lg)
/// HStack(spacing: Spacing.sm) { ... }
/// ```
struct Spacing {
    
    // MARK: - Base Scale
    
    /// 4pt - Extra extra small spacing
    static let xxs: CGFloat = 4
    
    /// 8pt - Extra small spacing
    static let xs: CGFloat = 8
    
    /// 12pt - Small spacing
    static let sm: CGFloat = 12
    
    /// 16pt - Medium spacing (default)
    static let md: CGFloat = 16
    
    /// 24pt - Large spacing
    static let lg: CGFloat = 24
    
    /// 32pt - Extra large spacing
    static let xl: CGFloat = 32
    
    /// 48pt - Extra extra large spacing
    static let xxl: CGFloat = 48
    
    /// 64pt - Extra extra extra large spacing
    static let xxxl: CGFloat = 64
    
    // MARK: - Semantic Aliases
    
    /// Standard horizontal page padding (16pt)
    static let pagePadding: CGFloat = md
    
    /// Standard content padding (16pt)
    static let contentPadding: CGFloat = md
    
    /// Compact cell padding (12pt)
    static let cellPadding: CGFloat = sm
    
    /// Standard cell vertical padding (12pt)
    static let cellVertical: CGFloat = sm
    
    /// Standard cell horizontal padding (16pt)
    static let cellHorizontal: CGFloat = md
    
    /// Spacing between icon and label (8pt)
    static let iconGap: CGFloat = xs
    
    /// Spacing between stacked items (12pt)
    static let stackGap: CGFloat = sm
    
    /// Spacing between sections (24pt)
    static let sectionGap: CGFloat = lg
    
    /// Inset for grouped content (16pt)
    static let groupInset: CGFloat = md
    
    /// Button internal horizontal padding (16pt)
    static let buttonHorizontal: CGFloat = md
    
    /// Button internal vertical padding (12pt)
    static let buttonVertical: CGFloat = sm
    
    /// Input field internal padding (12pt)
    static let inputPadding: CGFloat = sm
    
    /// Card internal padding (16pt)
    static let cardPadding: CGFloat = md
    
    /// Modal/sheet padding (24pt)
    static let sheetPadding: CGFloat = lg
}

// MARK: - EdgeInsets Extensions

extension EdgeInsets {
    /// Standard page insets
    static var pdsPage: EdgeInsets {
        EdgeInsets(top: Spacing.md, leading: Spacing.md, bottom: Spacing.md, trailing: Spacing.md)
    }
    
    /// Standard cell insets
    static var pdsCell: EdgeInsets {
        EdgeInsets(top: Spacing.sm, leading: Spacing.md, bottom: Spacing.sm, trailing: Spacing.md)
    }
    
    /// Card content insets
    static var pdsCard: EdgeInsets {
        EdgeInsets(top: Spacing.md, leading: Spacing.md, bottom: Spacing.md, trailing: Spacing.md)
    }
}

// MARK: - View Extension

extension View {
    /// Apply standard page padding
    func pdsPagePadding() -> some View {
        self.padding(.horizontal, Spacing.pagePadding)
    }
    
    /// Apply standard cell padding
    func pdsCellPadding() -> some View {
        self.padding(.horizontal, Spacing.cellHorizontal)
            .padding(.vertical, Spacing.cellVertical)
    }
    
    /// Apply standard card padding
    func pdsCardPadding() -> some View {
        self.padding(Spacing.cardPadding)
    }
    
    /// Apply vertical padding for a text scale
    ///
    /// Usage:
    /// ```swift
    /// VStack(spacing: PDSTextScale.compact.lineSpacing) {
    ///     Text("Title").typography(PDSTextScale.compact.headline)
    ///     Text("Body").typography(PDSTextScale.compact.body)
    /// }
    /// .pdsTextPadding(.compact)
    /// ```
    func pdsTextPadding(_ scale: PDSTextScale) -> some View {
        self.padding(.vertical, scale.verticalPadding)
    }
}

