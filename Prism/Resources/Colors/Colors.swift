//
//  Colors.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI
import UIKit

/// Prism Design System Colors
/// Scale: 50 (lightest) → 950 (darkest), 500 = base
struct Colors {
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Primary Accent Configuration
    // ═══════════════════════════════════════════════════════════════════════════
    // Change these to swap the app's primary accent color
    
    private static let accent50 = blue50
    private static let accent100 = blue100
    private static let accent200 = blue200
    private static let accent300 = blue300
    private static let accent400 = blue400
    private static let accent500 = blue500
    private static let accent600 = blue600
    private static let accent700 = blue700
    private static let accent800 = blue800
    private static let accent900 = blue900
    private static let accent950 = blue950
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Semantic Colors
    // ═══════════════════════════════════════════════════════════════════════════
    
    // MARK: Fixed (Status)
    // Fixed colors render the same in light and dark mode

    static var fixedAccent: Color { Color(light: accent600, dark: accent600) }
    static var fixedAccentDeemphasized: Color { Color(light: accent100, dark: accent600.opacity(0.2)) }
    static var textAccent: Color { Color(light: accent500, dark: accent400) }
    static var fixedBlack: Color { black }
    static var fixedBlackOverlay: Color { black.opacity(0.4) }
    static var fixedTransparent: Color { .clear }
    static var fixedWhite: Color { white }
    static var fixedNegative: Color { Color(light: red600, dark: red600) }
    static var fixedNegativeDeemphasized: Color { Color(light: red100, dark: red600.opacity(0.2)) }
    static var fixedPositive: Color { Color(light: green600, dark: green600) }
    static var fixedPositiveDeemphasized: Color { Color(light: green100, dark: green600.opacity(0.2)) }
    static var fixedWarning: Color { Color(light: yellow600, dark: yellow600) }
    static var fixedWarningDeemphasized: Color { Color(light: yellow100, dark: yellow600.opacity(0.2)) }
    
    // MARK: Text
    
    static var textPrimary: Color { Color(light: gray950, dark: gray100) }
    static var textPrimaryOnColor: Color { white }
    static var textPrimaryOnMedia: Color { white }
    static var textSecondary: Color { Color(light: gray600, dark: gray300) }
    static var textSecondaryOnColor: Color { white.opacity(0.9) }
    static var textSecondaryOnMedia: Color { white.opacity(0.8) }
    static var textPlaceholder: Color { Color(light: gray600, dark: gray300) }
    static var textPlaceholderOnColor: Color { white.opacity(0.9) }
    static var textPlaceholderOnMedia: Color { white.opacity(0.8) }
    static var textDisabled: Color { Color(light: gray400, dark: gray500) }
    static var textDisabledOnColor: Color { white.opacity(0.9) }
    static var textDisabledOnMedia: Color { white.opacity(0.5) }
    static var textLinkOnColor: Color { white }
    static var textLinkOnMedia: Color { white }
    
    // MARK: Icon
    
    static var iconPrimary: Color { Color(light: gray950, dark: gray100) }
    static var iconPrimaryOnColor: Color { white }
    static var iconPrimaryOnMedia: Color { white }
    static var iconSecondary: Color { Color(light: gray600, dark: gray300) }
    static var iconSecondaryOnColor: Color { white.opacity(0.9) }
    static var iconSecondaryOnMedia: Color { white.opacity(0.8) }
    static var iconPlaceholder: Color { Color(light: gray600, dark: gray300) }
    static var iconPlaceholderOnColor: Color { white.opacity(0.9) }
    static var iconPlaceholderOnMedia: Color { white.opacity(0.5) }
    static var iconDisabled: Color { Color(light: gray400, dark: gray500) }
    static var iconDisabledOnColor: Color { white.opacity(0.5) }
    static var iconDisabledOnMedia: Color { white.opacity(0.5) }
    
    // MARK: Background
    
