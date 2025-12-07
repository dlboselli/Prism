//
//  Colors.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI
import UIKit

/// Spectrum Color Tokens
/// Part of the Prism Design System (PDS)
///
/// This color system provides:
/// 1. Raw color tokens - Direct access to all Figma color variables
/// 2. Semantic color tokens - Adaptive colors that support light/dark mode
/// 3. Asset catalog (Colors.xcassets) - Mirrors semantic colors for visual editing in Xcode
/// 4. Scalable architecture - Easy to extend and maintain
///
struct Colors {
    
    // MARK: - Semantic Colors (Spectrum Tokens - Light/Dark Mode Support)
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Persistent Colors (Status & Always-On Colors)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Persistent/Accent - Primary accent color
    /// Light: Blue 50, Dark: Blue 50
    static var persistentAccent: Color {
        Color(light: Colors.blue50, dark: Colors.blue50)
    }
    
    /// Persistent/Accent Deemphasized - Subtle accent background
    /// Light: Blue 95, Dark: Blue 55 Alpha 20
    static var persistentAccentDeemphasized: Color {
        Color(light: Colors.blue95, dark: Colors.blue55Alpha20)
    }
    
    /// Persistent/Always Black - Always black regardless of mode
    /// Light: Black, Dark: Black
    static var persistentAlwaysBlack: Color {
        Colors.black
    }
    
    /// Persistent/Always Black Overlay - Semi-transparent black overlay
    /// Light: Black Alpha 40, Dark: Black Alpha 40
    static var persistentAlwaysBlackOverlay: Color {
        Colors.blackAlpha40
    }
    
    /// Persistent/Always Transparent - Always transparent
    /// Light: Transparent, Dark: Transparent
    static var persistentAlwaysTransparent: Color {
        Colors.transparent
    }
    
    /// Persistent/Always White - Always white regardless of mode
    /// Light: White, Dark: White
    static var persistentAlwaysWhite: Color {
        Colors.white
    }
    
    /// Persistent/Negative - Error/destructive color
    /// Light: Red 50, Dark: Red 70
    static var persistentNegative: Color {
        Color(light: Colors.red50, dark: Colors.red70)
    }
    
    /// Persistent/Negative Deemphasized - Subtle error background
    /// Light: Red 90, Dark: Red 40 Alpha 20
    static var persistentNegativeDeemphasized: Color {
        Color(light: Colors.red90, dark: Colors.red40Alpha20)
    }
    
    /// Persistent/Positive - Success color
    /// Light: Green 50, Dark: Green 70
    static var persistentPositive: Color {
        Color(light: Colors.green50, dark: Colors.green70)
    }
    
    /// Persistent/Positive Deemphasized - Subtle success background
    /// Light: Green 100, Dark: Green 10
    static var persistentPositiveDeemphasized: Color {
        Color(light: Colors.green100, dark: Colors.green10)
    }
    
