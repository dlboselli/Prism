//
//  PDSActionChip.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Action chips are pill-shaped buttons used for filters, selections,
//  and contextual actions. They support selected/unselected states,
//  icons, dismissible badges, and author avatars.
//
//  Usage:
//  ```swift
//  // Standard chip
//  Button("Filter") { }
//      .pdsActionChip()
//
//  // Selected state
//  Button("Active") { }
//      .pdsActionChip(isSelected: true)
//
//  // With icon
//  Button("Add") { }
//      .pdsActionChip(icon: "plus")
//
//  // Dismissible badge
//  Button("Tag") { }
//      .pdsActionChipBadge(onDismiss: { })
//
//  // Author chip with avatar
//  Button("John Doe") { }
//      .pdsAuthorChip(actorInitials: "JD", name: "John Doe")
//  ```
//

import SwiftUI

// MARK: - Action Chip Context

/// Context for action chip appearance
enum PDSActionChipContext {
    case standard   // Default on surface backgrounds
    case onColor    // On colored backgrounds
    case onMedia    // On images/videos
}

// MARK: - Action Chip Styles

/// Standard action chip style - pill-shaped button for filters and selections
struct PDSActionChipStyle: ButtonStyle {
    var isSelected: Bool = false
    var icon: String? = nil
    var context: PDSActionChipContext = .standard
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .medium))
            }
            
            configuration.label
                .typography(Typography.button3)
        }
        .foregroundColor(foregroundColor(isPressed: configuration.isPressed))
        .padding(.horizontal, icon != nil ? 14 : 16)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(backgroundColor(isPressed: configuration.isPressed))
        )
        .overlay(
            Capsule()
                .stroke(borderColor, lineWidth: 1)
        )
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
        .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private var borderColor: Color {
        // Selected chips have no border, unselected chips have border
        if isSelected { return .clear }
        
        switch context {
        case .standard:
            return Colors.elevationBorderEmphasis
        case .onColor:
            return Colors.white.opacity(0.5)
        case .onMedia:
            return Colors.white.opacity(0.5)
        }
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        if isSelected {
            switch context {
            case .standard:
                // Selected: blue text on light blue (light mode), black text on white (dark mode)
                return Color(light: Colors.accentText, dark: Colors.gray950)
            case .onColor, .onMedia:
                // Selected on color/media: black text on white background
                return Colors.gray950
            }
        }
        
        switch context {
        case .standard:
            return isPressed ? Colors.textPrimary : Colors.textSecondary
            
        case .onColor:
            return isPressed ? Colors.textPrimaryOnColor : Colors.textSecondaryOnColor
            
        case .onMedia:
            return isPressed ? Colors.textPrimaryOnMedia : Colors.textSecondaryOnMedia
        }
    }
    
    private func backgroundColor(isPressed: Bool) -> Color {
        switch context {
        case .standard:
            if isSelected {
                let selectedBg = Color(light: Colors.persistentAccentDeemphasized, dark: Colors.white)
                return isPressed ? selectedBg.opacity(0.7) : selectedBg
            }
            // Unselected: transparent background
            return isPressed ? Colors.backgroundDeemphasized.opacity(0.5) : .clear
            
        case .onColor:
            if isSelected {
                return isPressed ? Colors.white.opacity(0.85) : Colors.white
            }
            // Unselected: transparent background
            return isPressed ? Colors.white.opacity(0.15) : .clear
            
        case .onMedia:
            if isSelected {
                return isPressed ? Colors.white.opacity(0.85) : Colors.white
            }
            // Unselected: transparent background
            return isPressed ? Colors.white.opacity(0.15) : .clear
        }
    }
}

/// Dismissible chip style - includes an X button for removal
struct PDSDismissibleChipStyle: ButtonStyle {
    // Light: accent text, Dark: black (for white background)
    private var foregroundColor: Color {
        Color(light: Colors.accentText, dark: Colors.gray950)
    }
    
    // Light: light blue, Dark: white
    private var bgColor: Color {
        Color(light: Colors.persistentAccentDeemphasized, dark: Colors.white)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            configuration.label
                .typography(Typography.button3)
            
            Image(systemName: "xmark")
                .font(.system(size: 10, weight: .bold))
        }
        .foregroundColor(foregroundColor)
        .padding(.leading, 14)
        .padding(.trailing, 10)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(configuration.isPressed ? bgColor.opacity(0.7) : bgColor)
        )
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
        .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

/// Author chip style - includes actor avatar with name
struct PDSAuthorChipStyle: ButtonStyle {
    var actorURL: URL? = nil
    var actorInitials: String? = nil
    var isSelected: Bool = false
    
    // Selected text: blue (light mode), black (dark mode for white background)
    private var selectedTextColor: Color {
        Color(light: Colors.accentText, dark: Colors.gray950)
    }
    