    static var backgroundSurface: Color { Color(light: white, dark: gray900) }
    static var backgroundDeemphasized: Color { Color(light: gray100, dark: white.opacity(0.1)) }
    static var backgroundCanvas: Color { Color(light: gray200, dark: gray950) }
    static var backgroundCard: Color { Color(light: white, dark: gray800) }
    static var backgroundCardFlat: Color { Color(light: gray50, dark: gray800) }
    static var backgroundCardInverse: Color { gray800 }
    static var backgroundCardOnColor: Color { white.opacity(0.15) }
    static var backgroundCardOnMedia: Color { gray900.opacity(0.6) }
    static var backgroundCardOnMediaExtraLight: Color { black.opacity(0.2) }
    static var backgroundNavBar: Color { Color(light: white, dark: gray900) }
    static var backgroundPopover: Color { Color(light: white, dark: gray700) }
    static var backgroundBottomSheet: Color { Color(light: white, dark: gray900) }
    static var backgroundDivider: Color { Color(light: gray200, dark: gray600) }
    static var backgroundDividerOnColor: Color { gray700 }
    static var backgroundDividerOnMedia: Color { gray700 }
    static var backgroundOverlayOnSurface: Color { Color(light: black.opacity(0.4), dark: black.opacity(0.6)) }
    static var backgroundOverlayOnMedia: Color { black.opacity(0.8) }
    static var backgroundOverlayOnMediaLight: Color { black.opacity(0.35) }
    
    // MARK: Elevation (Borders & Shadows)
    
    static var elevationBorderPersistent: Color { Color(light: black.opacity(0.05), dark: white.opacity(0.1)) }
    static var elevationBorderResponsive: Color { Color(light: black.opacity(0.1), dark: white.opacity(0.05)) }
    static var elevationBorderEmphasis: Color { Color(light: gray200, dark: white.opacity(0.05)) }
    static var elevationBorderEmphasisOnMedia: Color { black.opacity(0.1) }
    static var elevationBorderFocus: Color { Color(light: gray950.opacity(0.15), dark: white.opacity(0.05)) }
    static var elevationCardBorder: Color { .clear }
    static var elevationBannerBorder: Color { .clear }
    static var elevationCardShadowLight: Color { Color(light: black.opacity(0.05), dark: black.opacity(0.1)) }
    static var elevationCardShadowMedium: Color { Color(light: black.opacity(0.05), dark: black.opacity(0.1)) }
    static var elevationCardShadowStrong: Color { Color(light: black.opacity(0.1), dark: black.opacity(0.15)) }
    static var elevationBannerShadow: Color { Color(light: black.opacity(0.05), dark: black.opacity(0.1)) }
    static var elevationPersistentCtaShadow: Color { Color(light: black.opacity(0.1), dark: black.opacity(0.15)) }
    static var elevationShadowPersistent: Color { Color(light: black.opacity(0.1), dark: black.opacity(0.3)) }
    static var elevationShadowResponsive: Color { black.opacity(0.1) }
    static var elevationShadowEmphasis: Color { black.opacity(0.1) }
    static var elevationShadowTextIconOnMedia: Color { black.opacity(0.6) }
    static var elevationTooltipShadow: Color { black.opacity(0.1) }
    
    // MARK: Data Visualization
    
    static var datavizPrimary: Color { blue500 }
    static var datavizSecondary: Color { Color(light: blue700, dark: blue100) }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Component Colors
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Button colors, grouped by variant
    struct Button {
        // Primary
        static var primaryBackground: Color { Colors.accent600 }
        static var primaryBackgroundPressed: Color { Color(light: Colors.accent700, dark: Colors.accent600) }
        static var primaryBackgroundOnColor: Color { Colors.white }
        static var primaryOnMedia: Color { Colors.white }
        static var primaryIcon: Color { Colors.white }
        static var primaryIconOnColor: Color { Colors.black }
        static var primaryIconOnMedia: Color { Colors.gray950 }
        static var primaryText: Color { Colors.white }
        static var primaryTextOnColor: Color { Colors.black }
        static var primaryTextOnMedia: Color { Colors.gray950 }