    /// Persistent/Warning - Warning color
    /// Light: Yellow 60, Dark: Yellow 60
    static var persistentWarning: Color {
        Color(light: Colors.yellow60, dark: Colors.yellow70)
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Text Colors
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Text/Primary Text - Main text color
    /// Light: Gray 00, Dark: Gray 95
    static var textPrimary: Color {
        Color(light: Colors.gray00, dark: Colors.gray95)
    }
    
    /// Text/Primary Text On Color - Text on colored backgrounds
    /// Light: White, Dark: White
    static var textPrimaryOnColor: Color {
        Colors.white
    }
    
    /// Text/Primary Text On Media - Text on images/media
    /// Light: White, Dark: White
    static var textPrimaryOnMedia: Color {
        Colors.white
    }
    
    /// Text/Secondary Text - Supporting text color
    /// Light: Gray 45, Dark: Gray 75
    static var textSecondary: Color {
        Color(light: Colors.gray45, dark: Colors.gray75)
    }
    
    /// Text/Secondary Text On Color - Secondary text on colored backgrounds
    /// Light: White Alpha 90, Dark: White Alpha 90
    static var textSecondaryOnColor: Color {
        Colors.whiteAlpha90
    }
    
    /// Text/Secondary Text On Media - Secondary text on images/media
    /// Light: White Alpha 80, Dark: White Alpha 80
    static var textSecondaryOnMedia: Color {
        Colors.whiteAlpha80
    }
    
    /// Text/Placeholder Text - Placeholder/hint text
    /// Light: Gray 45, Dark: Gray 75
    static var textPlaceholder: Color {
        Color(light: Colors.gray45, dark: Colors.gray75)
    }
    
    /// Text/Placeholder Text On Color - Placeholder on colored backgrounds
    /// Light: White Alpha 90, Dark: White Alpha 90
    static var textPlaceholderOnColor: Color {
        Colors.whiteAlpha90
    }
    
    /// Text/Placeholder Text On Media - Placeholder on images/media
    /// Light: White Alpha 80, Dark: White Alpha 80
    static var textPlaceholderOnMedia: Color {
        Colors.whiteAlpha80
    }
    
    /// Text/Disabled Text - Disabled text state
    /// Light: Gray 75, Dark: Gray 50
    static var textDisabled: Color {
        Color(light: Colors.gray75, dark: Colors.gray50)
    }
    
    /// Text/Disabled Text On Color - Disabled text on colored backgrounds
    /// Light: White Alpha 90, Dark: White Alpha 90
    static var textDisabledOnColor: Color {
        Colors.whiteAlpha90
    }
    
    /// Text/Disabled Text On Media - Disabled text on images/media
    /// Light: White Alpha 50, Dark: White Alpha 50
    static var textDisabledOnMedia: Color {
        Colors.whiteAlpha50
    }
    
    /// Text/Blue Link - Clickable link text
    /// Light: Blue 45, Dark: Blue 70
    static var textBlueLink: Color {
        Color(light: Colors.blue45, dark: Colors.blue70)
    }
    
    /// Text/Link On Color - Links on colored backgrounds
    /// Light: White, Dark: White
    static var textLinkOnColor: Color {
        Colors.white
    }
    
    /// Text/Link On Media - Links on images/media
    /// Light: White, Dark: White
    static var textLinkOnMedia: Color {
        Colors.white
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Icon Colors
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Icon/Primary Icon - Main icon color
    /// Light: Gray 00, Dark: Gray 95
    static var iconPrimary: Color {
        Color(light: Colors.gray00, dark: Colors.gray95)
    }
    
    /// Icon/Primary Icon On Color - Icons on colored backgrounds
    /// Light: White, Dark: White
    static var iconPrimaryOnColor: Color {
        Colors.white
    }
    
    /// Icon/Primary Icon On Media - Icons on images/media
    /// Light: White, Dark: White
    static var iconPrimaryOnMedia: Color {
        Colors.white
    }
    
    /// Icon/Secondary Icon - Supporting icon color
    /// Light: Gray 45, Dark: Gray 75
    static var iconSecondary: Color {
        Color(light: Colors.gray45, dark: Colors.gray75)
    }
    
    /// Icon/Secondary Icon On Color - Secondary icons on colored backgrounds
    /// Light: White Alpha 90, Dark: White Alpha 90
    static var iconSecondaryOnColor: Color {
        Colors.whiteAlpha90
    }
    
    /// Icon/Secondary Icon On Media - Secondary icons on images/media
    /// Light: White Alpha 80, Dark: White Alpha 80
    static var iconSecondaryOnMedia: Color {
        Colors.whiteAlpha80
    }
    
    /// Icon/Placeholder Icon - Placeholder icon color
    /// Light: Gray 45, Dark: Gray 75
    static var iconPlaceholder: Color {
        Color(light: Colors.gray45, dark: Colors.gray75)
    }
    
    /// Icon/Placeholder Icon On Color - Placeholder icons on colored backgrounds
    /// Light: White Alpha 90, Dark: White Alpha 90
    static var iconPlaceholderOnColor: Color {
        Colors.whiteAlpha90
    }
    
    /// Icon/Placeholder Icon On Media - Placeholder icons on images/media
    /// Light: White Alpha 50, Dark: White Alpha 50
    static var iconPlaceholderOnMedia: Color {
        Colors.whiteAlpha50
    }
    
    /// Icon/Disabled Icon - Disabled icon state
    /// Light: Gray 75, Dark: Gray 50
    static var iconDisabled: Color {
        Color(light: Colors.gray75, dark: Colors.gray50)
    }
    
    /// Icon/Disabled Icon On Color - Disabled icons on colored backgrounds
    /// Light: White Alpha 50, Dark: White Alpha 50
    static var iconDisabledOnColor: Color {
        Colors.whiteAlpha50
    }
    
    /// Icon/Disabled Icon On Media - Disabled icons on images/media
    /// Light: White Alpha 50, Dark: White Alpha 50
    static var iconDisabledOnMedia: Color {
        Colors.whiteAlpha50
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Background Colors
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Background/Surface Background - Main surface color
    /// Light: White, Dark: Gray 15
    static var backgroundSurface: Color {
        Color(light: Colors.white, dark: Colors.gray15)
    }
    
    /// Background/Deemphasized - Subtle background
    /// Light: Gray 95, Dark: White Alpha 10
    static var backgroundDeemphasized: Color {
        Color(light: Colors.gray95, dark: Colors.whiteAlpha10)
    }
    
    /// Background/Wash - Wash/tinted background
    /// Light: Gray 80, Dark: Gray 05
    static var backgroundWash: Color {
        Color(light: Colors.gray80, dark: Colors.gray05)
    }
    
    /// Background/Web Wash - Web-specific wash
    /// Light: Gray 95, Dark: Gray 10
    static var backgroundWebWash: Color {
        Color(light: Colors.gray95, dark: Colors.gray10)
    }
    
    /// Background/Card Background - Card surface color
    /// Light: White, Dark: Gray 20
    static var backgroundCard: Color {
        Color(light: Colors.white, dark: Colors.gray20)
    }
    
    /// Background/Card Background Flat - Flat card variant
    /// Light: Gray 100, Dark: Gray 20
    static var backgroundCardFlat: Color {
        Color(light: Colors.gray100, dark: Colors.gray20)
    }
    
    /// Background/Card Background Dark - Dark card variant
    /// Light: Gray 20, Dark: Gray 20
    static var backgroundCardDark: Color {
        Colors.gray20
    }
    
    /// Background/Card Background On Color - Cards on colored backgrounds
    /// Light: White Alpha 15, Dark: White Alpha 15
    static var backgroundCardOnColor: Color {
        Colors.whiteAlpha15
    }
    
    /// Background/Card Background On Media - Cards on images/media
    /// Light: Gray 10 Alpha 60, Dark: Gray 10 Alpha 60
    static var backgroundCardOnMedia: Color {
        Colors.gray10Alpha60
    }
    
    /// Background/Card Background On Media Extra Light - Extra light cards on media
    /// Light: Black Alpha 20, Dark: Black Alpha 20
    static var backgroundCardOnMediaExtraLight: Color {
        Colors.blackAlpha20
    }
    
    /// Background/Card Background Legacy Web - Legacy web card
    /// Light: White, Dark: Gray 15
    static var backgroundCardLegacyWeb: Color {
        Color(light: Colors.white, dark: Colors.gray15)
    }
    
    /// Background/Nav Bar Background - Navigation bar background
    /// Light: White, Dark: Gray 15
    static var backgroundNavBar: Color {
        Color(light: Colors.white, dark: Colors.gray15)
    }
    
    /// Background/Popover Background - Popover/dropdown background
    /// Light: White, Dark: Gray 25
    static var backgroundPopover: Color {
        Color(light: Colors.white, dark: Colors.gray25)
    }
    
    /// Background/Bottom Sheet Background Deemphasized - Bottom sheet background
    /// Light: Gray 95, Dark: Gray 15
    static var backgroundBottomSheet: Color {
        Color(light: Colors.gray95, dark: Colors.gray15)
    }
    
    /// Background/Divider - Divider line color
    /// Light: Gray 80, Dark: Gray 45
    static var backgroundDivider: Color {
        Color(light: Colors.gray80, dark: Colors.gray45)
    }
    
    /// Background/Divider On Color - Dividers on colored backgrounds
    /// Light: Gray 40, Dark: Gray 40
    static var backgroundDividerOnColor: Color {
        Colors.gray40
    }
    
    /// Background/Divider On Media - Dividers on images/media
    /// Light: Gray 40, Dark: Gray 40
    static var backgroundDividerOnMedia: Color {
        Colors.gray40
    }
    
    /// Background/Overlay on Surface - Surface overlay
    /// Light: Black Alpha 40, Dark: Black Alpha 60
    static var backgroundOverlayOnSurface: Color {
        Color(light: Colors.blackAlpha40, dark: Colors.blackAlpha60)
    }
    
    /// Background/Overlay on Media - Media overlay
    /// Light: Black Alpha 80, Dark: Black Alpha 80
    static var backgroundOverlayOnMedia: Color {
        Colors.blackAlpha80
    }
    
    /// Background/Overlay on Media Light - Light media overlay
    /// Light: Black Alpha 35, Dark: Black Alpha 35
    static var backgroundOverlayOnMediaLight: Color {
        Colors.blackAlpha35
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Elevation Colors (Borders & Shadows)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Elevation/Border Persistent UI - Persistent UI borders
    /// Light: Black Alpha 05, Dark: White Alpha 10
    static var elevationBorderPersistent: Color {
        Color(light: Colors.blackAlpha05, dark: Colors.whiteAlpha10)
    }
    
    /// Elevation/Border Responsive UI - Responsive UI borders
    /// Light: Black Alpha 10, Dark: White Alpha 05
    static var elevationBorderResponsive: Color {
        Color(light: Colors.blackAlpha10, dark: Colors.whiteAlpha05)
    }
    
    /// Elevation/Border UI Emphasis - Emphasized borders
    /// Light: Gray 85, Dark: White Alpha 05
    static var elevationBorderEmphasis: Color {
        Color(light: Colors.gray85, dark: Colors.whiteAlpha05)
    }
    
    /// Elevation/Border UI Emphasis On Media - Emphasized borders on media
    /// Light: Black Alpha 10, Dark: Black Alpha 10
    static var elevationBorderEmphasisOnMedia: Color {
        Colors.blackAlpha10
    }
    
    /// Elevation/Border Focus UI - Focus state borders
    /// Light: Gray 00 Alpha 16, Dark: White Alpha 05
    static var elevationBorderFocus: Color {
        Color(light: Colors.gray00Alpha16, dark: Colors.whiteAlpha05)
    }
    
    /// Elevation/Card Border - Card borders
    /// Light: Transparent, Dark: Transparent
    static var elevationCardBorder: Color {
        Colors.transparent
    }
    
    /// Elevation/Instant Feedback Border - Feedback borders
    /// Light: Transparent, Dark: Transparent
    static var elevationInstantFeedbackBorder: Color {
        Colors.transparent
    }
    
    /// Elevation/Card Shadow Light - Light card shadow
    /// Light: Black Alpha 05, Dark: Black Alpha 10
    static var elevationCardShadowLight: Color {
        Color(light: Colors.blackAlpha05, dark: Colors.blackAlpha10)
    }
    
    /// Elevation/Card Shadow Medium - Medium card shadow
    /// Light: Black Alpha 05, Dark: Black Alpha 10
    static var elevationCardShadowMedium: Color {
        Color(light: Colors.blackAlpha05, dark: Colors.blackAlpha10)
    }
    
    /// Elevation/Card Shadow Strong - Strong card shadow
    /// Light: Black Alpha 10, Dark: Black Alpha 15
    static var elevationCardShadowStrong: Color {
        Color(light: Colors.blackAlpha10, dark: Colors.blackAlpha15)
    }
    
    /// Elevation/Instant Feedback Shadow - Feedback shadows
    /// Light: Black Alpha 05, Dark: Black Alpha 10
    static var elevationInstantFeedbackShadow: Color {
        Color(light: Colors.blackAlpha05, dark: Colors.blackAlpha10)
    }
    
    /// Elevation/Persistent CTA Shadow - CTA button shadows
    /// Light: Black Alpha 10, Dark: Black Alpha 15
    static var elevationPersistentCtaShadow: Color {
        Color(light: Colors.blackAlpha10, dark: Colors.blackAlpha15)
    }
    
    /// Elevation/Shadow Persistent UI - Persistent UI shadows
    /// Light: Black Alpha 10, Dark: Black Alpha 30
    static var elevationShadowPersistent: Color {
        Color(light: Colors.blackAlpha10, dark: Colors.blackAlpha30)
    }
    
    /// Elevation/Shadow Responsive UI - Responsive UI shadows
    /// Light: Black Alpha 10, Dark: Black Alpha 10
    static var elevationShadowResponsive: Color {
        Colors.blackAlpha10
    }
    
    /// Elevation/Shadow UI Emphasis - Emphasis shadows
    /// Light: Black Alpha 10, Dark: Black Alpha 10
    static var elevationShadowEmphasis: Color {
        Colors.blackAlpha10
    }
    
    /// Elevation/Shadow Text and Icon On Media - Text/icon shadows on media
    /// Light: Black Alpha 60, Dark: Black Alpha 60
    static var elevationShadowTextIconOnMedia: Color {
        Colors.blackAlpha60
    }
    
    /// Elevation/Tooltip Shadow - Tooltip shadows
    /// Light: Black Alpha 10, Dark: Black Alpha 10
    static var elevationTooltipShadow: Color {
        Colors.blackAlpha10
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Composer Colors (Decorative)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Composer/Decorative Chat Blue
    static var composerChatBlue: Color { Colors.blue15 }
    
    /// Composer/Decorative Icon Blue
    static var composerIconBlue: Color { Colors.blue45 }
    
    /// Composer/Decorative Icon Green
    static var composerIconGreen: Color { Colors.green70 }
    
    /// Composer/Decorative Icon Pink
    static var composerIconPink: Color { Colors.pink65 }
    
    /// Composer/Decorative Icon Purple
    static var composerIconPurple: Color { Colors.purple55 }
    
    /// Composer/Decorative Icon Red
    static var composerIconRed: Color { Colors.red55 }
    
    /// Composer/Decorative Icon Reels
    static var composerIconReels: Color { Colors.red60 }
    
    /// Composer/Decorative Icon Teal
    static var composerIconTeal: Color { Colors.teal70 }
    
    /// Composer/Decorative Icon WhatsApp
    static var composerIconWhatsApp: Color { Colors.whatsappLightGreen }
    
    /// Composer/Decorative Icon Yellow
    static var composerIconYellow: Color { Colors.yellow80 }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Data Visualization Colors
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Data Visualization/Dataviz Blue Primary
    static var datavizBluePrimary: Color { Colors.blue55 }
    
    /// Data Visualization/Dataviz Blue Secondary
    /// Light: Blue 25, Dark: Blue 95
    static var datavizBlueSecondary: Color {
        Color(light: Colors.blue25, dark: Colors.blue95)
    }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Component Colors (Internal FDS Components)
    // ═══════════════════════════════════════════════════════════════════════════
    
    // MARK: Primary Button Colors
    
    /// Primary Button Background - Blue 50 (both modes)
    static var primaryButtonBackground: Color { Colors.blue50 }
    
    /// Primary Button Background On Color - White (both modes)
    static var primaryButtonBackgroundOnColor: Color { Colors.white }
    
    /// Primary Button On Media - White (both modes)
    static var primaryButtonOnMedia: Color { Colors.white }
    
    /// Primary Button Icon - White (both modes)
    static var primaryButtonIcon: Color { Colors.white }
    
    /// Primary Button Icon On Color - Black (both modes)
    static var primaryButtonIconOnColor: Color { Colors.black }
    
    /// Primary Button Icon On Media - Gray 00 (both modes)
    static var primaryButtonIconOnMedia: Color { Colors.gray00 }
    
    /// Primary Button Text - White (both modes)
    static var primaryButtonText: Color { Colors.white }
    
    /// Primary Button Text On Color - Black (both modes)
    static var primaryButtonTextOnColor: Color { Colors.black }
    
    /// Primary Button Text On Media - Gray 00 (both modes)
    static var primaryButtonTextOnMedia: Color { Colors.gray00 }
    
    // MARK: Primary Deemphasized Button Colors
    
    /// Primary Deemphasized Button Background
    /// Light: Blue 95, Dark: Blue 55 Alpha 20
    static var primaryDeemphasizedButtonBackground: Color {
        Color(light: Colors.blue95, dark: Colors.blue55Alpha20)
    }
    
    /// Primary Deemphasized Button Icon
    /// Light: Blue 45, Dark: Blue 75
    static var primaryDeemphasizedButtonIcon: Color {
        Color(light: Colors.blue45, dark: Colors.blue75)
    }
    
    /// Primary Deemphasized Button Text
    /// Light: Blue 45, Dark: Blue 75
    static var primaryDeemphasizedButtonText: Color {
        Color(light: Colors.blue45, dark: Colors.blue75)
    }
    
    // MARK: Secondary Button Colors
    
    /// Secondary Button Background
    /// Light: Gray 95, Dark: White Alpha 10
    static var secondaryButtonBackground: Color {
        Color(light: Colors.gray95, dark: Colors.whiteAlpha10)
    }
    
    /// Secondary Button Background On Color - White Alpha 15 (both modes)
    static var secondaryButtonBackgroundOnColor: Color { Colors.whiteAlpha15 }
    
    /// Secondary Button Background On Media - Gray 10 Alpha 60 (both modes)
    static var secondaryButtonBackgroundOnMedia: Color { Colors.gray10Alpha60 }
    
    /// Secondary Button Background Floating
    /// Light: White, Dark: Gray 25
    static var secondaryButtonBackgroundFloating: Color {
        Color(light: Colors.white, dark: Colors.gray25)
    }
    
    /// Secondary Button Icon
    /// Light: Gray 00, Dark: Gray 95
    static var secondaryButtonIcon: Color {
        Color(light: Colors.gray00, dark: Colors.gray95)
    }
    
    /// Secondary Button Icon On Color - White (both modes)
    static var secondaryButtonIconOnColor: Color { Colors.white }
    
    /// Secondary Button Icon On Media - White (both modes)
    static var secondaryButtonIconOnMedia: Color { Colors.white }
    
    /// Secondary Button Text
    /// Light: Gray 00, Dark: Gray 95
    static var secondaryButtonText: Color {
        Color(light: Colors.gray00, dark: Colors.gray95)
    }
    
    /// Secondary Button Text On Color - White (both modes)
    static var secondaryButtonTextOnColor: Color { Colors.white }
    
    /// Secondary Button Text On Media - White (both modes)
    static var secondaryButtonTextOnMedia: Color { Colors.white }
    
    // MARK: Disabled Button Colors
    
    /// Disabled Button Background
    /// Light: Gray 85, Dark: White Alpha 10
    static var disabledButtonBackground: Color {
        Color(light: Colors.gray85, dark: Colors.whiteAlpha10)
    }
    
    // MARK: Text Input Colors
    
    /// Text Input Active Inner Border
    /// Light: Blue 50, Dark: Blue 55
    static var textInputActiveInnerBorder: Color {
        Color(light: Colors.blue50, dark: Colors.blue55)
    }
    
    /// Text Input Active Outer Border
    /// Light: Blue 95, Dark: Blue 55 Alpha 20
    static var textInputActiveOuterBorder: Color {
        Color(light: Colors.blue95, dark: Colors.blue55Alpha20)
    }
    
    /// Text Input Active Text
    /// Light: Blue 45, Dark: Blue 60
    static var textInputActiveText: Color {
        Color(light: Colors.blue45, dark: Colors.blue60)
    }
    
    /// Text Input Inactive Inner Border
    /// Light: Gray 80, Dark: Gray 35
    static var textInputInactiveInnerBorder: Color {
        Color(light: Colors.gray80, dark: Colors.gray35)
    }
    
    /// Text Input Inactive Outer Border - Transparent (both modes)
    static var textInputInactiveOuterBorder: Color { Colors.transparent }
    
    /// Text Input Bar Background
    /// Light: Gray 95, Dark: White Alpha 10
    static var textInputBarBackground: Color {
        Color(light: Colors.gray95, dark: Colors.whiteAlpha10)
    }
    
    /// Text Input Bar Background On Color - White Alpha 15 (both modes)
    static var textInputBarBackgroundOnColor: Color { Colors.whiteAlpha15 }
    
    /// Text Input Bar Background On Media - Gray 10 Alpha 60 (both modes)
    static var textInputBarBackgroundOnMedia: Color { Colors.gray10Alpha60 }
    
    /// Text Input Bar Background on Deemphasized
    /// Light: White, Dark: Gray 20
    static var textInputBarBackgroundOnDeemphasized: Color {
        Color(light: Colors.white, dark: Colors.gray20)
    }
    
    /// Text Highlight
    /// Light: Blue 90, Dark: Blue 30
    static var textHighlight: Color {
        Color(light: Colors.blue90, dark: Colors.blue30)
    }
    
    // MARK: Toggle/Switch Colors
    
    /// Toggle Active Background
    /// Light: Blue 95, Dark: Blue 55
    static var toggleActiveBackground: Color {
        Color(light: Colors.blue95, dark: Colors.blue55)
    }
    
    /// Toggle Active Icon
    /// Light: Blue 45, Dark: White
    static var toggleActiveIcon: Color {
        Color(light: Colors.blue45, dark: Colors.white)
    }
    
    /// Toggle Active Text
    /// Light: Blue 45, Dark: White
    static var toggleActiveText: Color {
        Color(light: Colors.blue45, dark: Colors.white)
    }
    
    /// Switch Checked Background Color (iOS) - Blue 50 (both modes)
    static var switchCheckedBackgroundiOS: Color { Colors.blue50 }
    
    /// Switch Checked Background Color (Android)
    /// Light: Blue 60, Dark: Blue 80
    static var switchCheckedBackgroundAndroid: Color {
        Color(light: Colors.blue60, dark: Colors.blue80)
    }
    
    /// Switch Checked Handle Fill Color (iOS) - White (both modes)
    static var switchCheckedHandleiOS: Color { Colors.white }
    
    /// Switch Checked Handle Fill Color (Android)
    /// Light: Blue 50 (referenced), Dark: Blue 50
    static var switchCheckedHandleAndroid: Color { Colors.blue50 }
    
    /// Switch Unchecked Background Color
    /// Light: Gray 60, Dark: Gray 50
    static var switchUncheckedBackground: Color {
        Color(light: Colors.gray60, dark: Colors.gray50)
    }
    
    /// Switch Unchecked Handle Fill Color - White (both modes)
    static var switchUncheckedHandle: Color { Colors.white }
    
    /// Switch Disabled Background Color
    /// Light: Gray 95, Dark: White Alpha 10
    static var switchDisabledBackground: Color {
        Color(light: Colors.gray95, dark: Colors.whiteAlpha10)
    }
    
    /// Switch Disabled Handle Fill Color
    /// Light: Gray 75, Dark: Gray 50
    static var switchDisabledHandle: Color {
        Color(light: Colors.gray75, dark: Colors.gray50)
    }
    
    // MARK: Tooltip Colors
    
    /// Tooltip Background
    /// Light: Black Alpha 80, Dark: White Alpha 80
    static var tooltipBackground: Color {
        Color(light: Colors.blackAlpha80, dark: Colors.whiteAlpha80)
    }
    
    /// Tooltip Text
    /// Light: Gray 85, Dark: Gray 00
    static var tooltipText: Color {
        Color(light: Colors.gray85, dark: Colors.gray00)
    }
    
    /// Web Legacy Tooltip Background
    /// Light: Gray 20, Dark: Gray 80
    static var webLegacyTooltipBackground: Color {
        Color(light: Colors.gray20, dark: Colors.gray80)
    }
    
    // MARK: Stepper Colors
    
    /// Stepper Active - Blue 50 (both modes)
    static var stepperActive: Color { Colors.blue50 }
    
    /// Stepper Inactive
    /// Light: Gray 85, Dark: Gray 35
    static var stepperInactive: Color {
        Color(light: Colors.gray85, dark: Colors.gray35)
    }
    
    // MARK: Dot/Page Indicator Colors
    
    /// Active Dot - Blue 50 (both modes)
    static var activeDot: Color { Colors.blue50 }
    
    /// Active Dot On Color - White (both modes)
    static var activeDotOnColor: Color { Colors.white }
    
    /// Active Dot On Media - White (both modes)
    static var activeDotOnMedia: Color { Colors.white }
    
    /// Inactive Dot
    /// Light: Gray 75, Dark: Gray 45
    static var inactiveDot: Color {
        Color(light: Colors.gray75, dark: Colors.gray45)
    }
    
    /// Inactive Dot On Color - White Alpha 50 (both modes)
    static var inactiveDotOnColor: Color { Colors.whiteAlpha50 }
    
    /// Inactive Dot On Media - White Alpha 50 (both modes)
    static var inactiveDotOnMedia: Color { Colors.whiteAlpha50 }
    
    /// Dot Badge Blue - Blue 50 (both modes)
    static var dotBadgeBlue: Color { Colors.blue50 }
    
    // MARK: Rating Colors
    
    /// Rating Star Active
    /// Light: Yellow 60, Dark: Yellow 70
    static var ratingStarActive: Color {
        Color(light: Colors.yellow60, dark: Colors.yellow70)
    }
    
    /// Rating Star Active On Color - White (both modes)
    static var ratingStarActiveOnColor: Color { Colors.white }
    
    /// Rating Star Active On Media - White (both modes)
    static var ratingStarActiveOnMedia: Color { Colors.white }
    
    // MARK: Miscellaneous Component Colors
    
    /// Bottom Sheet Handle
    /// Light: Gray 75, Dark: Gray 45
    static var bottomSheetHandle: Color {
        Color(light: Colors.gray75, dark: Colors.gray45)
    }
    
    /// Comment Threading Lines
    /// Light: Gray 80, Dark: Gray 35
    static var commentThreadingLines: Color {
        Color(light: Colors.gray80, dark: Colors.gray35)
    }
    
    /// Comment Threading Lines On Color - White Alpha 30 (both modes)
    static var commentThreadingLinesOnColor: Color { Colors.whiteAlpha30 }
    
    /// Comment Threading Lines On Media - White Alpha 30 (both modes)
    static var commentThreadingLinesOnMedia: Color { Colors.whiteAlpha30 }
    
    /// Hidden Comment Overlay
    /// Light: White Alpha 80, Dark: Gray 15 Alpha 60
    static var hiddenCommentOverlay: Color {
        Color(light: Colors.whiteAlpha80, dark: Colors.gray15Alpha60)
    }
    
    /// Media Inner Border - Black Alpha 10 (both modes)
    static var mediaInnerBorder: Color { Colors.blackAlpha10 }
    
    /// Optimistic Post Tint - White Alpha 60 (both modes)
    static var optimisticPostTint: Color { Colors.whiteAlpha60 }
    
    /// Placeholder Image
    /// Light: Gray 90, Dark: Gray 25
    static var placeholderImage: Color {
        Color(light: Colors.gray90, dark: Colors.gray25)
    }
    
    /// Map Highlight Background
    /// Light: Blue 95, Dark: Blue 20
    static var mapHighlightBackground: Color {
        Color(light: Colors.blue95, dark: Colors.blue20)
    }
    
    /// Map Highlight Border
    /// Light: Blue 50, Dark: Blue 55
    static var mapHighlightBorder: Color {
        Color(light: Colors.blue50, dark: Colors.blue55)
    }
    
    /// UFI Tray Icon Button Background
    /// Light: Gray 95, Dark: Gray 20
    static var ufiTrayIconButtonBackground: Color {
        Color(light: Colors.gray95, dark: Colors.gray20)
    }
    
    /// FB Wordmark
    /// Light: Blue 50, Dark: Blue 50
    static var fbWordmark: Color { Colors.blue50 }
    
    /// FB Logo - Blue 50 (both modes)
    static var fbLogo: Color { Colors.blue50 }
    
    // ═══════════════════════════════════════════════════════════════════════════
    // MARK: - Legacy Semantic Aliases (For Backward Compatibility)
    // ═══════════════════════════════════════════════════════════════════════════
    
    /// Primary text color (alias for textPrimary)
    static var primaryText: Color { textPrimary }
    
    /// Secondary text color (alias for textSecondary)
    static var secondaryText: Color { textSecondary }
    
    /// Tertiary text color
    /// Light: Gray 60, Dark: Gray 60
    static var tertiaryText: Color {
        Colors.gray60
    }
    
    /// Surface background color (alias for backgroundSurface)
    static var surfaceBackground: Color { backgroundSurface }
    
    /// Secondary surface background color
    /// Light: Gray 95, Dark: Gray 10
    static var surfaceSecondary: Color {
        Color(light: Colors.gray95, dark: Colors.gray10)
    }
    
    /// Tertiary surface background color
    /// Light: Gray 90, Dark: Gray 15
    static var surfaceTertiary: Color {
        Color(light: Colors.gray90, dark: Colors.gray15)
    }
    
    /// Card background color (alias for backgroundCard)
    static var cardBackground: Color { backgroundCard }
    
    /// Border color
    /// Light: Gray 80, Dark: Gray 30
    static var border: Color {
        Color(light: Colors.gray80, dark: Colors.gray30)
    }
    
    /// Divider color (alias for backgroundDivider)
    static var divider: Color { backgroundDivider }
    
    /// Primary interactive color (alias for persistentAccent)
    static var interactivePrimary: Color { persistentAccent }
    
    /// Primary interactive hover color
    /// Light: Blue 50, Dark: Blue 65
    static var interactivePrimaryHover: Color {
        Color(light: Colors.blue50, dark: Colors.blue65)
    }
    
    /// Primary interactive pressed color
    /// Light: Blue 45, Dark: Blue 70
    static var interactivePrimaryPressed: Color {
        Color(light: Colors.blue45, dark: Colors.blue70)
    }
    
    /// Link color (alias for textBlueLink)
    static var link: Color { textBlueLink }
    
    /// Success color (alias for persistentPositive)
    static var success: Color { persistentPositive }
    
    /// Warning color (alias for persistentWarning)
    static var warning: Color { persistentWarning }
    
    /// Error color (alias for persistentNegative)
    static var error: Color { persistentNegative }
    
    /// Info color
    /// Light: Cyan 55, Dark: Cyan 60
    static var info: Color {
        Color(light: Colors.cyan55, dark: Colors.cyan60)
    }
    
    /// Overlay color for modals and popovers (alias for backgroundOverlayOnSurface)
    static var overlay: Color { backgroundOverlayOnSurface }
    
    /// Overlay scrim color
    /// Light: Black Alpha 60, Dark: Black Alpha 80
    static var overlayScrim: Color {
        Color(light: Colors.blackAlpha60, dark: Colors.blackAlpha80)
    }
    
    /// Tab bar background color (alias for backgroundNavBar)
    static var tabBarBackground: Color { backgroundNavBar }
    
    /// Selected tab indicator color
    /// Light: Blue 55, Dark: Blue 60
    static var tabSelected: Color {
        Color(light: Colors.blue55, dark: Colors.blue60)
    }
    
    /// Unselected tab color
    /// Light: Gray 50, Dark: Gray 60
    static var tabUnselected: Color {
        Color(light: Colors.gray50, dark: Colors.gray60)
    }
    
    // MARK: - Raw Color Tokens

    // MARK: - Black Colors

    /// Color/Black
    /// RGB: (0.00, 0.00, 0.00)
    static var black: Color {
        Color(red: 0, green: 0, blue: 0)
    }

    /// Color/Black Alpha 05
    /// RGBA: (0.00, 0.00, 0.00, 0.05)
    static var blackAlpha05: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.05)
    }

    /// Color/Black Alpha 10
    /// RGBA: (0.00, 0.00, 0.00, 0.10)
    static var blackAlpha10: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.1)
    }

    /// Color/Black Alpha 15
    /// RGBA: (0.00, 0.00, 0.00, 0.15)
    static var blackAlpha15: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.15)
    }

    /// Color/Black Alpha 20
    /// RGBA: (0.00, 0.00, 0.00, 0.20)
    static var blackAlpha20: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.2)
    }

    /// Color/Black Alpha 30
    /// RGBA: (0.00, 0.00, 0.00, 0.30)
    static var blackAlpha30: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.3)
    }

    /// Color/Black Alpha 35
    /// RGBA: (0.00, 0.00, 0.00, 0.35)
    static var blackAlpha35: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.35)
    }

    /// Color/Black Alpha 40
    /// RGBA: (0.00, 0.00, 0.00, 0.40)
    static var blackAlpha40: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.4)
    }

    /// Color/Black Alpha 50
    /// RGBA: (0.00, 0.00, 0.00, 0.50)
    static var blackAlpha50: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.5)
    }

    /// Color/Black Alpha 60
    /// RGBA: (0.00, 0.00, 0.00, 0.60)
    static var blackAlpha60: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.6)
    }

    /// Color/Black Alpha 65
    /// RGBA: (0.00, 0.00, 0.00, 0.65)
    static var blackAlpha65: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.65)
    }

    /// Color/Black Alpha 80
    /// RGBA: (0.00, 0.00, 0.00, 0.80)
    static var blackAlpha80: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0.8)
    }

    /// Color/Fall Black
    /// RGB: (0.22, 0.18, 0.05)
    static var fallBlack: Color {
        Color(red: 0.22, green: 0.18, blue: 0.05)
    }


    // MARK: - White Colors

    /// Color/Fall White
    /// RGB: (1.00, 0.99, 0.97)
    static var fallWhite: Color {
        Color(red: 1, green: 0.99, blue: 0.97)
    }

    /// Color/Fall White Alpha 10
    /// RGBA: (1.00, 0.99, 0.97, 0.10)
    static var fallWhiteAlpha10: Color {
        Color(red: 1, green: 0.99, blue: 0.97, opacity: 0.1)
    }

    /// Color/White
    /// RGB: (1.00, 1.00, 1.00)
    static var white: Color {
        Color(red: 1, green: 1, blue: 1)
    }

    /// Color/White Alpha 05
    /// RGBA: (1.00, 1.00, 1.00, 0.05)
    static var whiteAlpha05: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.05)
    }

    /// Color/White Alpha 10
    /// RGBA: (1.00, 1.00, 1.00, 0.10)
    static var whiteAlpha10: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.1)
    }

    /// Color/White Alpha 15
    /// RGBA: (1.00, 1.00, 1.00, 0.15)
    static var whiteAlpha15: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.15)
    }

    /// Color/White Alpha 20
    /// RGBA: (1.00, 1.00, 1.00, 0.20)
    static var whiteAlpha20: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.2)
    }

    /// Color/White Alpha 30
    /// RGBA: (1.00, 1.00, 1.00, 0.30)
    static var whiteAlpha30: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.3)
    }

    /// Color/White Alpha 40
    /// RGBA: (1.00, 1.00, 1.00, 0.40)
    static var whiteAlpha40: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.4)
    }

    /// Color/White Alpha 50
    /// RGBA: (1.00, 1.00, 1.00, 0.50)
    static var whiteAlpha50: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.5)
    }

    /// Color/White Alpha 60
    /// RGBA: (1.00, 1.00, 1.00, 0.60)
    static var whiteAlpha60: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.6)
    }

    /// Color/White Alpha 80
    /// RGBA: (1.00, 1.00, 1.00, 0.80)
    static var whiteAlpha80: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.8)
    }

    /// Color/White Alpha 90
    /// RGBA: (1.00, 1.00, 1.00, 0.90)
    static var whiteAlpha90: Color {
        Color(red: 1, green: 1, blue: 1, opacity: 0.9)
    }


    // MARK: - Transparent Colors

    /// Color/Transparent
    /// RGBA: (0.00, 0.00, 0.00, 0.00)
    static var transparent: Color {
        Color(red: 0, green: 0, blue: 0, opacity: 0)
    }


    // MARK: - Blue Colors

    /// Color/Blue 00
    /// RGB: (0.00, 0.03, 0.09)
    static var blue00: Color {
        Color(red: 0, green: 0.03, blue: 0.09)
    }

    /// Color/Blue 05
    /// RGB: (0.00, 0.06, 0.17)
    static var blue05: Color {
        Color(red: 0, green: 0.06, blue: 0.17)
    }

    /// Color/Blue 10
    /// RGB: (0.00, 0.11, 0.24)
    static var blue10: Color {
        Color(red: 0, green: 0.11, blue: 0.24)
    }

    /// Color/Blue 100
    /// RGB: (0.96, 0.98, 1.00)
    static var blue100: Color {
        Color(red: 0.96, green: 0.98, blue: 1)
    }

    /// Color/Blue 15
    /// RGB: (0.00, 0.15, 0.30)
    static var blue15: Color {
        Color(red: 0, green: 0.15, blue: 0.3)
    }

    /// Color/Blue 20
    /// RGB: (0.00, 0.20, 0.39)
    static var blue20: Color {
        Color(red: 0, green: 0.2, blue: 0.39)
    }

    /// Color/Blue 25
    /// RGB: (0.02, 0.23, 0.45)
    static var blue25: Color {
        Color(red: 0.02, green: 0.23, blue: 0.45)
    }

    /// Color/Blue 30
    /// RGB: (0.00, 0.28, 0.55)
    static var blue30: Color {
        Color(red: 0, green: 0.28, blue: 0.55)
    }

    /// Color/Blue 35
    /// RGB: (0.00, 0.32, 0.63)
    static var blue35: Color {
        Color(red: 0, green: 0.32, blue: 0.63)
    }

    /// Color/Blue 40
    /// RGB: (0.00, 0.36, 0.72)
    static var blue40: Color {
        Color(red: 0, green: 0.36, blue: 0.72)
    }

    /// Color/Blue 45
    /// RGB: (0.00, 0.39, 0.82)
    static var blue45: Color {
        Color(red: 0, green: 0.39, blue: 0.82)
    }

    /// Color/Blue 50
    /// RGB: (0.03, 0.40, 1.00)
    static var blue50: Color {
        Color(red: 0.03, green: 0.4, blue: 1)
    }

    /// Color/Blue 50 Alpha 20
    /// RGBA: (0.03, 0.40, 1.00, 0.20)
    static var blue50Alpha20: Color {
        Color(red: 0.03, green: 0.4, blue: 1, opacity: 0.2)
    }

    /// Color/Blue 55
    /// RGB: (0.11, 0.52, 0.99)
    static var blue55: Color {
        Color(red: 0.11, green: 0.52, blue: 0.99)
    }

    /// Color/Blue 55 Alpha 10
    /// RGBA: (0.11, 0.52, 0.99, 0.10)
    static var blue55Alpha10: Color {
        Color(red: 0.11, green: 0.52, blue: 0.99, opacity: 0.1)
    }

    /// Color/Blue 55 Alpha 20
    /// RGBA: (0.11, 0.52, 0.99, 0.20)
    static var blue55Alpha20: Color {
        Color(red: 0.11, green: 0.52, blue: 0.99, opacity: 0.2)
    }

    /// Color/Blue 55 Alpha 45
    /// RGBA: (0.11, 0.52, 0.99, 0.45)
    static var blue55Alpha45: Color {
        Color(red: 0.11, green: 0.52, blue: 0.99, opacity: 0.45)
    }

    /// Color/Blue 60
    /// RGB: (0.24, 0.58, 0.97)
    static var blue60: Color {
        Color(red: 0.24, green: 0.58, blue: 0.97)
    }

    /// Color/Blue 65
    /// RGB: (0.29, 0.61, 1.00)
    static var blue65: Color {
        Color(red: 0.29, green: 0.61, blue: 1)
    }

    /// Color/Blue 70
    /// RGB: (0.35, 0.65, 1.00)
    static var blue70: Color {
        Color(red: 0.35, green: 0.65, blue: 1)
    }

    /// Color/Blue 75
    /// RGB: (0.46, 0.71, 1.00)
    static var blue75: Color {
        Color(red: 0.46, green: 0.71, blue: 1)
    }

    /// Color/Blue 80
    /// RGB: (0.68, 0.84, 1.00)
    static var blue80: Color {
        Color(red: 0.68, green: 0.84, blue: 1)
    }

    /// Color/Blue 85
    /// RGB: (0.82, 0.91, 1.00)
    static var blue85: Color {
        Color(red: 0.82, green: 0.91, blue: 1)
    }

    /// Color/Blue 90
    /// RGB: (0.87, 0.93, 1.00)
    static var blue90: Color {
        Color(red: 0.87, green: 0.93, blue: 1)
    }

    /// Color/Blue 95
    /// RGB: (0.92, 0.96, 1.00)
    static var blue95: Color {
        Color(red: 0.92, green: 0.96, blue: 1)
    }

    /// Color/Fall Blue 50
    /// RGB: (0.33, 0.47, 0.50)
    static var fallBlue50: Color {
        Color(red: 0.33, green: 0.47, blue: 0.5)
    }

    /// Color/Fall Blue 70
    /// RGB: (0.38, 0.69, 0.75)
    static var fallBlue70: Color {
        Color(red: 0.38, green: 0.69, blue: 0.75)
    }


    // MARK: - Gray Colors

    /// Color/Gray 00
    /// RGB: (0.03, 0.03, 0.04)
    static var gray00: Color {
        Color(red: 0.03, green: 0.03, blue: 0.04)
    }

    /// Color/Gray 00 Alpha 16
    /// RGBA: (0.03, 0.03, 0.04, 0.16)
    static var gray00Alpha16: Color {
        Color(red: 0.03, green: 0.03, blue: 0.04, opacity: 0.16)
    }

    /// Color/Gray 05
    /// RGB: (0.06, 0.06, 0.07)
    static var gray05: Color {
        Color(red: 0.06, green: 0.06, blue: 0.07)
    }

    /// Color/Gray 05 Alpha 60
    /// RGBA: (0.06, 0.06, 0.07, 0.60)
    static var gray05Alpha60: Color {
        Color(red: 0.06, green: 0.06, blue: 0.07, opacity: 0.6)
    }

    /// Color/Gray 05 Alpha 70
    /// RGBA: (0.06, 0.06, 0.07, 0.70)
    static var gray05Alpha70: Color {
        Color(red: 0.06, green: 0.06, blue: 0.07, opacity: 0.7)
    }

    /// Color/Gray 10
    /// RGB: (0.11, 0.11, 0.11)
    static var gray10: Color {
        Color(red: 0.11, green: 0.11, blue: 0.11)
    }

    /// Color/Gray 10 Alpha 60
    /// RGBA: (0.11, 0.11, 0.11, 0.60)
    static var gray10Alpha60: Color {
        Color(red: 0.11, green: 0.11, blue: 0.11, opacity: 0.6)
    }

    /// Color/Gray 10 Alpha 80
    /// RGBA: (0.11, 0.11, 0.11, 0.80)
    static var gray10Alpha80: Color {
        Color(red: 0.11, green: 0.11, blue: 0.11, opacity: 0.8)
    }

    /// Color/Gray 10 Alpha 85
    /// RGBA: (0.11, 0.11, 0.11, 0.85)
    static var gray10Alpha85: Color {
        Color(red: 0.11, green: 0.11, blue: 0.11, opacity: 0.85)
    }

    /// Color/Gray 100
    /// RGB: (0.97, 0.98, 0.98)
    static var gray100: Color {
        Color(red: 0.97, green: 0.98, blue: 0.98)
    }

    /// Color/Gray 15
    /// RGB: (0.15, 0.15, 0.16)
    static var gray15: Color {
        Color(red: 0.15, green: 0.15, blue: 0.16)
    }

    /// Color/Gray 15 Alpha 60
    /// RGBA: (0.15, 0.15, 0.16, 0.60)
    static var gray15Alpha60: Color {
        Color(red: 0.15, green: 0.15, blue: 0.16, opacity: 0.6)
    }

    /// Color/Gray 20
    /// RGB: (0.20, 0.20, 0.20)
    static var gray20: Color {
        Color(red: 0.2, green: 0.2, blue: 0.2)
    }

    /// Color/Gray 20 Alpha 60
    /// RGBA: (0.20, 0.20, 0.20, 0.60)
    static var gray20Alpha60: Color {
        Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.6)
    }

    /// Color/Gray 20 Alpha 67
    /// RGBA: (0.20, 0.20, 0.20, 0.67)
    static var gray20Alpha67: Color {
        Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.67)
    }

    /// Color/Gray 25
    /// RGB: (0.23, 0.24, 0.24)
    static var gray25: Color {
        Color(red: 0.23, green: 0.24, blue: 0.24)
    }

    /// Color/Gray 30
    /// RGB: (0.27, 0.28, 0.29)
    static var gray30: Color {
        Color(red: 0.27, green: 0.28, blue: 0.29)
    }

    /// Color/Gray 30 Alpha 15
    /// RGBA: (0.27, 0.28, 0.29, 0.15)
    static var gray30Alpha15: Color {
        Color(red: 0.27, green: 0.28, blue: 0.29, opacity: 0.15)
    }

    /// Color/Gray 30 Alpha 35
    /// RGBA: (0.27, 0.28, 0.29, 0.35)
    static var gray30Alpha35: Color {
        Color(red: 0.27, green: 0.28, blue: 0.29, opacity: 0.35)
    }

    /// Color/Gray 35
    /// RGB: (0.31, 0.32, 0.33)
    static var gray35: Color {
        Color(red: 0.31, green: 0.32, blue: 0.33)
    }

    /// Color/Gray 40
    /// RGB: (0.36, 0.37, 0.38)
    static var gray40: Color {
        Color(red: 0.36, green: 0.37, blue: 0.38)
    }

    /// Color/Gray 45
    /// RGB: (0.40, 0.41, 0.42)
    static var gray45: Color {
        Color(red: 0.4, green: 0.41, blue: 0.42)
    }

    /// Color/Gray 45 Alpha 04
    /// RGBA: (0.40, 0.41, 0.42, 0.04)
    static var gray45Alpha04: Color {
        Color(red: 0.4, green: 0.41, blue: 0.42, opacity: 0.04)
    }

    /// Color/Gray 45 Alpha 07
    /// RGBA: (0.40, 0.41, 0.42, 0.07)
    static var gray45Alpha07: Color {
        Color(red: 0.4, green: 0.41, blue: 0.42, opacity: 0.07)
    }

    /// Color/Gray 45 Alpha 10
    /// RGBA: (0.40, 0.41, 0.42, 0.10)
    static var gray45Alpha10: Color {
        Color(red: 0.4, green: 0.41, blue: 0.42, opacity: 0.1)
    }

    /// Color/Gray 45 Alpha 14
    /// RGBA: (0.40, 0.41, 0.42, 0.14)
    static var gray45Alpha14: Color {
        Color(red: 0.4, green: 0.41, blue: 0.42, opacity: 0.14)
    }

    /// Color/Gray 45 Alpha 17
    /// RGBA: (0.40, 0.41, 0.42, 0.17)
    static var gray45Alpha17: Color {
        Color(red: 0.4, green: 0.41, blue: 0.42, opacity: 0.17)
    }

    /// Color/Gray 50
    /// RGB: (0.44, 0.45, 0.46)
    static var gray50: Color {
        Color(red: 0.44, green: 0.45, blue: 0.46)
    }

    /// Color/Gray 50 Alpha 20
    /// RGBA: (0.44, 0.45, 0.46, 0.20)
    static var gray50Alpha20: Color {
        Color(red: 0.44, green: 0.45, blue: 0.46, opacity: 0.2)
    }

    /// Color/Gray 55
    /// RGB: (0.52, 0.53, 0.55)
    static var gray55: Color {
        Color(red: 0.52, green: 0.53, blue: 0.55)
    }

    /// Color/Gray 60
    /// RGB: (0.56, 0.57, 0.59)
    static var gray60: Color {
        Color(red: 0.56, green: 0.57, blue: 0.59)
    }

    /// Color/Gray 65
    /// RGB: (0.59, 0.60, 0.62)
    static var gray65: Color {
        Color(red: 0.59, green: 0.6, blue: 0.62)
    }

    /// Color/Gray 70
    /// RGB: (0.63, 0.64, 0.66)
    static var gray70: Color {
        Color(red: 0.63, green: 0.64, blue: 0.66)
    }

    /// Color/Gray 75
    /// RGB: (0.69, 0.70, 0.72)
    static var gray75: Color {
        Color(red: 0.69, green: 0.7, blue: 0.72)
    }

    /// Color/Gray 75 Alpha 20
    /// RGBA: (0.69, 0.70, 0.72, 0.20)
    static var gray75Alpha20: Color {
        Color(red: 0.69, green: 0.7, blue: 0.72, opacity: 0.2)
    }

    /// Color/Gray 80
    /// RGB: (0.82, 0.83, 0.84)
    static var gray80: Color {
        Color(red: 0.82, green: 0.83, blue: 0.84)
    }

    /// Color/Gray 80 Alpha 15
    /// RGBA: (0.82, 0.83, 0.84, 0.15)
    static var gray80Alpha15: Color {
        Color(red: 0.82, green: 0.83, blue: 0.84, opacity: 0.15)
    }

    /// Color/Gray 85
    /// RGB: (0.89, 0.90, 0.91)
    static var gray85: Color {
        Color(red: 0.89, green: 0.9, blue: 0.91)
    }

    /// Color/Gray 90
    /// RGB: (0.91, 0.92, 0.93)
    static var gray90: Color {
        Color(red: 0.91, green: 0.92, blue: 0.93)
    }

    /// Color/Gray 95
    /// RGB: (0.95, 0.96, 0.97)
    static var gray95: Color {
        Color(red: 0.95, green: 0.96, blue: 0.97)
    }

    /// Color/Gray 95 Alpha 40
    /// RGBA: (0.95, 0.96, 0.97, 0.40)
    static var gray95Alpha40: Color {
        Color(red: 0.95, green: 0.96, blue: 0.97, opacity: 0.4)
    }

    /// Color/Gray 95 Alpha 60
    /// RGBA: (0.95, 0.96, 0.97, 0.60)
    static var gray95Alpha60: Color {
        Color(red: 0.95, green: 0.96, blue: 0.97, opacity: 0.6)
    }


    // MARK: - Cyan Colors

    /// Color/Cyan 00
    /// RGB: (0.02, 0.03, 0.05)
    static var cyan00: Color {
        Color(red: 0.02, green: 0.03, blue: 0.05)
    }

    /// Color/Cyan 05
    /// RGB: (0.04, 0.06, 0.09)
    static var cyan05: Color {
        Color(red: 0.04, green: 0.06, blue: 0.09)
    }

    /// Color/Cyan 10
    /// RGB: (0.07, 0.11, 0.16)
    static var cyan10: Color {
        Color(red: 0.07, green: 0.11, blue: 0.16)
    }

    /// Color/Cyan 100
    /// RGB: (0.95, 0.98, 1.00)
    static var cyan100: Color {
        Color(red: 0.95, green: 0.98, blue: 1)
    }

    /// Color/Cyan 15
    /// RGB: (0.07, 0.16, 0.22)
    static var cyan15: Color {
        Color(red: 0.07, green: 0.16, blue: 0.22)
    }

    /// Color/Cyan 20
    /// RGB: (0.07, 0.21, 0.31)
    static var cyan20: Color {
        Color(red: 0.07, green: 0.21, blue: 0.31)
    }

    /// Color/Cyan 25
    /// RGB: (0.06, 0.25, 0.36)
    static var cyan25: Color {
        Color(red: 0.06, green: 0.25, blue: 0.36)
    }

    /// Color/Cyan 30
    /// RGB: (0.03, 0.30, 0.45)
    static var cyan30: Color {
        Color(red: 0.03, green: 0.3, blue: 0.45)
    }

    /// Color/Cyan 35
    /// RGB: (0.00, 0.34, 0.51)
    static var cyan35: Color {
        Color(red: 0, green: 0.34, blue: 0.51)
    }

    /// Color/Cyan 40
    /// RGB: (0.00, 0.39, 0.58)
    static var cyan40: Color {
        Color(red: 0, green: 0.39, blue: 0.58)
    }

    /// Color/Cyan 45
    /// RGB: (0.00, 0.43, 0.64)
    static var cyan45: Color {
        Color(red: 0, green: 0.43, blue: 0.64)
    }

    /// Color/Cyan 50
    /// RGB: (0.00, 0.47, 0.71)
    static var cyan50: Color {
        Color(red: 0, green: 0.47, blue: 0.71)
    }

    /// Color/Cyan 55
    /// RGB: (0.00, 0.56, 0.84)
    static var cyan55: Color {
        Color(red: 0, green: 0.56, blue: 0.84)
    }

    /// Color/Cyan 60
    /// RGB: (0.00, 0.60, 0.90)
    static var cyan60: Color {
        Color(red: 0, green: 0.6, blue: 0.9)
    }

    /// Color/Cyan 65
    /// RGB: (0.00, 0.64, 0.95)
    static var cyan65: Color {
        Color(red: 0, green: 0.64, blue: 0.95)
    }

    /// Color/Cyan 70
    /// RGB: (0.01, 0.68, 0.99)
    static var cyan70: Color {
        Color(red: 0.01, green: 0.68, blue: 0.99)
    }

    /// Color/Cyan 75
    /// RGB: (0.26, 0.74, 1.00)
    static var cyan75: Color {
        Color(red: 0.26, green: 0.74, blue: 1)
    }

    /// Color/Cyan 80
    /// RGB: (0.61, 0.86, 1.00)
    static var cyan80: Color {
        Color(red: 0.61, green: 0.86, blue: 1)
    }

    /// Color/Cyan 85
    /// RGB: (0.79, 0.92, 1.00)
    static var cyan85: Color {
        Color(red: 0.79, green: 0.92, blue: 1)
    }

    /// Color/Cyan 90
    /// RGB: (0.83, 0.93, 1.00)
    static var cyan90: Color {
        Color(red: 0.83, green: 0.93, blue: 1)
    }

    /// Color/Cyan 95
    /// RGB: (0.91, 0.96, 1.00)
    static var cyan95: Color {
        Color(red: 0.91, green: 0.96, blue: 1)
    }


    // MARK: - Green Colors

    /// Color/Green
    /// RGB: (0.02, 0.04, 0.02)
    static var green: Color {
        Color(red: 0.02, green: 0.04, blue: 0.02)
    }

    /// Color/Green 05
    /// RGB: (0.04, 0.07, 0.03)
    static var green05: Color {
        Color(red: 0.04, green: 0.07, blue: 0.03)
    }

    /// Color/Green 10
    /// RGB: (0.07, 0.12, 0.06)
    static var green10: Color {
        Color(red: 0.07, green: 0.12, blue: 0.06)
    }

    /// Color/Green 100
    /// RGB: (0.95, 0.99, 0.94)
    static var green100: Color {
        Color(red: 0.95, green: 0.99, blue: 0.94)
    }

    /// Color/Green 15
    /// RGB: (0.08, 0.17, 0.08)
    static var green15: Color {
        Color(red: 0.08, green: 0.17, blue: 0.08)
    }

    /// Color/Green 20
    /// RGB: (0.10, 0.23, 0.09)
    static var green20: Color {
        Color(red: 0.1, green: 0.23, blue: 0.09)
    }

    /// Color/Green 25
    /// RGB: (0.10, 0.27, 0.11)
    static var green25: Color {
        Color(red: 0.1, green: 0.27, blue: 0.11)
    }

    /// Color/Green 30
    /// RGB: (0.11, 0.33, 0.12)
    static var green30: Color {
        Color(red: 0.11, green: 0.33, blue: 0.12)
    }

    /// Color/Green 35
    /// RGB: (0.12, 0.37, 0.13)
    static var green35: Color {
        Color(red: 0.12, green: 0.37, blue: 0.13)
    }

    /// Color/Green 40
    /// RGB: (0.13, 0.42, 0.15)
    static var green40: Color {
        Color(red: 0.13, green: 0.42, blue: 0.15)
    }

    /// Color/Green 45
    /// RGB: (0.13, 0.47, 0.16)
    static var green45: Color {
        Color(red: 0.13, green: 0.47, blue: 0.16)
    }

    /// Color/Green 50
    /// RGB: (0.14, 0.51, 0.17)
    static var green50: Color {
        Color(red: 0.14, green: 0.51, blue: 0.17)
    }

    /// Color/Green 55
    /// RGB: (0.17, 0.60, 0.21)
    static var green55: Color {
        Color(red: 0.17, green: 0.6, blue: 0.21)
    }

    /// Color/Green 60
    /// RGB: (0.19, 0.65, 0.23)
    static var green60: Color {
        Color(red: 0.19, green: 0.65, blue: 0.23)
    }

    /// Color/Green 65
    /// RGB: (0.21, 0.69, 0.25)
    static var green65: Color {
        Color(red: 0.21, green: 0.69, blue: 0.25)
    }

    /// Color/Green 70
    /// RGB: (0.25, 0.73, 0.27)
    static var green70: Color {
        Color(red: 0.25, green: 0.73, blue: 0.27)
    }

    /// Color/Green 75
    /// RGB: (0.32, 0.79, 0.33)
    static var green75: Color {
        Color(red: 0.32, green: 0.79, blue: 0.33)
    }

    /// Color/Green 80
    /// RGB: (0.56, 0.91, 0.54)
    static var green80: Color {
        Color(red: 0.56, green: 0.91, blue: 0.54)
    }

    /// Color/Green 85
    /// RGB: (0.75, 0.95, 0.72)
    static var green85: Color {
        Color(red: 0.75, green: 0.95, blue: 0.72)
    }

    /// Color/Green 90
    /// RGB: (0.79, 0.96, 0.77)
    static var green90: Color {
        Color(red: 0.79, green: 0.96, blue: 0.77)
    }

    /// Color/Green 95
    /// RGB: (0.89, 0.98, 0.88)
    static var green95: Color {
        Color(red: 0.89, green: 0.98, blue: 0.88)
    }

    /// Color/WhatsApp Light Green
    /// RGB: (0.15, 0.83, 0.40)
    static var whatsappLightGreen: Color {
        Color(red: 0.15, green: 0.83, blue: 0.4)
    }


    // MARK: - Orange Colors

    /// Color/Orange 00
    /// RGB: (0.05, 0.03, 0.01)
    static var orange00: Color {
        Color(red: 0.05, green: 0.03, blue: 0.01)
    }

    /// Color/Orange 05
    /// RGB: (0.09, 0.05, 0.02)
    static var orange05: Color {
        Color(red: 0.09, green: 0.05, blue: 0.02)
    }

    /// Color/Orange 10
    /// RGB: (0.16, 0.09, 0.04)
    static var orange10: Color {
        Color(red: 0.16, green: 0.09, blue: 0.04)
    }

    /// Color/Orange 100
    /// RGB: (1.00, 0.97, 0.95)
    static var orange100: Color {
        Color(red: 1, green: 0.97, blue: 0.95)
    }

    /// Color/Orange 15
    /// RGB: (0.23, 0.13, 0.05)
    static var orange15: Color {
        Color(red: 0.23, green: 0.13, blue: 0.05)
    }

    /// Color/Orange 20
    /// RGB: (0.31, 0.16, 0.05)
    static var orange20: Color {
        Color(red: 0.31, green: 0.16, blue: 0.05)
    }

    /// Color/Orange 25
    /// RGB: (0.36, 0.19, 0.05)
    static var orange25: Color {
        Color(red: 0.36, green: 0.19, blue: 0.05)
    }

    /// Color/Orange 30
    /// RGB: (0.44, 0.23, 0.05)
    static var orange30: Color {
        Color(red: 0.44, green: 0.23, blue: 0.05)
    }

    /// Color/Orange 35
    /// RGB: (0.50, 0.26, 0.05)
    static var orange35: Color {
        Color(red: 0.5, green: 0.26, blue: 0.05)
    }

    /// Color/Orange 40
    /// RGB: (0.57, 0.29, 0.05)
    static var orange40: Color {
        Color(red: 0.57, green: 0.29, blue: 0.05)
    }

    /// Color/Orange 45
    /// RGB: (0.63, 0.33, 0.05)
    static var orange45: Color {
        Color(red: 0.63, green: 0.33, blue: 0.05)
    }

    /// Color/Orange 50
    /// RGB: (0.69, 0.36, 0.06)
    static var orange50: Color {
        Color(red: 0.69, green: 0.36, blue: 0.06)
    }

    /// Color/Orange 55
    /// RGB: (0.82, 0.42, 0.08)
    static var orange55: Color {
        Color(red: 0.82, green: 0.42, blue: 0.08)
    }

    /// Color/Orange 60
    /// RGB: (0.88, 0.46, 0.10)
    static var orange60: Color {
        Color(red: 0.88, green: 0.46, blue: 0.1)
    }

    /// Color/Orange 66
    /// RGB: (0.92, 0.49, 0.13)
    static var orange66: Color {
        Color(red: 0.92, green: 0.49, blue: 0.13)
    }

    /// Color/Orange 70
    /// RGB: (0.96, 0.53, 0.16)
    static var orange70: Color {
        Color(red: 0.96, green: 0.53, blue: 0.16)
    }

    /// Color/Orange 75
    /// RGB: (1.00, 0.60, 0.26)
    static var orange75: Color {
        Color(red: 1, green: 0.6, blue: 0.26)
    }

    /// Color/Orange 80
    /// RGB: (1.00, 0.78, 0.57)
    static var orange80: Color {
        Color(red: 1, green: 0.78, blue: 0.57)
    }

    /// Color/Orange 85
    /// RGB: (1.00, 0.88, 0.76)
    static var orange85: Color {
        Color(red: 1, green: 0.88, blue: 0.76)
    }

    /// Color/Orange 90
    /// RGB: (1.00, 0.90, 0.80)
    static var orange90: Color {
        Color(red: 1, green: 0.9, blue: 0.8)
    }

    /// Color/Orange 95
    /// RGB: (1.00, 0.95, 0.89)
    static var orange95: Color {
        Color(red: 1, green: 0.95, blue: 0.89)
    }

    /// Color/Orange Red 00
    /// RGB: (0.06, 0.02, 0.02)
    static var orangeRed00: Color {
        Color(red: 0.06, green: 0.02, blue: 0.02)
    }

    /// Color/Orange Red 05
    /// RGB: (0.11, 0.05, 0.03)
    static var orangeRed05: Color {
        Color(red: 0.11, green: 0.05, blue: 0.03)
    }

    /// Color/Orange Red 10
    /// RGB: (0.19, 0.08, 0.05)
    static var orangeRed10: Color {
        Color(red: 0.19, green: 0.08, blue: 0.05)
    }

    /// Color/Orange Red 100
    /// RGB: (1.00, 0.97, 0.96)
    static var orangeRed100: Color {
        Color(red: 1, green: 0.97, blue: 0.96)
    }

    /// Color/Orange Red 15
    /// RGB: (0.27, 0.10, 0.07)
    static var orangeRed15: Color {
        Color(red: 0.27, green: 0.1, blue: 0.07)
    }

    /// Color/Orange Red 20
    /// RGB: (0.36, 0.12, 0.08)
    static var orangeRed20: Color {
        Color(red: 0.36, green: 0.12, blue: 0.08)
    }

    /// Color/Orange Red 25
    /// RGB: (0.43, 0.13, 0.09)
    static var orangeRed25: Color {
        Color(red: 0.43, green: 0.13, blue: 0.09)
    }

    /// Color/Orange Red 30
    /// RGB: (0.52, 0.15, 0.11)
    static var orangeRed30: Color {
        Color(red: 0.52, green: 0.15, blue: 0.11)
    }

    /// Color/Orange Red 35
    /// RGB: (0.59, 0.17, 0.12)
    static var orangeRed35: Color {
        Color(red: 0.59, green: 0.17, blue: 0.12)
    }

    /// Color/Orange Red 40
    /// RGB: (0.67, 0.19, 0.13)
    static var orangeRed40: Color {
        Color(red: 0.67, green: 0.19, blue: 0.13)
    }

    /// Color/Orange Red 45
    /// RGB: (0.75, 0.21, 0.15)
    static var orangeRed45: Color {
        Color(red: 0.75, green: 0.21, blue: 0.15)
    }

    /// Color/Orange Red 50
    /// RGB: (0.81, 0.24, 0.17)
    static var orangeRed50: Color {
        Color(red: 0.81, green: 0.24, blue: 0.17)
    }

    /// Color/Orange Red 55
    /// RGB: (0.94, 0.31, 0.22)
    static var orangeRed55: Color {
        Color(red: 0.94, green: 0.31, blue: 0.22)
    }

    /// Color/Orange Red 60
    /// RGB: (0.99, 0.36, 0.26)
    static var orangeRed60: Color {
        Color(red: 0.99, green: 0.36, blue: 0.26)
    }

    /// Color/Orange Red 65
    /// RGB: (1.00, 0.42, 0.32)
    static var orangeRed65: Color {
        Color(red: 1, green: 0.42, blue: 0.32)
    }

    /// Color/Orange Red 70
    /// RGB: (1.00, 0.49, 0.39)
    static var orangeRed70: Color {
        Color(red: 1, green: 0.49, blue: 0.39)
    }

    /// Color/Orange Red 75
    /// RGB: (1.00, 0.59, 0.49)
    static var orangeRed75: Color {
        Color(red: 1, green: 0.59, blue: 0.49)
    }

    /// Color/Orange Red 80
    /// RGB: (1.00, 0.77, 0.70)
    static var orangeRed80: Color {
        Color(red: 1, green: 0.77, blue: 0.7)
    }

    /// Color/Orange Red 85
    /// RGB: (1.00, 0.87, 0.83)
    static var orangeRed85: Color {
        Color(red: 1, green: 0.87, blue: 0.83)
    }

    /// Color/Orange Red 90
    /// RGB: (1.00, 0.89, 0.86)
    static var orangeRed90: Color {
        Color(red: 1, green: 0.89, blue: 0.86)
    }

    /// Color/Orange Red 95
    /// RGB: (1.00, 0.95, 0.93)
    static var orangeRed95: Color {
        Color(red: 1, green: 0.95, blue: 0.93)
    }


    // MARK: - Pink Colors

    /// Color/Fall Pink 50
    /// RGB: (0.77, 0.21, 0.67)
    static var fallPink50: Color {
        Color(red: 0.77, green: 0.21, blue: 0.67)
    }

    /// Color/Fall Pink 70
    /// RGB: (0.93, 0.49, 0.82)
    static var fallPink70: Color {
        Color(red: 0.93, green: 0.49, blue: 0.82)
    }

    /// Color/Pink 00
    /// RGB: (0.05, 0.02, 0.04)
    static var pink00: Color {
        Color(red: 0.05, green: 0.02, blue: 0.04)
    }

    /// Color/Pink 05
    /// RGB: (0.09, 0.05, 0.07)
    static var pink05: Color {
        Color(red: 0.09, green: 0.05, blue: 0.07)
    }

    /// Color/Pink 10
    /// RGB: (0.16, 0.09, 0.13)
    static var pink10: Color {
        Color(red: 0.16, green: 0.09, blue: 0.13)
    }

    /// Color/Pink 100
    /// RGB: (1.00, 0.97, 0.99)
    static var pink100: Color {
        Color(red: 1, green: 0.97, blue: 0.99)
    }

    /// Color/Pink 15
    /// RGB: (0.24, 0.11, 0.18)
    static var pink15: Color {
        Color(red: 0.24, green: 0.11, blue: 0.18)
    }

    /// Color/Pink 20
    /// RGB: (0.33, 0.13, 0.24)
    static var pink20: Color {
        Color(red: 0.33, green: 0.13, blue: 0.24)
    }

    /// Color/Pink 25
    /// RGB: (0.38, 0.15, 0.29)
    static var pink25: Color {
        Color(red: 0.38, green: 0.15, blue: 0.29)
    }

    /// Color/Pink 30
    /// RGB: (0.47, 0.18, 0.35)
    static var pink30: Color {
        Color(red: 0.47, green: 0.18, blue: 0.35)
    }

    /// Color/Pink 35
    /// RGB: (0.54, 0.19, 0.40)
    static var pink35: Color {
        Color(red: 0.54, green: 0.19, blue: 0.4)
    }

    /// Color/Pink 40
    /// RGB: (0.62, 0.22, 0.45)
    static var pink40: Color {
        Color(red: 0.62, green: 0.22, blue: 0.45)
    }

    /// Color/Pink 45
    /// RGB: (0.68, 0.24, 0.50)
    static var pink45: Color {
        Color(red: 0.68, green: 0.24, blue: 0.5)
    }

    /// Color/Pink 50
    /// RGB: (0.75, 0.31, 0.55)
    static var pink50: Color {
        Color(red: 0.75, green: 0.31, blue: 0.55)
    }

    /// Color/Pink 55
    /// RGB: (0.87, 0.32, 0.64)
    static var pink55: Color {
        Color(red: 0.87, green: 0.32, blue: 0.64)
    }

    /// Color/Pink 60
    /// RGB: (0.94, 0.35, 0.69)
    static var pink60: Color {
        Color(red: 0.94, green: 0.35, blue: 0.69)
    }

    /// Color/Pink 65
    /// RGB: (0.98, 0.38, 0.73)
    static var pink65: Color {
        Color(red: 0.98, green: 0.38, blue: 0.73)
    }

    /// Color/Pink 70
    /// RGB: (1.00, 0.44, 0.78)
    static var pink70: Color {
        Color(red: 1, green: 0.44, blue: 0.78)
    }

    /// Color/Pink 75
    /// RGB: (1.00, 0.55, 0.85)
    static var pink75: Color {
        Color(red: 1, green: 0.55, blue: 0.85)
    }

    /// Color/Pink 80
    /// RGB: (1.00, 0.75, 0.93)
    static var pink80: Color {
        Color(red: 1, green: 0.75, blue: 0.93)
    }

    /// Color/Pink 85
    /// RGB: (1.00, 0.86, 0.96)
    static var pink85: Color {
        Color(red: 1, green: 0.86, blue: 0.96)
    }

    /// Color/Pink 90
    /// RGB: (1.00, 0.89, 0.96)
    static var pink90: Color {
        Color(red: 1, green: 0.89, blue: 0.96)
    }

    /// Color/Pink 95
    /// RGB: (1.00, 0.93, 0.98)
    static var pink95: Color {
        Color(red: 1, green: 0.93, blue: 0.98)
    }


    // MARK: - Purple Colors

    /// Color/Purple 00
    /// RGB: (0.04, 0.03, 0.06)
    static var purple00: Color {
        Color(red: 0.04, green: 0.03, blue: 0.06)
    }

    /// Color/Purple 05
    /// RGB: (0.07, 0.05, 0.10)
    static var purple05: Color {
        Color(red: 0.07, green: 0.05, blue: 0.1)
    }

    /// Color/Purple 10
    /// RGB: (0.11, 0.10, 0.20)
    static var purple10: Color {
        Color(red: 0.11, green: 0.1, blue: 0.2)
    }

    /// Color/Purple 100
    /// RGB: (0.98, 0.97, 1.00)
    static var purple100: Color {
        Color(red: 0.98, green: 0.97, blue: 1)
    }

    /// Color/Purple 15
    /// RGB: (0.15, 0.13, 0.29)
    static var purple15: Color {
        Color(red: 0.15, green: 0.13, blue: 0.29)
    }

    /// Color/Purple 20
    /// RGB: (0.19, 0.17, 0.40)
    static var purple20: Color {
        Color(red: 0.19, green: 0.17, blue: 0.4)
    }

    /// Color/Purple 25
    /// RGB: (0.22, 0.20, 0.47)
    static var purple25: Color {
        Color(red: 0.22, green: 0.2, blue: 0.47)
    }

    /// Color/Purple 30
    /// RGB: (0.25, 0.24, 0.58)
    static var purple30: Color {
        Color(red: 0.25, green: 0.24, blue: 0.58)
    }

    /// Color/Purple 35
    /// RGB: (0.29, 0.27, 0.66)
    static var purple35: Color {
        Color(red: 0.29, green: 0.27, blue: 0.66)
    }

    /// Color/Purple 40
    /// RGB: (0.33, 0.31, 0.75)
    static var purple40: Color {
        Color(red: 0.33, green: 0.31, blue: 0.75)
    }

    /// Color/Purple 45
    /// RGB: (0.36, 0.34, 0.82)
    static var purple45: Color {
        Color(red: 0.36, green: 0.34, blue: 0.82)
    }

    /// Color/Purple 50
    /// RGB: (0.40, 0.38, 0.89)
    static var purple50: Color {
        Color(red: 0.4, green: 0.38, blue: 0.89)
    }

    /// Color/Purple 55
    /// RGB: (0.49, 0.45, 1.00)
    static var purple55: Color {
        Color(red: 0.49, green: 0.45, blue: 1)
    }

    /// Color/Purple 60
    /// RGB: (0.56, 0.51, 1.00)
    static var purple60: Color {
        Color(red: 0.56, green: 0.51, blue: 1)
    }

    /// Color/Purple 65
    /// RGB: (0.60, 0.55, 1.00)
    static var purple65: Color {
        Color(red: 0.6, green: 0.55, blue: 1)
    }

    /// Color/Purple 70
    /// RGB: (0.65, 0.59, 1.00)
    static var purple70: Color {
        Color(red: 0.65, green: 0.59, blue: 1)
    }

    /// Color/Purple 75
    /// RGB: (0.72, 0.65, 1.00)
    static var purple75: Color {
        Color(red: 0.72, green: 0.65, blue: 1)
    }

    /// Color/Purple 80
    /// RGB: (0.85, 0.80, 1.00)
    static var purple80: Color {
        Color(red: 0.85, green: 0.8, blue: 1)
    }

    /// Color/Purple 85
    /// RGB: (0.92, 0.89, 1.00)
    static var purple85: Color {
        Color(red: 0.92, green: 0.89, blue: 1)
    }

    /// Color/Purple 90
    /// RGB: (0.93, 0.90, 1.00)
    static var purple90: Color {
        Color(red: 0.93, green: 0.9, blue: 1)
    }

    /// Color/Purple 95
    /// RGB: (0.96, 0.95, 1.00)
    static var purple95: Color {
        Color(red: 0.96, green: 0.95, blue: 1)
    }


    // MARK: - Red Colors

    /// Color/Red 00
    /// RGB: (0.07, 0.02, 0.02)
    static var red00: Color {
        Color(red: 0.07, green: 0.02, blue: 0.02)
    }

    /// Color/Red 05
    /// RGB: (0.11, 0.04, 0.03)
    static var red05: Color {
        Color(red: 0.11, green: 0.04, blue: 0.03)
    }

    /// Color/Red 10
    /// RGB: (0.20, 0.07, 0.06)
    static var red10: Color {
        Color(red: 0.2, green: 0.07, blue: 0.06)
    }

    /// Color/Red 100
    /// RGB: (1.00, 0.97, 0.96)
    static var red100: Color {
        Color(red: 1, green: 0.97, blue: 0.96)
    }

    /// Color/Red 15
    /// RGB: (0.29, 0.08, 0.07)
    static var red15: Color {
        Color(red: 0.29, green: 0.08, blue: 0.07)
    }

    /// Color/Red 20
    /// RGB: (0.39, 0.09, 0.09)
    static var red20: Color {
        Color(red: 0.39, green: 0.09, blue: 0.09)
    }

    /// Color/Red 25
    /// RGB: (0.46, 0.09, 0.11)
    static var red25: Color {
        Color(red: 0.46, green: 0.09, blue: 0.11)
    }

    /// Color/Red 30
    /// RGB: (0.56, 0.09, 0.12)
    static var red30: Color {
        Color(red: 0.56, green: 0.09, blue: 0.12)
    }

    /// Color/Red 35
    /// RGB: (0.64, 0.09, 0.14)
    static var red35: Color {
        Color(red: 0.64, green: 0.09, blue: 0.14)
    }

    /// Color/Red 40
    /// RGB: (0.73, 0.09, 0.16)
    static var red40: Color {
        Color(red: 0.73, green: 0.09, blue: 0.16)
    }

    /// Color/Red 40 Alpha 20
    /// RGBA: (0.73, 0.09, 0.16, 0.20)
    static var red40Alpha20: Color {
        Color(red: 0.73, green: 0.09, blue: 0.16, opacity: 0.2)
    }

    /// Color/Red 45
    /// RGB: (0.80, 0.11, 0.18)
    static var red45: Color {
        Color(red: 0.8, green: 0.11, blue: 0.18)
    }

    /// Color/Red 50
    /// RGB: (0.87, 0.14, 0.20)
    static var red50: Color {
        Color(red: 0.87, green: 0.14, blue: 0.2)
    }

    /// Color/Red 55
    /// RGB: (0.98, 0.24, 0.27)
    static var red55: Color {
        Color(red: 0.98, green: 0.24, blue: 0.27)
    }

    /// Color/Red 60
    /// RGB: (1.00, 0.34, 0.34)
    static var red60: Color {
        Color(red: 1, green: 0.34, blue: 0.34)
    }

    /// Color/Red 65
    /// RGB: (1.00, 0.42, 0.40)
    static var red65: Color {
        Color(red: 1, green: 0.42, blue: 0.4)
    }

    /// Color/Red 70
    /// RGB: (1.00, 0.49, 0.45)
    static var red70: Color {
        Color(red: 1, green: 0.49, blue: 0.45)
    }

    /// Color/Red 75
    /// RGB: (1.00, 0.59, 0.55)
    static var red75: Color {
        Color(red: 1, green: 0.59, blue: 0.55)
    }

    /// Color/Red 80
    /// RGB: (1.00, 0.77, 0.74)
    static var red80: Color {
        Color(red: 1, green: 0.77, blue: 0.74)
    }

    /// Color/Red 85
    /// RGB: (1.00, 0.87, 0.85)
    static var red85: Color {
        Color(red: 1, green: 0.87, blue: 0.85)
    }

    /// Color/Red 90
    /// RGB: (1.00, 0.89, 0.87)
    static var red90: Color {
        Color(red: 1, green: 0.89, blue: 0.87)
    }

    /// Color/Red 95
    /// RGB: (1.00, 0.95, 0.94)
    static var red95: Color {
        Color(red: 1, green: 0.95, blue: 0.94)
    }


    // MARK: - Yellow Colors

    /// Color/Yellow 00
    /// RGB: (0.04, 0.03, 0.01)
    static var yellow00: Color {
        Color(red: 0.04, green: 0.03, blue: 0.01)
    }

    /// Color/Yellow 05
    /// RGB: (0.08, 0.06, 0.02)
    static var yellow05: Color {
        Color(red: 0.08, green: 0.06, blue: 0.02)
    }

    /// Color/Yellow 10
    /// RGB: (0.13, 0.11, 0.04)
    static var yellow10: Color {
        Color(red: 0.13, green: 0.11, blue: 0.04)
    }

    /// Color/Yellow 100
    /// RGB: (1.00, 0.98, 0.83)
    static var yellow100: Color {
        Color(red: 1, green: 0.98, blue: 0.83)
    }

    /// Color/Yellow 15
    /// RGB: (0.18, 0.15, 0.05)
    static var yellow15: Color {
        Color(red: 0.18, green: 0.15, blue: 0.05)
    }

    /// Color/Yellow 20
    /// RGB: (0.24, 0.20, 0.05)
    static var yellow20: Color {
        Color(red: 0.24, green: 0.2, blue: 0.05)
    }

    /// Color/Yellow 25
    /// RGB: (0.28, 0.23, 0.05)
    static var yellow25: Color {
        Color(red: 0.28, green: 0.23, blue: 0.05)
    }

    /// Color/Yellow 30
    /// RGB: (0.34, 0.28, 0.04)
    static var yellow30: Color {
        Color(red: 0.34, green: 0.28, blue: 0.04)
    }

    /// Color/Yellow 35
    /// RGB: (0.38, 0.31, 0.03)
    static var yellow35: Color {
        Color(red: 0.38, green: 0.31, blue: 0.03)
    }

    /// Color/Yellow 40
    /// RGB: (0.44, 0.36, 0.02)
    static var yellow40: Color {
        Color(red: 0.44, green: 0.36, blue: 0.02)
    }

    /// Color/Yellow 45
    /// RGB: (0.49, 0.40, 0.00)
    static var yellow45: Color {
        Color(red: 0.49, green: 0.4, blue: 0)
    }

    /// Color/Yellow 50
    /// RGB: (0.53, 0.44, 0.00)
    static var yellow50: Color {
        Color(red: 0.53, green: 0.44, blue: 0)
    }

    /// Color/Yellow 55
    /// RGB: (0.63, 0.52, 0.00)
    static var yellow55: Color {
        Color(red: 0.63, green: 0.52, blue: 0)
    }

    /// Color/Yellow 60
    /// RGB: (0.69, 0.56, 0.00)
    static var yellow60: Color {
        Color(red: 0.69, green: 0.56, blue: 0)
    }

    /// Color/Yellow 65
    /// RGB: (0.72, 0.59, 0.00)
    static var yellow65: Color {
        Color(red: 0.72, green: 0.59, blue: 0)
    }

    /// Color/Yellow 70
    /// RGB: (0.76, 0.63, 0.00)
    static var yellow70: Color {
        Color(red: 0.76, green: 0.63, blue: 0)
    }

    /// Color/Yellow 75
    /// RGB: (0.83, 0.69, 0.00)
    static var yellow75: Color {
        Color(red: 0.83, green: 0.69, blue: 0)
    }

    /// Color/Yellow 75 Alpha 20
    /// RGBA: (0.83, 0.69, 0.00, 0.20)
    static var yellow75Alpha20: Color {
        Color(red: 0.83, green: 0.69, blue: 0, opacity: 0.2)
    }

    /// Color/Yellow 80
    /// RGB: (0.98, 0.81, 0.00)
    static var yellow80: Color {
        Color(red: 0.98, green: 0.81, blue: 0)
    }

    /// Color/Yellow 85
    /// RGB: (1.00, 0.91, 0.32)
    static var yellow85: Color {
        Color(red: 1, green: 0.91, blue: 0.32)
    }

    /// Color/Yellow 90
    /// RGB: (1.00, 0.92, 0.38)
    static var yellow90: Color {
        Color(red: 1, green: 0.92, blue: 0.38)
    }

    /// Color/Yellow 95
    /// RGB: (1.00, 0.96, 0.63)
    static var yellow95: Color {
        Color(red: 1, green: 0.96, blue: 0.63)
    }


    // MARK: - Other Colors

    /// Color/Chartreuse 00
    /// RGB: (0.03, 0.04, 0.01)
    static var chartreuse00: Color {
        Color(red: 0.03, green: 0.04, blue: 0.01)
    }

    /// Color/Chartreuse 05
    /// RGB: (0.06, 0.07, 0.02)
    static var chartreuse05: Color {
        Color(red: 0.06, green: 0.07, blue: 0.02)
    }

    /// Color/Chartreuse 10
    /// RGB: (0.10, 0.12, 0.05)
    static var chartreuse10: Color {
        Color(red: 0.1, green: 0.12, blue: 0.05)
    }

    /// Color/Chartreuse 100
    /// RGB: (0.98, 1.00, 0.82)
    static var chartreuse100: Color {
        Color(red: 0.98, green: 1, blue: 0.82)
    }

    /// Color/Chartreuse 15
    /// RGB: (0.13, 0.16, 0.06)
    static var chartreuse15: Color {
        Color(red: 0.13, green: 0.16, blue: 0.06)
    }

    /// Color/Chartreuse 20
    /// RGB: (0.17, 0.22, 0.07)
    static var chartreuse20: Color {
        Color(red: 0.17, green: 0.22, blue: 0.07)
    }

    /// Color/Chartreuse 25
    /// RGB: (0.20, 0.25, 0.07)
    static var chartreuse25: Color {
        Color(red: 0.2, green: 0.25, blue: 0.07)
    }

    /// Color/Chartreuse 30
    /// RGB: (0.23, 0.31, 0.08)
    static var chartreuse30: Color {
        Color(red: 0.23, green: 0.31, blue: 0.08)
    }

    /// Color/Chartreuse 35
    /// RGB: (0.26, 0.35, 0.08)
    static var chartreuse35: Color {
        Color(red: 0.26, green: 0.35, blue: 0.08)
    }

    /// Color/Chartreuse 40
    /// RGB: (0.29, 0.40, 0.08)
    static var chartreuse40: Color {
        Color(red: 0.29, green: 0.4, blue: 0.08)
    }

    /// Color/Chartreuse 45
    /// RGB: (0.33, 0.44, 0.08)
    static var chartreuse45: Color {
        Color(red: 0.33, green: 0.44, blue: 0.08)
    }

    /// Color/Chartreuse 50
    /// RGB: (0.35, 0.49, 0.09)
    static var chartreuse50: Color {
        Color(red: 0.35, green: 0.49, blue: 0.09)
    }

    /// Color/Chartreuse 55
    /// RGB: (0.42, 0.58, 0.09)
    static var chartreuse55: Color {
        Color(red: 0.42, green: 0.58, blue: 0.09)
    }

    /// Color/Chartreuse 60
    /// RGB: (0.45, 0.63, 0.09)
    static var chartreuse60: Color {
        Color(red: 0.45, green: 0.63, blue: 0.09)
    }

    /// Color/Chartreuse 65
    /// RGB: (0.47, 0.66, 0.09)
    static var chartreuse65: Color {
        Color(red: 0.47, green: 0.66, blue: 0.09)
    }

    /// Color/Chartreuse 70
    /// RGB: (0.51, 0.70, 0.10)
    static var chartreuse70: Color {
        Color(red: 0.51, green: 0.7, blue: 0.1)
    }

    /// Color/Chartreuse 75
    /// RGB: (0.55, 0.76, 0.12)
    static var chartreuse75: Color {
        Color(red: 0.55, green: 0.76, blue: 0.12)
    }

    /// Color/Chartreuse 80
    /// RGB: (0.67, 0.90, 0.20)
    static var chartreuse80: Color {
        Color(red: 0.67, green: 0.9, blue: 0.2)
    }

    /// Color/Chartreuse 85
    /// RGB: (0.76, 0.97, 0.33)
    static var chartreuse85: Color {
        Color(red: 0.76, green: 0.97, blue: 0.33)
    }

    /// Color/Chartreuse 90
    /// RGB: (0.78, 0.99, 0.37)
    static var chartreuse90: Color {
        Color(red: 0.78, green: 0.99, blue: 0.37)
    }

    /// Color/Chartreuse 95
    /// RGB: (0.89, 1.00, 0.60)
    static var chartreuse95: Color {
        Color(red: 0.89, green: 1, blue: 0.6)
    }

    /// Color/Fall 00
    /// RGB: (0.07, 0.02, 0.00)
    static var fall00: Color {
        Color(red: 0.07, green: 0.02, blue: 0)
    }

    /// Color/Fuchsia 00
    /// RGB: (0.06, 0.02, 0.03)
    static var fuchsia00: Color {
        Color(red: 0.06, green: 0.02, blue: 0.03)
    }

    /// Color/Fuchsia 05
    /// RGB: (0.11, 0.04, 0.06)
    static var fuchsia05: Color {
        Color(red: 0.11, green: 0.04, blue: 0.06)
    }

    /// Color/Fuchsia 10
    /// RGB: (0.20, 0.07, 0.11)
    static var fuchsia10: Color {
        Color(red: 0.2, green: 0.07, blue: 0.11)
    }

    /// Color/Fuchsia 100
    /// RGB: (1.00, 0.97, 0.98)
    static var fuchsia100: Color {
        Color(red: 1, green: 0.97, blue: 0.98)
    }

    /// Color/Fuchsia 15
    /// RGB: (0.29, 0.07, 0.15)
    static var fuchsia15: Color {
        Color(red: 0.29, green: 0.07, blue: 0.15)
    }

    /// Color/Fuchsia 20
    /// RGB: (0.39, 0.07, 0.21)
    static var fuchsia20: Color {
        Color(red: 0.39, green: 0.07, blue: 0.21)
    }

    /// Color/Fuchsia 25
    /// RGB: (0.46, 0.05, 0.24)
    static var fuchsia25: Color {
        Color(red: 0.46, green: 0.05, blue: 0.24)
    }

    /// Color/Fuchsia 30
    /// RGB: (0.56, 0.03, 0.29)
    static var fuchsia30: Color {
        Color(red: 0.56, green: 0.03, blue: 0.29)
    }

    /// Color/Fuchsia 35
    /// RGB: (0.64, 0.00, 0.33)
    static var fuchsia35: Color {
        Color(red: 0.64, green: 0, blue: 0.33)
    }

    /// Color/Fuchsia 40
    /// RGB: (0.73, 0.00, 0.38)
    static var fuchsia40: Color {
        Color(red: 0.73, green: 0, blue: 0.38)
    }

    /// Color/Fuchsia 45
    /// RGB: (0.80, 0.00, 0.42)
    static var fuchsia45: Color {
        Color(red: 0.8, green: 0, blue: 0.42)
    }

    /// Color/Fuchsia 50
    /// RGB: (0.87, 0.03, 0.46)
    static var fuchsia50: Color {
        Color(red: 0.87, green: 0.03, blue: 0.46)
    }

    /// Color/Fuchsia 55
    /// RGB: (0.98, 0.18, 0.54)
    static var fuchsia55: Color {
        Color(red: 0.98, green: 0.18, blue: 0.54)
    }

    /// Color/Fuchsia 60
    /// RGB: (1.00, 0.30, 0.60)
    static var fuchsia60: Color {
        Color(red: 1, green: 0.3, blue: 0.6)
    }

    /// Color/Fuchsia 65
    /// RGB: (1.00, 0.38, 0.64)
    static var fuchsia65: Color {
        Color(red: 1, green: 0.38, blue: 0.64)
    }

    /// Color/Fuchsia 70
    /// RGB: (1.00, 0.45, 0.68)
    static var fuchsia70: Color {
        Color(red: 1, green: 0.45, blue: 0.68)
    }

    /// Color/Fuchsia 75
    /// RGB: (1.00, 0.56, 0.74)
    static var fuchsia75: Color {
        Color(red: 1, green: 0.56, blue: 0.74)
    }

    /// Color/Fuchsia 80
    /// RGB: (1.00, 0.76, 0.85)
    static var fuchsia80: Color {
        Color(red: 1, green: 0.76, blue: 0.85)
    }

    /// Color/Fuchsia 85
    /// RGB: (1.00, 0.86, 0.91)
    static var fuchsia85: Color {
        Color(red: 1, green: 0.86, blue: 0.91)
    }

    /// Color/Fuchsia 90
    /// RGB: (1.00, 0.89, 0.93)
    static var fuchsia90: Color {
        Color(red: 1, green: 0.89, blue: 0.93)
    }

    /// Color/Fuchsia 95
    /// RGB: (1.00, 0.95, 0.96)
    static var fuchsia95: Color {
        Color(red: 1, green: 0.95, blue: 0.96)
    }

    /// Color/Magenta 00
    /// RGB: (0.05, 0.02, 0.05)
    static var magenta00: Color {
        Color(red: 0.05, green: 0.02, blue: 0.05)
    }

    /// Color/Magenta 05
    /// RGB: (0.09, 0.05, 0.09)
    static var magenta05: Color {
        Color(red: 0.09, green: 0.05, blue: 0.09)
    }

    /// Color/Magenta 10
    /// RGB: (0.16, 0.08, 0.15)
    static var magenta10: Color {
        Color(red: 0.16, green: 0.08, blue: 0.15)
    }

    /// Color/Magenta 100
    /// RGB: (1.00, 0.97, 1.00)
    static var magenta100: Color {
        Color(red: 1, green: 0.97, blue: 1)
    }

    /// Color/Magenta 15
    /// RGB: (0.24, 0.10, 0.22)
    static var magenta15: Color {
        Color(red: 0.24, green: 0.1, blue: 0.22)
    }

    /// Color/Magenta 20
    /// RGB: (0.32, 0.13, 0.31)
    static var magenta20: Color {
        Color(red: 0.32, green: 0.13, blue: 0.31)
    }

    /// Color/Magenta 25
    /// RGB: (0.38, 0.14, 0.36)
    static var magenta25: Color {
        Color(red: 0.38, green: 0.14, blue: 0.36)
    }

    /// Color/Magenta 30
    /// RGB: (0.46, 0.16, 0.44)
    static var magenta30: Color {
        Color(red: 0.46, green: 0.16, blue: 0.44)
    }

    /// Color/Magenta 35
    /// RGB: (0.52, 0.18, 0.50)
    static var magenta35: Color {
        Color(red: 0.52, green: 0.18, blue: 0.5)
    }

    /// Color/Magenta 40
    /// RGB: (0.60, 0.20, 0.57)
    static var magenta40: Color {
        Color(red: 0.6, green: 0.2, blue: 0.57)
    }

    /// Color/Magenta 45
    /// RGB: (0.66, 0.22, 0.63)
    static var magenta45: Color {
        Color(red: 0.66, green: 0.22, blue: 0.63)
    }

    /// Color/Magenta 50
    /// RGB: (0.73, 0.24, 0.69)
    static var magenta50: Color {
        Color(red: 0.73, green: 0.24, blue: 0.69)
    }

    /// Color/Magenta 55
    /// RGB: (0.84, 0.30, 0.80)
    static var magenta55: Color {
        Color(red: 0.84, green: 0.3, blue: 0.8)
    }

    /// Color/Magenta 60
    /// RGB: (0.90, 0.35, 0.85)
    static var magenta60: Color {
        Color(red: 0.9, green: 0.35, blue: 0.85)
    }

    /// Color/Magenta 65
    /// RGB: (0.93, 0.39, 0.89)
    static var magenta65: Color {
        Color(red: 0.93, green: 0.39, blue: 0.89)
    }

    /// Color/Magenta 70
    /// RGB: (0.96, 0.44, 0.92)
    static var magenta70: Color {
        Color(red: 0.96, green: 0.44, blue: 0.92)
    }

    /// Color/Magenta 75
    /// RGB: (1.00, 0.53, 0.95)
    static var magenta75: Color {
        Color(red: 1, green: 0.53, blue: 0.95)
    }

    /// Color/Magenta 80
    /// RGB: (1.00, 0.74, 0.99)
    static var magenta80: Color {
        Color(red: 1, green: 0.74, blue: 0.99)
    }

    /// Color/Magenta 85
    /// RGB: (1.00, 0.85, 1.00)
    static var magenta85: Color {
        Color(red: 1, green: 0.85, blue: 1)
    }

    /// Color/Magenta 90
    /// RGB: (1.00, 0.88, 1.00)
    static var magenta90: Color {
        Color(red: 1, green: 0.88, blue: 1)
    }

    /// Color/Magenta 95
    /// RGB: (1.00, 0.94, 1.00)
    static var magenta95: Color {
        Color(red: 1, green: 0.94, blue: 1)
    }

    /// Color/Teal 00
    /// RGB: (0.02, 0.04, 0.03)
    static var teal00: Color {
        Color(red: 0.02, green: 0.04, blue: 0.03)
    }

    /// Color/Teal 05
    /// RGB: (0.03, 0.07, 0.06)
    static var teal05: Color {
        Color(red: 0.03, green: 0.07, blue: 0.06)
    }

    /// Color/Teal 10
    /// RGB: (0.05, 0.12, 0.11)
    static var teal10: Color {
        Color(red: 0.05, green: 0.12, blue: 0.11)
    }

    /// Color/Teal 100
    /// RGB: (0.95, 0.98, 0.97)
    static var teal100: Color {
        Color(red: 0.95, green: 0.98, blue: 0.97)
    }

    /// Color/Teal 15
    /// RGB: (0.06, 0.17, 0.14)
    static var teal15: Color {
        Color(red: 0.06, green: 0.17, blue: 0.14)
    }

    /// Color/Teal 20
    /// RGB: (0.05, 0.23, 0.19)
    static var teal20: Color {
        Color(red: 0.05, green: 0.23, blue: 0.19)
    }

    /// Color/Teal 25
    /// RGB: (0.04, 0.27, 0.22)
    static var teal25: Color {
        Color(red: 0.04, green: 0.27, blue: 0.22)
    }

    /// Color/Teal 30
    /// RGB: (0.01, 0.32, 0.26)
    static var teal30: Color {
        Color(red: 0.01, green: 0.32, blue: 0.26)
    }

    /// Color/Teal 35
    /// RGB: (0.00, 0.36, 0.29)
    static var teal35: Color {
        Color(red: 0, green: 0.36, blue: 0.29)
    }

    /// Color/Teal 40
    /// RGB: (0.00, 0.42, 0.34)
    static var teal40: Color {
        Color(red: 0, green: 0.42, blue: 0.34)
    }

    /// Color/Teal 45
    /// RGB: (0.00, 0.46, 0.37)
    static var teal45: Color {
        Color(red: 0, green: 0.46, blue: 0.37)
    }

    /// Color/Teal 50
    /// RGB: (0.00, 0.51, 0.41)
    static var teal50: Color {
        Color(red: 0, green: 0.51, blue: 0.41)
    }

    /// Color/Teal 55
    /// RGB: (0.00, 0.60, 0.49)
    static var teal55: Color {
        Color(red: 0, green: 0.6, blue: 0.49)
    }

    /// Color/Teal 60
    /// RGB: (0.00, 0.65, 0.53)
    static var teal60: Color {
        Color(red: 0, green: 0.65, blue: 0.53)
    }

    /// Color/Teal 65
    /// RGB: (0.00, 0.68, 0.56)
    static var teal65: Color {
        Color(red: 0, green: 0.68, blue: 0.56)
    }

    /// Color/Teal 70
    /// RGB: (0.08, 0.72, 0.60)
    static var teal70: Color {
        Color(red: 0.08, green: 0.72, blue: 0.6)
    }

    /// Color/Teal 75
    /// RGB: (0.24, 0.78, 0.65)
    static var teal75: Color {
        Color(red: 0.24, green: 0.78, blue: 0.65)
    }

    /// Color/Teal 80
    /// RGB: (0.56, 0.89, 0.79)
    static var teal80: Color {
        Color(red: 0.56, green: 0.89, blue: 0.79)
    }

    /// Color/Teal 85
    /// RGB: (0.76, 0.94, 0.88)
    static var teal85: Color {
        Color(red: 0.76, green: 0.94, blue: 0.88)
    }

    /// Color/Teal 90
    /// RGB: (0.80, 0.95, 0.90)
    static var teal90: Color {
        Color(red: 0.8, green: 0.95, blue: 0.9)
    }

    /// Color/Teal 95
    /// RGB: (0.89, 0.97, 0.95)
    static var teal95: Color {
        Color(red: 0.89, green: 0.97, blue: 0.95)
    }

    /// Color/Unselected Tab
    /// RGB: (0.00, 0.00, 0.00)
    static var unselectedTab: Color {
        Color(red: 0, green: 0, blue: 0)
    }

    /// Color/Violet 00
    /// RGB: (0.05, 0.00, 0.15)
    static var violet00: Color {
        Color(red: 0.05, green: 0, blue: 0.15)
    }

    /// Color/Violet 05
    /// RGB: (0.09, 0.02, 0.23)
    static var violet05: Color {
        Color(red: 0.09, green: 0.02, blue: 0.23)
    }

    /// Color/Violet 10
    /// RGB: (0.14, 0.02, 0.34)
    static var violet10: Color {
        Color(red: 0.14, green: 0.02, blue: 0.34)
    }

    /// Color/Violet 100
    /// RGB: (0.98, 0.97, 1.00)
    static var violet100: Color {
        Color(red: 0.98, green: 0.97, blue: 1)
    }

    /// Color/Violet 15
    /// RGB: (0.19, 0.05, 0.43)
    static var violet15: Color {
        Color(red: 0.19, green: 0.05, blue: 0.43)
    }

    /// Color/Violet 20
    /// RGB: (0.24, 0.08, 0.53)
    static var violet20: Color {
        Color(red: 0.24, green: 0.08, blue: 0.53)
    }

    /// Color/Violet 25
    /// RGB: (0.28, 0.11, 0.60)
    static var violet25: Color {
        Color(red: 0.28, green: 0.11, blue: 0.6)
    }

    /// Color/Violet 30
    /// RGB: (0.33, 0.15, 0.69)
    static var violet30: Color {
        Color(red: 0.33, green: 0.15, blue: 0.69)
    }

    /// Color/Violet 35
    /// RGB: (0.37, 0.19, 0.75)
    static var violet35: Color {
        Color(red: 0.37, green: 0.19, blue: 0.75)
    }

    /// Color/Violet 40
    /// RGB: (0.42, 0.24, 0.82)
    static var violet40: Color {
        Color(red: 0.42, green: 0.24, blue: 0.82)
    }

    /// Color/Violet 40 Apha 20
    /// RGBA: (0.42, 0.24, 0.82, 0.20)
    static var violet40Apha20: Color {
        Color(red: 0.42, green: 0.24, blue: 0.82, opacity: 0.2)
    }

    /// Color/Violet 45
    /// RGB: (0.46, 0.29, 0.86)
    static var violet45: Color {
        Color(red: 0.46, green: 0.29, blue: 0.86)
    }

    /// Color/Violet 50
    /// RGB: (0.50, 0.34, 0.89)
    static var violet50: Color {
        Color(red: 0.5, green: 0.34, blue: 0.89)
    }

    /// Color/Violet 55
    /// RGB: (0.58, 0.44, 0.94)
    static var violet55: Color {
        Color(red: 0.58, green: 0.44, blue: 0.94)
    }

    /// Color/Violet 55 Alpha 20
    /// RGBA: (0.58, 0.44, 0.94, 0.20)
    static var violet55Alpha20: Color {
        Color(red: 0.58, green: 0.44, blue: 0.94, opacity: 0.2)
    }

    /// Color/Violet 60
    /// RGB: (0.62, 0.49, 0.96)
    static var violet60: Color {
        Color(red: 0.62, green: 0.49, blue: 0.96)
    }

    /// Color/Violet 65
    /// RGB: (0.65, 0.53, 0.97)
    static var violet65: Color {
        Color(red: 0.65, green: 0.53, blue: 0.97)
    }

    /// Color/Violet 65 Alpha 45
    /// RGBA: (0.65, 0.53, 0.97, 0.45)
    static var violet65Alpha45: Color {
        Color(red: 0.65, green: 0.53, blue: 0.97, opacity: 0.45)
    }

    /// Color/Violet 70
    /// RGB: (0.69, 0.58, 0.98)
    static var violet70: Color {
        Color(red: 0.69, green: 0.58, blue: 0.98)
    }

    /// Color/Violet 75
    /// RGB: (0.74, 0.65, 0.99)
    static var violet75: Color {
        Color(red: 0.74, green: 0.65, blue: 0.99)
    }

    /// Color/Violet 80
    /// RGB: (0.85, 0.80, 0.99)
    static var violet80: Color {
        Color(red: 0.85, green: 0.8, blue: 0.99)
    }

    /// Color/Violet 85
    /// RGB: (0.92, 0.88, 1.00)
    static var violet85: Color {
        Color(red: 0.92, green: 0.88, blue: 1)
    }

    /// Color/Violet 90
    /// RGB: (0.94, 0.91, 1.00)
    static var violet90: Color {
        Color(red: 0.94, green: 0.91, blue: 1)
    }

    /// Color/Violet 95
    /// RGB: (0.97, 0.95, 1.00)
    static var violet95: Color {
        Color(red: 0.97, green: 0.95, blue: 1)
    }

}

// MARK: - Color Extension for Light/Dark Mode

extension Color {
    /// Creates a color that adapts to light and dark mode
    /// - Parameters:
    ///   - light: Color to use in light mode
    ///   - dark: Color to use in dark mode
    /// - Returns: A dynamic color that adapts to the current color scheme
    init(light: Color, dark: Color) {
        self.init(UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(dark)
            default:
                return UIColor(light)
            }
        })
    }
}

// MARK: - Environment Helper

extension EnvironmentValues {
    /// Helper to check if dark mode is active
    var isDarkMode: Bool {
        self.colorScheme == .dark
    }
}
