import SwiftUI

// MARK: - Action Chip Styles

/// Standard action chip style - pill-shaped button for filters and selections
struct PDSActionChipStyle: ButtonStyle {
    var isSelected: Bool = false
    var icon: String? = nil
    
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
                .stroke(isSelected ? Color.clear : Colors.elevationBorderEmphasis, lineWidth: 1)
        )
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
        .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private func foregroundColor(isPressed: Bool) -> Color {
        if isSelected {
            // Light: accent blue, Dark: black (for white background)
            return Color(light: Colors.persistentAccent, dark: Colors.gray00)
        }
        return isPressed ? Colors.textPrimary : Colors.textSecondary
    }
    
    private func backgroundColor(isPressed: Bool) -> Color {
        if isSelected {
            // Light: light blue, Dark: white
            let selectedBg = Color(light: Colors.persistentAccentDeemphasized, dark: Colors.white)
            return isPressed ? selectedBg.opacity(0.7) : selectedBg
        }
        return isPressed ? Colors.backgroundDeemphasized : Colors.backgroundCard
    }
}

/// Dismissible chip style - includes an X button for removal
struct PDSDismissibleChipStyle: ButtonStyle {
    // Light: accent blue, Dark: black (for white background)
    private var foregroundColor: Color {
        Color(light: Colors.persistentAccent, dark: Colors.gray00)
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

/// Emoji chip style - for reaction-style chips with emoji
struct PDSEmojiChipStyle: ButtonStyle {
    var count: Int? = nil
    var isSelected: Bool = false
    
    // Light: accent blue, Dark: black (for white background)
    private var selectedTextColor: Color {
        Color(light: Colors.persistentAccent, dark: Colors.gray00)
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
    func pdsActionChip(isSelected: Bool = false, icon: String? = nil) -> some View {
        self.buttonStyle(PDSActionChipStyle(isSelected: isSelected, icon: icon))
    }
    
    /// Applies PDS dismissible chip style
    func pdsDismissibleChip() -> some View {
        self.buttonStyle(PDSDismissibleChipStyle())
    }
    
    /// Applies PDS emoji chip style
    func pdsEmojiChip(count: Int? = nil, isSelected: Bool = false) -> some View {
        self.buttonStyle(PDSEmojiChipStyle(count: count, isSelected: isSelected))
    }
}

// MARK: - Preview

#Preview("Action Chip Styles") {
    VStack(spacing: 32) {
        // Standard chips
        VStack(alignment: .leading, spacing: 12) {
            Text("Action Chips")
                .typography(Typography.meta1)
                .foregroundColor(Colors.textSecondary)
            
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
                .typography(Typography.meta1)
                .foregroundColor(Colors.textSecondary)
            
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
                .typography(Typography.meta1)
                .foregroundColor(Colors.textSecondary)
            
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
                .typography(Typography.meta1)
                .foregroundColor(Colors.textSecondary)
            
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
    }
    .padding(24)
    .background(Colors.backgroundSurface)
}