        // Primary Deemphasized
        static var primaryDeemphasizedBackground: Color { Color(light: Colors.accent100, dark: Colors.accent600.opacity(0.2)) }
        static var primaryDeemphasizedIcon: Color { Colors.fixedAccent }
        static var primaryDeemphasizedText: Color { Colors.textAccent }

        // Secondary
        static var secondaryBackground: Color { Color(light: Colors.gray100, dark: Colors.white.opacity(0.1)) }
        static var secondaryBackgroundOnColor: Color { Colors.black.opacity(0.15) }
        static var secondaryBackgroundOnMedia: Color { Colors.gray900.opacity(0.6) }
        static var secondaryBackgroundFloating: Color { Color(light: Colors.white, dark: Colors.gray700) }
        static var secondaryIcon: Color { Color(light: Colors.gray950, dark: Colors.gray100) }
        static var secondaryIconOnColor: Color { Colors.white }
        static var secondaryIconOnMedia: Color { Colors.white }
        static var secondaryText: Color { Color(light: Colors.gray950, dark: Colors.gray100) }
        static var secondaryTextOnColor: Color { Colors.white }
        static var secondaryTextOnMedia: Color { Colors.white }

        // Destructive
        static var destructiveBackground: Color { Colors.fixedNegative }
        static var destructiveBackgroundPressed: Color { Color(light: Colors.red700, dark: Colors.red700) }
        static var destructiveText: Color { Colors.white }

        // Destructive Deemphasized
        static var destructiveDeemphasizedBackground: Color { Color(light: Colors.red100, dark: Colors.red600.opacity(0.2)) }
        static var destructiveDeemphasizedText: Color { Color(light: Colors.red600, dark: Colors.red300) }

        // Warning
        static var warningBackground: Color { Colors.fixedWarning }
        static var warningBackgroundPressed: Color { Color(light: Colors.yellow700, dark: Colors.yellow700) }
        static var warningText: Color { Colors.white }

        // Warning Deemphasized
        static var warningDeemphasizedBackground: Color { Color(light: Colors.yellow100, dark: Colors.yellow600.opacity(0.2)) }
        static var warningDeemphasizedText: Color { Color(light: Colors.yellow600, dark: Colors.yellow300) }

        // Disabled
        static var disabledBackground: Color { Color(light: Colors.gray200, dark: Colors.white.opacity(0.1)) }
    }
    
    // Text Input
    static var textInputActiveInnerBorder: Color { Color(light: accent600, dark: accent500) }
    static var textInputActiveOuterBorder: Color { Color(light: accent100, dark: accent600.opacity(0.2)) }
    static var textInputActiveText: Color { Color(light: accent600, dark: accent500) }
    static var textInputInactiveInnerBorder: Color { Color(light: gray200, dark: gray700) }
    static var textInputInactiveOuterBorder: Color { .clear }
    static var textInputBarBackground: Color { Color(light: gray100, dark: white.opacity(0.1)) }
    static var textInputBarBackgroundOnColor: Color { white.opacity(0.15) }
    static var textInputBarBackgroundOnMedia: Color { gray900.opacity(0.6) }
    static var textInputBarBackgroundOnDeemphasized: Color { Color(light: white, dark: gray800) }
    static var textHighlight: Color { Color(light: accent200, dark: accent700) }
    
    // Toggle/Switch
    static var toggleActiveBackground: Color { Color(light: accent100, dark: accent600) }
    static var toggleActiveIcon: Color { Color(light: accent600, dark: white) }
    static var toggleActiveText: Color { Color(light: accent600, dark: white) }
    static var switchCheckedBackgroundiOS: Color { accent600 }
    static var switchCheckedBackgroundAndroid: Color { Color(light: accent400, dark: accent200) }
    static var switchCheckedHandleiOS: Color { white }
    static var switchCheckedHandleAndroid: Color { accent600 }
    static var switchUncheckedBackground: Color { Color(light: gray400, dark: gray500) }
    static var switchUncheckedHandle: Color { white }
    static var switchDisabledBackground: Color { Color(light: gray100, dark: white.opacity(0.1)) }
    static var switchDisabledHandle: Color { Color(light: gray300, dark: gray500) }
    
