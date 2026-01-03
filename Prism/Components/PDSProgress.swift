import SwiftUI

// MARK: - Progress Bar

/// A linear progress bar with determinate or indeterminate states
struct PDSProgressBar: View {
    let progress: Double // 0.0 to 1.0
    var variant: PDSProgressVariant = .accent
    var size: PDSProgressSize = .medium
    var showLabel: Bool = false
    var isIndeterminate: Bool = false
    
    @State private var indeterminateOffset: CGFloat = 0.0
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Track
                    Capsule()
                        .fill(Colors.backgroundDeemphasized)
                        .frame(height: size.height)
                    
                    // Fill
                    if isIndeterminate {
                        Capsule()
                            .fill(variant.color)
                            .frame(width: geometry.size.width * 0.3, height: size.height)
                            .offset(x: indeterminateOffset * geometry.size.width)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                    indeterminateOffset = 0.7
                                }
                            }
                    } else {
                        Capsule()
                            .fill(variant.color)
                            .frame(width: max(0, min(geometry.size.width * progress, geometry.size.width)), height: size.height)
                            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: progress)
                    }
                }
                .clipShape(Capsule())
            }
            .frame(height: size.height)
            
            if showLabel && !isIndeterminate {
                Text("\(Int(progress * 100))%")
                    .typography(Typography.meta4)
                    .foregroundColor(Colors.textSecondary)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Progress")
        .accessibilityValue(isIndeterminate ? "Loading" : "\(Int(progress * 100)) percent")
    }
}

enum PDSProgressVariant {
    case accent
    case positive
    case warning
    case negative
    case neutral
    
    var color: Color {
        switch self {
        case .accent: return Colors.persistentAccent
        case .positive: return Colors.persistentPositive
        case .warning: return Colors.persistentWarning
        case .negative: return Colors.persistentNegative
        case .neutral: return Colors.gray500
        }
    }
}

enum PDSProgressSize {
    case small
    case medium
    case large
    
    var height: CGFloat {
        switch self {
        case .small: return 4
        case .medium: return 8
        case .large: return 12
        }
    }
}

// MARK: - Progress Ring

/// A circular progress indicator
struct PDSProgressRing: View {
    let progress: Double // 0.0 to 1.0
    var variant: PDSProgressVariant = .accent
    var size: PDSRingSize = .medium
    var showLabel: Bool = true
    var labelStyle: PDSRingLabelStyle = .percentage
    
    var body: some View {
        ZStack {
            // Track
            Circle()
                .stroke(Colors.backgroundDeemphasized, lineWidth: size.strokeWidth)
            
            // Fill
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    variant.color,
                    style: StrokeStyle(lineWidth: size.strokeWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.spring(response: 0.5, dampingFraction: 0.8), value: progress)
            
            // Label
            if showLabel {
                VStack(spacing: 2) {
                    switch labelStyle {
                    case .percentage:
                        Text("\(Int(progress * 100))%")
                            .typography(size.typography)
                            .foregroundColor(Colors.textPrimary)
                    case .fraction(let current, let total):
                        Text("\(current)")
                            .typography(size.typography)
                            .foregroundColor(Colors.textPrimary)
                        Text("of \(total)")
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    case .custom(let text):
                        Text(text)
                            .typography(size.typography)
                            .foregroundColor(Colors.textPrimary)
                    }
                }
            }
        }
        .frame(width: size.diameter, height: size.diameter)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Progress")
        .accessibilityValue(accessibilityValueText)
    }
    
    private var accessibilityValueText: String {
        switch labelStyle {
        case .percentage:
            return "\(Int(progress * 100)) percent complete"
        case .fraction(let current, let total):
            return "\(current) of \(total)"
        case .custom(let text):
            return text
        }
    }
}

enum PDSRingSize {
    case small
    case medium
    case large
    case xlarge
    
    var diameter: CGFloat {
        switch self {
        case .small: return 48
        case .medium: return 80
        case .large: return 120
        case .xlarge: return 160
        }
    }
    
    var strokeWidth: CGFloat {
        switch self {
        case .small: return 4
        case .medium: return 6
        case .large: return 8
        case .xlarge: return 10
        }
    }
    
    var typography: Typography.Style {
        switch self {
        case .small: return Typography.meta3
        case .medium: return Typography.headline4Emphasized
        case .large: return Typography.headline3Emphasized
        case .xlarge: return Typography.headline2Emphasized
        }
    }
}

enum PDSRingLabelStyle {
    case percentage
    case fraction(current: Int, total: Int)
    case custom(String)
}

// MARK: - Progress Steps

/// A step indicator for multi-step flows
struct PDSProgressSteps: View {
    let steps: [String]
    let currentStep: Int // 0-indexed
    var variant: PDSProgressVariant = .accent
    var orientation: PDSStepOrientation = .horizontal
    
