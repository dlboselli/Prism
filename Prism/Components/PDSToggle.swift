import SwiftUI

// MARK: - Toggle Style

/// PDS Toggle style - custom switch appearance
struct PDSToggleStyle: ToggleStyle {
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .typography(Typography.body2)
                .foregroundColor(isEnabled ? Colors.textPrimary : Colors.textDisabled)
            
            Spacer()
            
            PDSSwitch(isOn: configuration.$isOn, isEnabled: isEnabled)
        }
    }
}

/// Standalone PDS Switch component
struct PDSSwitch: View {
    @Binding var isOn: Bool
    var isEnabled: Bool = true
    
    private let trackWidth: CGFloat = 51
    private let trackHeight: CGFloat = 31
    private let thumbSize: CGFloat = 27
    private let thumbPadding: CGFloat = 2
    
    var body: some View {
        Button {
            if isEnabled {
                isOn.toggle()
            }
        } label: {
            ZStack(alignment: isOn ? .trailing : .leading) {
                // Track
                RoundedRectangle(cornerRadius: trackHeight / 2)
                    .fill(trackColor)
                    .frame(width: trackWidth, height: trackHeight)
                
                // Thumb
                thumbView
                    .padding(thumbPadding)
            }
            .animation(.easeInOut(duration: 0.2), value: isOn)
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Toggle")
        .accessibilityValue(isOn ? "On" : "Off")
        .accessibilityAddTraits(isEnabled ? .isButton : [.isButton, .isStaticText])
        .accessibilityHint(isEnabled ? "Double tap to toggle" : "Disabled")
    }
    
    private var trackColor: Color {
        if !isEnabled {
            return Colors.switchDisabledBackground
        }
        return isOn ? Colors.switchCheckedBackgroundiOS : Colors.switchUncheckedBackground
    }
    
    private var thumbColor: Color {
        if !isEnabled {
            return Colors.switchDisabledHandle
        }
        return isOn ? Colors.switchCheckedHandleiOS : Colors.switchUncheckedHandle
    }
    
    @ViewBuilder
    private var thumbView: some View {
        if isEnabled {
            Circle()
                .fill(thumbColor)
                .frame(width: thumbSize, height: thumbSize)
                .shadow(Shadow.uiEmphasis)
        } else {
            Circle()
                .fill(thumbColor)
                .frame(width: thumbSize, height: thumbSize)
        }
    }
}

// MARK: - Toggle with Description

/// Toggle style with a secondary description text
struct PDSToggleWithDescriptionStyle: ToggleStyle {
    let description: String
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                configuration.label
                    .typography(Typography.body2)
                    .foregroundColor(isEnabled ? Colors.textPrimary : Colors.textDisabled)
                
                Text(description)
                    .typography(Typography.body4)
                    .foregroundColor(isEnabled ? Colors.textSecondary : Colors.textDisabled)
            }
            
            Spacer()
            
            PDSSwitch(isOn: configuration.$isOn, isEnabled: isEnabled)
        }
    }
}

// MARK: - Compact Toggle Style

/// Compact toggle style without label
struct PDSCompactToggleStyle: ToggleStyle {
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        PDSSwitch(isOn: configuration.$isOn, isEnabled: isEnabled)
    }
}

// MARK: - View Extensions

extension View {
    /// Applies PDS toggle style
    func pdsToggle(isEnabled: Bool = true) -> some View {
        self.toggleStyle(PDSToggleStyle(isEnabled: isEnabled))
    }
    
    /// Applies PDS toggle style with description
    func pdsToggle(description: String, isEnabled: Bool = true) -> some View {
        self.toggleStyle(PDSToggleWithDescriptionStyle(description: description, isEnabled: isEnabled))
    }
    
    /// Applies compact PDS toggle style (switch only)
    func pdsCompactToggle(isEnabled: Bool = true) -> some View {
        self.toggleStyle(PDSCompactToggleStyle(isEnabled: isEnabled))
    }
}

// MARK: - Preview

#Preview("Toggle Styles") {
    VStack(spacing: 32) {
        // Standard toggle
        VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
            Text("Standard Toggle")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            Toggle("Notifications", isOn: .constant(true))
                .pdsToggle()
            
            Toggle("Dark Mode", isOn: .constant(false))
                .pdsToggle()
        }
        
        Rectangle()
            .fill(Colors.backgroundDivider)
            .frame(height: 1)
            .background(Colors.backgroundDivider)
        
        // Toggle with description
        VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
            Text("With Description")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            Toggle("Push Notifications", isOn: .constant(true))
                .pdsToggle(description: "Receive notifications about activity on your posts")
        }
        
        Rectangle()
            .fill(Colors.backgroundDivider)
            .frame(height: 1)
            .background(Colors.backgroundDivider)
        
        // Compact toggle
        VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
            Text("Compact (Switch Only)")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            HStack {
                Text("Wi-Fi")
                    .typography(Typography.body2)
                    .foregroundColor(Colors.textPrimary)
                
                Spacer()
                
                Toggle("", isOn: .constant(true))
                    .pdsCompactToggle()
            }
        }
        
        Rectangle()
            .fill(Colors.backgroundDivider)
            .frame(height: 1)
            .background(Colors.backgroundDivider)
        
        // Disabled toggles
        VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
            Text("Disabled")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            Toggle("Disabled On", isOn: .constant(true))
                .pdsToggle(isEnabled: false)
            
            Toggle("Disabled Off", isOn: .constant(false))
                .pdsToggle(isEnabled: false)
        }
    }
    .padding(24)
    .background(Colors.backgroundSurface)
}