    // Tooltip
    static var tooltipBackground: Color { Color(light: black.opacity(0.8), dark: white.opacity(0.8)) }
    static var tooltipText: Color { Color(light: gray200, dark: gray950) }
    
    // Indicators
    static var stepperActive: Color { fixedAccent }
    static var stepperInactive: Color { Color(light: gray200, dark: gray700) }
    static var activeDot: Color { fixedAccent }
    static var activeDotOnColor: Color { white }
    static var activeDotOnMedia: Color { white }
    static var inactiveDot: Color { Color(light: gray300, dark: gray600) }
    static var inactiveDotOnColor: Color { white.opacity(0.5) }
    static var inactiveDotOnMedia: Color { white.opacity(0.5) }
    static var dotBadgeBlue: Color { fixedAccent }
    static var ratingStarActive: Color { Color(light: yellow400, dark: yellow300) }
    static var ratingStarActiveOnColor: Color { white }
    static var ratingStarActiveOnMedia: Color { white }
    
    // Actor (Profile Photos)
    static var avatarPlaceholderBackground: Color { Color(light: gray200, dark: gray700) }
    static var actorInitialsBackground: Color { fixedAccent }
    static var avatarOnlineIndicator: Color { Color(light: green500, dark: green400) }
    static var avatarOfflineIndicator: Color { Color(light: gray400, dark: gray500) }
    static var actorBadgeBackground: Color { fixedAccent }
    
    // Miscellaneous
    static var bottomSheetHandle: Color { Color(light: gray300, dark: gray600) }
    static var commentThreadingLines: Color { Color(light: gray200, dark: gray700) }
    static var commentThreadingLinesOnColor: Color { white.opacity(0.3) }
    static var commentThreadingLinesOnMedia: Color { white.opacity(0.3) }
    static var hiddenCommentOverlay: Color { Color(light: white.opacity(0.8), dark: gray900.opacity(0.6)) }
    static var mediaInnerBorder: Color { black.opacity(0.1) }
    static var optimisticPostTint: Color { white.opacity(0.6) }
    static var placeholderImage: Color { Color(light: gray200, dark: gray700) }
    static var mapHighlightBackground: Color { Color(light: accent100, dark: accent800) }
    static var mapHighlightBorder: Color { fixedAccent }
    static var reactionTrayIconBackground: Color { Color(light: gray100, dark: gray800) }
    
    static var overlayScrim: Color { Color(light: black.opacity(0.6), dark: black.opacity(0.8)) }

    // Surface-colored legibility scrim for titles/chrome over busy content
    // (maps, media). Use as gradient stops from scrimSurface → scrimSurfaceClear.
    static var scrimSurface: Color { backgroundSurface.opacity(0.95) }
    static var scrimSurfaceSoft: Color { backgroundSurface.opacity(0.8) }
    static var scrimSurfaceClear: Color { backgroundSurface.opacity(0.0) }
    static var tabBarBackground: Color { backgroundNavBar }
    static var tabSelected: Color { Color(light: gray950, dark: gray100) }
    static var tabUnselected: Color { Color(light: gray500, dark: gray400) }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Raw Color Tokens (50-950 Scale)
    // ═══════════════════════════════════════════════════════════════════════════
    
    // Base
    static let black = Color(red: 0, green: 0, blue: 0)
    static let white = Color(red: 1, green: 1, blue: 1)
    
    // Gray
    static let gray50 = Color(red: 0.98, green: 0.98, blue: 0.98)
    static let gray100 = Color(red: 0.96, green: 0.96, blue: 0.96)
    static let gray200 = Color(red: 0.90, green: 0.90, blue: 0.90)
    static let gray300 = Color(red: 0.83, green: 0.83, blue: 0.83)
    static let gray400 = Color(red: 0.64, green: 0.64, blue: 0.64)
    static let gray500 = Color(red: 0.45, green: 0.45, blue: 0.45)
    static let gray600 = Color(red: 0.36, green: 0.36, blue: 0.36)
    static let gray700 = Color(red: 0.27, green: 0.27, blue: 0.27)
    static let gray800 = Color(red: 0.18, green: 0.18, blue: 0.18)
    static let gray900 = Color(red: 0.11, green: 0.11, blue: 0.11)
    static let gray950 = Color(red: 0.05, green: 0.05, blue: 0.05)
    