    var body: some View {
        Group {
            switch orientation {
            case .horizontal:
                horizontalLayout
            case .vertical:
                verticalLayout
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Progress steps")
        .accessibilityValue("Step \(currentStep + 1) of \(steps.count): \(steps[currentStep])")
    }
    
    private var horizontalLayout: some View {
        HStack(spacing: 16) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                stepIndicator(index: index, label: step)
            }
        }
    }
    
    private var verticalLayout: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 12) {
                        stepCircle(index: index)
                        
                        Text(step)
                            .typography(index == currentStep ? Typography.headline4Emphasized : Typography.body4)
                            .foregroundColor(index <= currentStep ? Colors.textPrimary : Colors.gray400)
                    }
                    
                    if index < steps.count - 1 {
                        HStack(spacing: 12) {
                            verticalConnector(isComplete: index < currentStep)
                                .frame(width: 28)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
    
    private func stepIndicator(index: Int, label: String) -> some View {
        VStack(spacing: 8) {
            stepCircle(index: index)
            
            Text(label)
                .typography(Typography.meta4)
                .foregroundColor(index <= currentStep ? Colors.textPrimary : Colors.gray400)
                .lineLimit(1)
        }
        .frame(minWidth: 60)
    }
    
    private func stepCircle(index: Int) -> some View {
        ZStack {
            Circle()
                .fill(index < currentStep ? variant.color : (index == currentStep ? variant.color : Colors.backgroundDeemphasized))
                .frame(width: 28, height: 28)
            
            if index < currentStep {
                Image(systemName: "checkmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            } else {
                Text("\(index + 1)")
                    .typography(Typography.meta3)
                    .foregroundColor(index == currentStep ? .white : Colors.gray400)
            }
        }
    }
    
    private func connector(isComplete: Bool) -> some View {
        Rectangle()
            .fill(isComplete ? variant.color : Colors.backgroundDeemphasized)
            .frame(height: 2)
            .frame(minWidth: 24)
    }
    
    private func verticalConnector(isComplete: Bool) -> some View {
        Rectangle()
            .fill(isComplete ? variant.color : Colors.backgroundDeemphasized)
            .frame(width: 2, height: 24)
    }
}

enum PDSStepOrientation {
    case horizontal
    case vertical
}

// MARK: - Progress Stepper

/// A segmented progress indicator with discrete sections
struct PDSProgressStepper: View {
    let totalSections: Int
    let completedSections: Int
    var variant: PDSProgressVariant = .accent
    var spacing: CGFloat = 4
    var height: CGFloat = 4
    var cornerRadius: CGFloat = 2
    
    init(
        totalSections: Int = 4,
        completedSections: Int,
        variant: PDSProgressVariant = .accent,
        spacing: CGFloat = 4,
        height: CGFloat = 4
    ) {
        self.totalSections = max(1, totalSections)
        self.completedSections = min(max(0, completedSections), totalSections)
        self.variant = variant
        self.spacing = spacing
        self.height = height
        self.cornerRadius = height / 2
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<totalSections, id: \.self) { index in
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(index < completedSections ? variant.color : Colors.backgroundDeemphasized)
                    .frame(height: height)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Progress")
        .accessibilityValue("\(completedSections) of \(totalSections) sections complete")
    }
}

// MARK: - Streak Indicator

/// A streak display for habit tracking
struct PDSStreakIndicator: View {
    let count: Int
    var style: PDSStreakStyle = .flame
    var size: PDSStreakSize = .medium
    var isActive: Bool = true
    
    @ViewBuilder
    private var iconView: some View {
        switch style {
        case .flame:
            Text("🔥")
                .font(.system(size: size.iconSize))
        case .lightning:
            Text("⚡️")
                .font(.system(size: size.iconSize))
        case .star:
            Text("⭐️")
                .font(.system(size: size.iconSize))
        case .calendar:
            Image(systemName: "calendar")
                .font(.system(size: size.iconSize * 0.8, weight: .semibold))
                .foregroundColor(isActive ? Colors.persistentWarning : Colors.gray400)
        }
    }
    
    var body: some View {
        HStack(spacing: size.spacing) {
            // Icon
            iconView
                .opacity(isActive ? 1.0 : 0.5)
            
            // Count
            VStack(alignment: .leading, spacing: 0) {
                Text("\(count)")
                    .typography(size.countTypography)
                    .foregroundColor(isActive ? Colors.textPrimary : Colors.gray400)
                
                if size != .small {
                    Text(count == 1 ? "day" : "days")
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                }
            }
        }
        .padding(.horizontal, size.padding)
        .padding(.vertical, size.padding * 0.75)
        .background(
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .fill(isActive ? Colors.persistentWarning.opacity(0.15) : Colors.backgroundDeemphasized)
        )
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(streakAccessibilityLabel)
        .accessibilityValue(isActive ? "Active" : "Inactive")
    }
    
    private var streakAccessibilityLabel: String {
        let styleName: String
        switch style {
        case .flame: styleName = "fire"
        case .lightning: styleName = "lightning"
        case .star: styleName = "star"
        case .calendar: styleName = "calendar"
        }
        return "\(count) day \(styleName) streak"
    }
}

enum PDSStreakStyle {
    case flame
    case lightning
    case star
    case calendar
}

enum PDSStreakSize {
    case small
    case medium
    case large
    
    var iconSize: CGFloat {
        switch self {
        case .small: return 16
        case .medium: return 24
        case .large: return 32
        }
    }
    
    var countTypography: Typography.Style {
        switch self {
        case .small: return Typography.headline4Emphasized
        case .medium: return Typography.headline3Emphasized
        case .large: return Typography.headline2Emphasized
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .small: return 4
        case .medium: return 8
        case .large: return 12
        }
    }
    
    var padding: CGFloat {
        switch self {
        case .small: return 8
        case .medium: return 12
        case .large: return 16
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .small: return 8
        case .medium: return 12
        case .large: return 16
        }
    }
}

// MARK: - Previews

#Preview("Progress Bar") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            // Variants
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Variants")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text("Different color variants for context")
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            VStack(spacing: 16) {
                PDSProgressBar(progress: 0.65, variant: .accent)
                PDSProgressBar(progress: 0.8, variant: .positive)
                PDSProgressBar(progress: 0.45, variant: .warning)
                PDSProgressBar(progress: 0.3, variant: .negative)
                PDSProgressBar(progress: 0.5, variant: .neutral)
            }
            
            // Sizes
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Sizes")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            VStack(spacing: 16) {
                PDSProgressBar(progress: 0.6, size: .small)
                PDSProgressBar(progress: 0.6, size: .medium)
                PDSProgressBar(progress: 0.6, size: .large)
            }
            
            // With Label
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("With Label")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSProgressBar(progress: 0.72, showLabel: true)
            
            // Indeterminate
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Indeterminate")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSProgressBar(progress: 0, isIndeterminate: true)
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Progress Ring") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            // Sizes
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Sizes")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 24) {
                PDSProgressRing(progress: 0.72, size: .small)
                PDSProgressRing(progress: 0.72, size: .medium)
                PDSProgressRing(progress: 0.72, size: .large)
            }
            
            // Variants
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Variants")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 24) {
                PDSProgressRing(progress: 0.65, variant: .accent, size: .medium)
                PDSProgressRing(progress: 0.8, variant: .positive, size: .medium)
                PDSProgressRing(progress: 0.45, variant: .warning, size: .medium)
                PDSProgressRing(progress: 0.3, variant: .negative, size: .medium)
            }
            
            // Label Styles
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Label Styles")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 24) {
                PDSProgressRing(progress: 0.72, size: .large, labelStyle: .percentage)
                PDSProgressRing(progress: 0.6, size: .large, labelStyle: .fraction(current: 6, total: 10))
                PDSProgressRing(progress: 1.0, variant: .positive, size: .large, labelStyle: .custom("Done!"))
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Progress Steps") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            // Horizontal
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Horizontal")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSProgressSteps(
                steps: ["Account", "Profile", "Preferences", "Done"],
                currentStep: 1
            )
            
            // Vertical
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Vertical")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSProgressSteps(
                steps: ["Create account", "Set up profile", "Choose preferences", "Start exploring"],
                currentStep: 2,
                orientation: .vertical
            )
            
            // Segmented Stepper
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Segmented Stepper")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text("Simple progress sections")
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            VStack(spacing: 16) {
                PDSProgressStepper(totalSections: 4, completedSections: 0)
                PDSProgressStepper(totalSections: 4, completedSections: 1)
                PDSProgressStepper(totalSections: 4, completedSections: 2)
                PDSProgressStepper(totalSections: 4, completedSections: 3)
                PDSProgressStepper(totalSections: 4, completedSections: 4, variant: .positive)
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Streak Indicator") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            // Styles
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Styles")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 16) {
                PDSStreakIndicator(count: 14, style: .flame)
                PDSStreakIndicator(count: 7, style: .lightning)
                PDSStreakIndicator(count: 30, style: .star)
                PDSStreakIndicator(count: 5, style: .calendar)
            }
            
            // Sizes
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Sizes")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 16) {
                PDSStreakIndicator(count: 14, size: .small)
                PDSStreakIndicator(count: 14, size: .medium)
                PDSStreakIndicator(count: 14, size: .large)
            }
            
            // Active vs Inactive
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("States")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 16) {
                PDSStreakIndicator(count: 14, isActive: true)
                PDSStreakIndicator(count: 0, isActive: false)
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

