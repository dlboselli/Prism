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
    
    // MARK: - Typography Scale Spacing (Legacy)
    
    /// Scale-based text spacing for consistent hierarchy
    /// Prefer using `PDSTextScale` enum for new code
    
    struct TextScale {
        let lineSpacing: CGFloat
        let verticalPadding: CGFloat
        
        /// Scale 1: Large (24pt headline) - Hero sections, page headers
        static let scale1 = TextScale(lineSpacing: 6, verticalPadding: 16)
        
        /// Scale 2: Standard (20pt headline) - Cards, section headers
        static let scale2 = TextScale(lineSpacing: 5, verticalPadding: 14)
        
        /// Scale 3: Compact (17pt headline) - List items, cells
        static let scale3 = TextScale(lineSpacing: 4, verticalPadding: 12)
        
        /// Scale 4: Dense (15pt headline) - Comments, notifications, metadata
        static let scale4 = TextScale(lineSpacing: 4, verticalPadding: 10)
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
    
    /// Meta/caption style for this scale
    var meta: Typography.Style {
        switch self {
        case .hero: return Typography.meta1
        case .section: return Typography.meta2
        case .content: return Typography.meta3
        case .compact: return Typography.meta4
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
    
    /// Spacing between text lines (headline → body → meta)
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