    // Blue
    static let blue50 = Color(red: 0.94, green: 0.97, blue: 1.00)
    static let blue100 = Color(red: 0.88, green: 0.93, blue: 1.00)
    static let blue200 = Color(red: 0.75, green: 0.86, blue: 0.99)
    static let blue300 = Color(red: 0.58, green: 0.75, blue: 0.98)
    static let blue400 = Color(red: 0.38, green: 0.62, blue: 0.96)
    static let blue500 = Color(red: 0.23, green: 0.51, blue: 0.96)
    static let blue600 = Color(red: 0.15, green: 0.39, blue: 0.92)
    static let blue700 = Color(red: 0.11, green: 0.31, blue: 0.85)
    static let blue800 = Color(red: 0.12, green: 0.25, blue: 0.69)
    static let blue900 = Color(red: 0.12, green: 0.23, blue: 0.55)
    static let blue950 = Color(red: 0.09, green: 0.15, blue: 0.34)
    
    // Red
    static let red50 = Color(red: 1.00, green: 0.95, blue: 0.95)
    static let red100 = Color(red: 1.00, green: 0.89, blue: 0.89)
    static let red200 = Color(red: 1.00, green: 0.79, blue: 0.79)
    static let red300 = Color(red: 0.99, green: 0.65, blue: 0.65)
    static let red400 = Color(red: 0.97, green: 0.44, blue: 0.44)
    static let red500 = Color(red: 0.94, green: 0.27, blue: 0.27)
    static let red600 = Color(red: 0.86, green: 0.15, blue: 0.15)
    static let red700 = Color(red: 0.73, green: 0.11, blue: 0.11)
    static let red800 = Color(red: 0.60, green: 0.11, blue: 0.11)
    static let red900 = Color(red: 0.50, green: 0.13, blue: 0.13)
    static let red950 = Color(red: 0.27, green: 0.04, blue: 0.04)
    
    // Green
    static let green50 = Color(red: 0.94, green: 0.99, blue: 0.95)
    static let green100 = Color(red: 0.86, green: 0.97, blue: 0.88)
    static let green200 = Color(red: 0.73, green: 0.94, blue: 0.77)
    static let green300 = Color(red: 0.52, green: 0.88, blue: 0.60)
    static let green400 = Color(red: 0.29, green: 0.78, blue: 0.42)
    static let green500 = Color(red: 0.13, green: 0.65, blue: 0.32)
    static let green600 = Color(red: 0.09, green: 0.53, blue: 0.26)
    static let green700 = Color(red: 0.08, green: 0.42, blue: 0.22)
    static let green800 = Color(red: 0.09, green: 0.33, blue: 0.19)
    static let green900 = Color(red: 0.08, green: 0.27, blue: 0.17)
    static let green950 = Color(red: 0.03, green: 0.15, blue: 0.09)
    
    // Yellow
    static let yellow50 = Color(red: 1.00, green: 0.99, blue: 0.91)
    static let yellow100 = Color(red: 1.00, green: 0.98, blue: 0.77)
    static let yellow200 = Color(red: 1.00, green: 0.94, blue: 0.54)
    static let yellow300 = Color(red: 0.99, green: 0.88, blue: 0.28)
    static let yellow400 = Color(red: 0.98, green: 0.80, blue: 0.08)
    static let yellow500 = Color(red: 0.92, green: 0.70, blue: 0.03)
    static let yellow600 = Color(red: 0.80, green: 0.54, blue: 0.02)
    static let yellow700 = Color(red: 0.64, green: 0.39, blue: 0.04)
    static let yellow800 = Color(red: 0.52, green: 0.31, blue: 0.07)
    static let yellow900 = Color(red: 0.44, green: 0.26, blue: 0.08)
    static let yellow950 = Color(red: 0.26, green: 0.13, blue: 0.03)
    
