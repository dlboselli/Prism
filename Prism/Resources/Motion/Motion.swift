//
//  Motion.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Animation timing and curve tokens for consistent motion throughout the app.
//

import SwiftUI

/// Prism Design System Motion Tokens
///
/// Usage:
/// ```swift
/// .animation(Motion.quick, value: isPressed)
/// .animation(Motion.standard, value: isExpanded)
/// withAnimation(Motion.spring) { ... }
/// ```
struct Motion {
    
    // MARK: - Durations
    
    /// 0.1s - Instant feedback (button press, toggle)
    static let instantDuration: Double = 0.1
    
    /// 0.15s - Quick transitions (hover states, small changes)
    static let quickDuration: Double = 0.15
    
    /// 0.2s - Standard transitions (most UI changes)
    static let standardDuration: Double = 0.2
    
    /// 0.3s - Moderate transitions (panels, cards)
    static let moderateDuration: Double = 0.3
    
    /// 0.4s - Slow transitions (page transitions, modals)
    static let slowDuration: Double = 0.4
    
    /// 0.5s - Deliberate transitions (complex animations)
    static let deliberateDuration: Double = 0.5
    
    // MARK: - Standard Animations
    
    /// Instant feedback animation (0.1s ease-in-out)
    static let instant: Animation = .easeInOut(duration: instantDuration)
    
    /// Quick animation (0.15s ease-in-out)
    static let quick: Animation = .easeInOut(duration: quickDuration)
    
    /// Standard animation (0.2s ease-in-out)
    static let standard: Animation = .easeInOut(duration: standardDuration)
    
    /// Moderate animation (0.3s ease-in-out)
    static let moderate: Animation = .easeInOut(duration: moderateDuration)
    
    /// Slow animation (0.4s ease-in-out)
    static let slow: Animation = .easeInOut(duration: slowDuration)
    
    /// Deliberate animation (0.5s ease-in-out)
    static let deliberate: Animation = .easeInOut(duration: deliberateDuration)
    
    // MARK: - Spring Animations
    
    /// Standard spring animation
    static let spring: Animation = .spring(response: 0.3, dampingFraction: 0.7)
    
    /// Bouncy spring animation
    static let springBouncy: Animation = .spring(response: 0.4, dampingFraction: 0.6)
    
    /// Snappy spring animation
    static let springSnappy: Animation = .spring(response: 0.25, dampingFraction: 0.8)
    
    /// Gentle spring animation
    static let springGentle: Animation = .spring(response: 0.5, dampingFraction: 0.8)
    
    // MARK: - Interactive Animations
    
    /// Button press feedback
    static let buttonPress: Animation = instant
    
    /// Toggle switch animation
    static let toggle: Animation = .easeInOut(duration: standardDuration)
    
    /// Card expand/collapse
    static let cardTransition: Animation = moderate
    
    /// Sheet/modal presentation
    static let sheetPresentation: Animation = springGentle
    
    /// List item insertion/removal
    static let listItem: Animation = .easeInOut(duration: quickDuration)
    
    /// Fade in/out
    static let fade: Animation = .easeInOut(duration: quickDuration)
    
    // MARK: - Motion Types
    
    /// Enter/Exit - Elements appearing or disappearing from the screen
    static let enter: Animation = .easeOut(duration: moderateDuration)
    static let exit: Animation = .easeIn(duration: standardDuration)
    
    /// Expand/Collapse - Elements growing or shrinking in place
    static let expand: Animation = .spring(response: 0.35, dampingFraction: 0.75)
    static let collapse: Animation = .spring(response: 0.3, dampingFraction: 0.8)
    
    /// Swap/Shuffle - Elements exchanging positions
    static let swap: Animation = .spring(response: 0.4, dampingFraction: 0.7)
    static let shuffle: Animation = .spring(response: 0.5, dampingFraction: 0.65)
    
    /// Move - Standard repositioning of elements
    static let move: Animation = .spring(response: 0.35, dampingFraction: 0.8)
    
    /// Quick Move - Fast repositioning for responsive feedback
    static let quickMove: Animation = .spring(response: 0.25, dampingFraction: 0.85)
    
    /// Passive Move - Subtle repositioning that shouldn't draw attention
    static let passiveMove: Animation = .easeInOut(duration: slowDuration)
    
    // MARK: - Delays
    
    /// No delay
    static let noDelay: Double = 0
    
    /// Short delay (0.05s)
    static let shortDelay: Double = 0.05
    
    /// Standard delay (0.1s)
    static let standardDelay: Double = 0.1
    
    /// Long delay (0.2s)
    static let longDelay: Double = 0.2
}

// MARK: - View Extension

extension View {
    /// Apply standard PDS animation
    func pdsAnimation<V: Equatable>(_ animation: Animation = Motion.standard, value: V) -> some View {
        self.animation(animation, value: value)
    }
    
    /// Apply button press animation
    func pdsButtonAnimation<V: Equatable>(value: V) -> some View {
        self.animation(Motion.buttonPress, value: value)
    }
}

// MARK: - Transition Helpers

extension AnyTransition {
    /// Standard fade transition
    static var pdsFade: AnyTransition {
        .opacity.animation(Motion.fade)
    }
    
    /// Slide up with fade
    static var pdsSlideUp: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity),
            removal: .move(edge: .bottom).combined(with: .opacity)
        )
    }
    
    /// Scale with fade
    static var pdsScale: AnyTransition {
        .scale(scale: 0.95).combined(with: .opacity)
    }
}