    // Light: light blue, Dark: white
    private var selectedBgColor: Color {
        Color(light: Colors.persistentAccentDeemphasized, dark: Colors.white)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            // Actor avatar
            if let url = actorURL {
                PDSActor(url: url, size: .xsmall)
            } else if let initials = actorInitials {
                PDSActor(initials: initials, size: .xsmall)
            } else {
                PDSActor(size: .xsmall)
            }
            
            configuration.label
                .typography(Typography.button3)
        }
        .foregroundColor(foregroundColor(isPressed: configuration.isPressed))
        .padding(.leading, 4)
        .padding(.trailing, 14)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(backgroundColor(isPressed: configuration.isPressed))
        )
        .overlay(
            Capsule()
                .stroke(isSelected ? .clear : Colors.elevationBorderEmphasis, lineWidth: 1)
        )
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
        .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        if isSelected {
            return selectedTextColor
        }
        return isPressed ? Colors.textPrimary : Colors.textSecondary
    }
    
    private func backgroundColor(isPressed: Bool) -> Color {
        if isSelected {
            return isPressed ? selectedBgColor.opacity(0.7) : selectedBgColor
        }
        // Unselected: transparent background
        return isPressed ? Colors.backgroundDeemphasized.opacity(0.5) : .clear
    }
}

/// Emoji chip style - for reaction-style chips with emoji
struct PDSEmojiChipStyle: ButtonStyle {
    var count: Int? = nil
    var isSelected: Bool = false
    
    // Light: accent text, Dark: black (for white background)
    private var selectedTextColor: Color {
        Color(light: Colors.accentText, dark: Colors.gray950)
    }
    
    // Light: light blue, Dark: white
    private var selectedBgColor: Color {
        Color(light: Colors.persistentAccentDeemphasized, dark: Colors.white)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 4) {
            configuration.label
                .font(.system(size: 16))
            
            if let count = count, count > 0 {
                Text("\(count)")
                    .typography(isSelected ? Typography.button3 : Typography.meta3)
                    .foregroundColor(isSelected ? selectedTextColor : Colors.textSecondary)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(
            Capsule()
                .fill(backgroundColor(isPressed: configuration.isPressed))
        )
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private func backgroundColor(isPressed: Bool) -> Color {
        if isSelected {
            return isPressed ? selectedBgColor.opacity(0.7) : selectedBgColor
        }
        return isPressed ? Colors.backgroundDeemphasized : Colors.backgroundDeemphasized
    }
}

// MARK: - View Extensions

extension View {
    /// Applies PDS action chip style
    func pdsActionChip(
        isSelected: Bool = false,
        icon: String? = nil,
        context: PDSActionChipContext = .standard
    ) -> some View {
        self.buttonStyle(PDSActionChipStyle(isSelected: isSelected, icon: icon, context: context))
    }
    
    /// Applies PDS dismissible chip style
    func pdsDismissibleChip() -> some View {
        self.buttonStyle(PDSDismissibleChipStyle())
    }
    
    /// Applies PDS emoji chip style
    func pdsEmojiChip(count: Int? = nil, isSelected: Bool = false) -> some View {
        self.buttonStyle(PDSEmojiChipStyle(count: count, isSelected: isSelected))
    }
    
    /// Applies PDS author chip style with actor avatar
    func pdsAuthorChip(
        actorURL: URL? = nil,
        actorInitials: String? = nil,
        isSelected: Bool = false
    ) -> some View {
        self.buttonStyle(PDSAuthorChipStyle(
            actorURL: actorURL,
            actorInitials: actorInitials,
            isSelected: isSelected
        ))
    }
}

// MARK: - Preview

#Preview("Action Chip Styles") {
    VStack(spacing: 32) {
        // Standard chips
        VStack(alignment: .leading, spacing: 12) {
            Text("Action Chips")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    Button("All") { }
                        .pdsActionChip(isSelected: true)
                    
                    Button("Photos") { }
                        .pdsActionChip()
                    
                    Button("Videos") { }
                        .pdsActionChip()
                    
                    Button("Links") { }
                        .pdsActionChip()
                }
            }
        }
        
        // Chips with icons
        VStack(alignment: .leading, spacing: 12) {
            Text("With Icons")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    Button("Filter") { }
                        .pdsActionChip(icon: "slider.horizontal.3")
                    
                    Button("Sort") { }
                        .pdsActionChip(icon: "arrow.up.arrow.down")
                    
                    Button("Date") { }
                        .pdsActionChip(isSelected: true, icon: "calendar")
                }
            }
        }
        
        // Dismissible chips
        VStack(alignment: .leading, spacing: 12) {
            Text("Dismissible")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    Button("San Francisco") { }
                        .pdsDismissibleChip()
                    
                    Button("Photography") { }
                        .pdsDismissibleChip()
                    
                    Button("2024") { }
                        .pdsDismissibleChip()
                }
            }
        }
        
        // Emoji chips (reactions)
        VStack(alignment: .leading, spacing: 12) {
            Text("Emoji / Reactions")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            HStack(spacing: 8) {
                Button("👍") { }
                    .pdsEmojiChip(count: 12, isSelected: true)
                
                Button("❤️") { }
                    .pdsEmojiChip(count: 5)
                
                Button("😂") { }
                    .pdsEmojiChip(count: 3)
                
                Button("😮") { }
                    .pdsEmojiChip()
            }
        }
        
        // Author chips
        VStack(alignment: .leading, spacing: 12) {
            Text("Author Chips")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    Button("John Doe") { }
                        .pdsAuthorChip(actorInitials: "JD", isSelected: true)
                    
                    Button("Jane Smith") { }
                        .pdsAuthorChip(actorInitials: "JS")
                    
                    Button("Alex Chen") { }
                        .pdsAuthorChip(actorInitials: "AC")
                }
            }
        }
    }
    .padding(24)
    .background(Colors.backgroundSurface)
}