    // Orange
    static let orange50 = Color(red: 1.00, green: 0.97, blue: 0.93)
    static let orange100 = Color(red: 1.00, green: 0.93, blue: 0.84)
    static let orange200 = Color(red: 1.00, green: 0.84, blue: 0.66)
    static let orange300 = Color(red: 0.99, green: 0.72, blue: 0.45)
    static let orange400 = Color(red: 0.98, green: 0.57, blue: 0.24)
    static let orange500 = Color(red: 0.96, green: 0.45, blue: 0.09)
    static let orange600 = Color(red: 0.91, green: 0.35, blue: 0.05)
    static let orange700 = Color(red: 0.76, green: 0.26, blue: 0.05)
    static let orange800 = Color(red: 0.60, green: 0.21, blue: 0.06)
    static let orange900 = Color(red: 0.49, green: 0.18, blue: 0.07)
    static let orange950 = Color(red: 0.26, green: 0.08, blue: 0.02)
    
    // Cyan
    static let cyan50 = Color(red: 0.93, green: 0.99, blue: 1.00)
    static let cyan100 = Color(red: 0.81, green: 0.98, blue: 1.00)
    static let cyan200 = Color(red: 0.65, green: 0.95, blue: 0.99)
    static let cyan300 = Color(red: 0.40, green: 0.90, blue: 0.98)
    static let cyan400 = Color(red: 0.13, green: 0.80, blue: 0.93)
    static let cyan500 = Color(red: 0.02, green: 0.65, blue: 0.78)
    static let cyan600 = Color(red: 0.03, green: 0.52, blue: 0.66)
    static let cyan700 = Color(red: 0.05, green: 0.42, blue: 0.53)
    static let cyan800 = Color(red: 0.08, green: 0.34, blue: 0.43)
    static let cyan900 = Color(red: 0.09, green: 0.28, blue: 0.36)
    static let cyan950 = Color(red: 0.05, green: 0.18, blue: 0.24)
    
    // Teal
    static let teal50 = Color(red: 0.94, green: 0.99, blue: 0.98)
    static let teal100 = Color(red: 0.80, green: 0.97, blue: 0.94)
    static let teal200 = Color(red: 0.60, green: 0.94, blue: 0.88)
    static let teal300 = Color(red: 0.37, green: 0.87, blue: 0.80)
    static let teal400 = Color(red: 0.18, green: 0.76, blue: 0.70)
    static let teal500 = Color(red: 0.08, green: 0.63, blue: 0.58)
    static let teal600 = Color(red: 0.05, green: 0.50, blue: 0.47)
    static let teal700 = Color(red: 0.06, green: 0.40, blue: 0.38)
    static let teal800 = Color(red: 0.07, green: 0.32, blue: 0.31)
    static let teal900 = Color(red: 0.08, green: 0.27, blue: 0.26)
    static let teal950 = Color(red: 0.02, green: 0.16, blue: 0.16)
    
    // Pink
    static let pink50 = Color(red: 1.00, green: 0.95, blue: 0.97)
    static let pink100 = Color(red: 1.00, green: 0.90, blue: 0.95)
    static let pink200 = Color(red: 1.00, green: 0.81, blue: 0.89)
    static let pink300 = Color(red: 0.99, green: 0.65, blue: 0.79)
    static let pink400 = Color(red: 0.98, green: 0.45, blue: 0.65)
    static let pink500 = Color(red: 0.93, green: 0.28, blue: 0.49)
    static let pink600 = Color(red: 0.86, green: 0.15, blue: 0.37)
    static let pink700 = Color(red: 0.74, green: 0.10, blue: 0.28)
    static let pink800 = Color(red: 0.61, green: 0.11, blue: 0.25)
    static let pink900 = Color(red: 0.51, green: 0.12, blue: 0.23)
    static let pink950 = Color(red: 0.31, green: 0.04, blue: 0.11)
    
    // Purple
    static let purple50 = Color(red: 0.98, green: 0.96, blue: 1.00)
    static let purple100 = Color(red: 0.95, green: 0.91, blue: 1.00)
    static let purple200 = Color(red: 0.91, green: 0.84, blue: 1.00)
    static let purple300 = Color(red: 0.85, green: 0.71, blue: 0.99)
    static let purple400 = Color(red: 0.75, green: 0.52, blue: 0.98)
    static let purple500 = Color(red: 0.66, green: 0.33, blue: 0.97)
    static let purple600 = Color(red: 0.58, green: 0.20, blue: 0.92)
    static let purple700 = Color(red: 0.50, green: 0.14, blue: 0.80)
    static let purple800 = Color(red: 0.42, green: 0.13, blue: 0.65)
    static let purple900 = Color(red: 0.35, green: 0.12, blue: 0.53)
    static let purple950 = Color(red: 0.23, green: 0.05, blue: 0.36)
    
    // Violet (blue-shifted purple / indigo-like)
    static let violet50 = Color(red: 0.93, green: 0.94, blue: 1.00)
    static let violet100 = Color(red: 0.88, green: 0.89, blue: 1.00)
    static let violet200 = Color(red: 0.78, green: 0.80, blue: 1.00)
    static let violet300 = Color(red: 0.64, green: 0.67, blue: 0.98)
    static let violet400 = Color(red: 0.50, green: 0.50, blue: 0.95)
    static let violet500 = Color(red: 0.39, green: 0.35, blue: 0.91)
    static let violet600 = Color(red: 0.31, green: 0.25, blue: 0.85)
    static let violet700 = Color(red: 0.26, green: 0.21, blue: 0.72)
    static let violet800 = Color(red: 0.22, green: 0.18, blue: 0.60)
    static let violet900 = Color(red: 0.19, green: 0.16, blue: 0.49)
    static let violet950 = Color(red: 0.12, green: 0.09, blue: 0.32)
    
    // Magenta (red-shifted pink / warm rose)
    static let magenta50 = Color(red: 1.00, green: 0.94, blue: 0.96)
    static let magenta100 = Color(red: 1.00, green: 0.87, blue: 0.91)
    static let magenta200 = Color(red: 1.00, green: 0.75, blue: 0.83)
    static let magenta300 = Color(red: 0.98, green: 0.56, blue: 0.70)
    static let magenta400 = Color(red: 0.95, green: 0.36, blue: 0.55)
    static let magenta500 = Color(red: 0.88, green: 0.20, blue: 0.42)
    static let magenta600 = Color(red: 0.76, green: 0.12, blue: 0.32)
    static let magenta700 = Color(red: 0.64, green: 0.09, blue: 0.25)
    static let magenta800 = Color(red: 0.53, green: 0.10, blue: 0.22)
    static let magenta900 = Color(red: 0.45, green: 0.11, blue: 0.20)
    static let magenta950 = Color(red: 0.28, green: 0.04, blue: 0.10)
    
    // Fuchsia (blue-shifted pink / electric purple-pink)
    static let fuchsia50 = Color(red: 0.98, green: 0.95, blue: 1.00)
    static let fuchsia100 = Color(red: 0.96, green: 0.89, blue: 1.00)
    static let fuchsia200 = Color(red: 0.94, green: 0.79, blue: 1.00)
    static let fuchsia300 = Color(red: 0.90, green: 0.62, blue: 0.98)
    static let fuchsia400 = Color(red: 0.85, green: 0.42, blue: 0.94)
    static let fuchsia500 = Color(red: 0.75, green: 0.25, blue: 0.85)
    static let fuchsia600 = Color(red: 0.64, green: 0.15, blue: 0.72)
    static let fuchsia700 = Color(red: 0.53, green: 0.11, blue: 0.60)
    static let fuchsia800 = Color(red: 0.44, green: 0.11, blue: 0.49)
    static let fuchsia900 = Color(red: 0.37, green: 0.11, blue: 0.40)
    static let fuchsia950 = Color(red: 0.24, green: 0.04, blue: 0.26)
    
    // Lime
    static let lime50 = Color(red: 0.97, green: 1.00, blue: 0.91)
    static let lime100 = Color(red: 0.93, green: 0.99, blue: 0.79)
    static let lime200 = Color(red: 0.85, green: 0.98, blue: 0.60)
    static let lime300 = Color(red: 0.74, green: 0.95, blue: 0.39)
    static let lime400 = Color(red: 0.64, green: 0.90, blue: 0.22)
    static let lime500 = Color(red: 0.52, green: 0.80, blue: 0.08)
    static let lime600 = Color(red: 0.40, green: 0.64, blue: 0.04)
    static let lime700 = Color(red: 0.31, green: 0.49, blue: 0.05)
    static let lime800 = Color(red: 0.26, green: 0.39, blue: 0.07)
    static let lime900 = Color(red: 0.23, green: 0.33, blue: 0.08)
    static let lime950 = Color(red: 0.10, green: 0.19, blue: 0.02)
    
    // Orange Red
    static let orangeRed50 = Color(red: 1.00, green: 0.96, blue: 0.94)
    static let orangeRed100 = Color(red: 1.00, green: 0.90, blue: 0.86)
    static let orangeRed200 = Color(red: 1.00, green: 0.80, blue: 0.72)
    static let orangeRed300 = Color(red: 0.99, green: 0.65, blue: 0.53)
    static let orangeRed400 = Color(red: 0.98, green: 0.47, blue: 0.33)
    static let orangeRed500 = Color(red: 0.96, green: 0.33, blue: 0.19)
    static let orangeRed600 = Color(red: 0.90, green: 0.25, blue: 0.13)
    static let orangeRed700 = Color(red: 0.76, green: 0.19, blue: 0.11)
    static let orangeRed800 = Color(red: 0.62, green: 0.17, blue: 0.11)
    static let orangeRed900 = Color(red: 0.51, green: 0.17, blue: 0.12)
    static let orangeRed950 = Color(red: 0.28, green: 0.06, blue: 0.04)
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Alpha Variants
    // ═══════════════════════════════════════════════════════════════════════════
    
    // Black Alpha
    static let blackAlpha05 = black.opacity(0.05)
    static let blackAlpha10 = black.opacity(0.1)
    static let blackAlpha15 = black.opacity(0.15)
    static let blackAlpha20 = black.opacity(0.2)
    static let blackAlpha30 = black.opacity(0.3)
    static let blackAlpha40 = black.opacity(0.4)
    static let blackAlpha50 = black.opacity(0.5)
    static let blackAlpha60 = black.opacity(0.6)
    static let blackAlpha80 = black.opacity(0.8)
    
    // White Alpha
    static let whiteAlpha05 = white.opacity(0.05)
    static let whiteAlpha10 = white.opacity(0.1)
    static let whiteAlpha15 = white.opacity(0.15)
    static let whiteAlpha20 = white.opacity(0.2)
    static let whiteAlpha30 = white.opacity(0.3)
    static let whiteAlpha40 = white.opacity(0.4)
    static let whiteAlpha50 = white.opacity(0.5)
    static let whiteAlpha60 = white.opacity(0.6)
    static let whiteAlpha80 = white.opacity(0.8)
    static let whiteAlpha90 = white.opacity(0.9)
    
}

// MARK: - Color Extension

extension Color {
    init(light: Color, dark: Color) {
        self.init(UIColor { $0.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light) })
    }
}

// MARK: - Environment

extension EnvironmentValues {
    var isDarkMode: Bool { colorScheme == .dark }
}

// MARK: - Surface Background Extension

extension View {
    /// Applies a full-bleed surface background that extends into safe areas
    /// 
    /// Use this instead of `.background(Colors.backgroundSurface)` to prevent edge gaps.
    /// This is the standard SwiftUI pattern: `.background(color.ignoresSafeArea())`
    ///
    /// Usage:
    /// ```swift
    /// ScrollView { content }
    ///     .pdsSurfaceBackground()
    /// ```
    func pdsSurfaceBackground(_ color: Color = Colors.backgroundSurface) -> some View {
        self.background(color.ignoresSafeArea())
    }
}
