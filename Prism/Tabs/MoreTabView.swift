//
//  MoreTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

// MARK: - Appearance Mode

enum AppearanceMode: String, CaseIterable {
    case auto = "auto"
    case light = "light"
    case dark = "dark"
    
    var displayName: String {
        switch self {
        case .auto: return "Auto"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }
    
    var icon: String {
        switch self {
        case .auto: return "circle.lefthalf.filled"
        case .light: return "sun.max.fill"
        case .dark: return "moon.fill"
        }
    }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .auto: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}

struct MoreTabView: View {
    @State private var toggleState1 = true
    @State private var toggleState3 = true
    @AppStorage("appearanceMode") private var appearanceMode: String = AppearanceMode.auto.rawValue
    
    private var selectedMode: AppearanceMode {
        AppearanceMode(rawValue: appearanceMode) ?? .auto
    }
    
    var body: some View {
        List {
            Section {
                HStack(spacing: 12) {
                    Image(systemName: selectedMode.icon)
                        .font(.system(size: 16))
                        .foregroundColor(Colors.iconPrimary)
                        .frame(width: 24)
                    
                    Picker("Appearance", selection: $appearanceMode) {
                        ForEach(AppearanceMode.allCases, id: \.rawValue) { mode in
                            Text(mode.displayName).tag(mode.rawValue)
                        }
                    }
                }
            } header: {
                Text("Appearance")
            }
            
            Section {
                NavigationLink {
                    ColorsShowcaseView()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "paintpalette.fill")
                            .font(.system(size: 16))
                            .foregroundColor(Colors.iconPrimary)
                            .frame(width: 24)
                        Text("Colors")
                    }
                }
                
                NavigationLink {
                    TypographyShowcaseView()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "textformat")
                            .font(.system(size: 16))
                            .foregroundColor(Colors.iconPrimary)
                            .frame(width: 24)
                        Text("Typography")
                    }
                }
                
                NavigationLink {
                    ShadowsShowcaseView()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "square.stack.3d.up.fill")
                            .font(.system(size: 16))
                            .foregroundColor(Colors.iconPrimary)
                            .frame(width: 24)
                        Text("Shadows")
                    }
                }
            } header: {
                Text("Foundations")
            }
            
            Section {
                NavigationLink {
                    ButtonsDetailView()
                } label: {
                    Text("Buttons")
                }
                
                NavigationLink {
                    IconButtonsDetailView()
                } label: {
                    Text("Icon Buttons")
                }
                
                NavigationLink {
                    ActionChipsDetailView()
                } label: {
                    Text("Action Chips")
                }
                
                NavigationLink {
                    ListCellsDetailView()
                } label: {
                    Text("List Cells")
                }
                
                NavigationLink {
                    InstantFeedbackDetailView()
                } label: {
                    Text("Instant Feedback")
                }
                
                NavigationLink {
                    SubNavigationDetailView()
                } label: {
                    Text("Sub Navigation")
                }
            } header: {
                Text("Components")
            }
            
            Section {
                Toggle("Notifications", isOn: $toggleState1)
                    .pdsToggle()
                
                Toggle("Push Alerts", isOn: $toggleState3)
                    .pdsToggle()
            } header: {
                Text("Toggles")
            }
        }
    }
}

// MARK: - Colors Showcase

struct ColorsShowcaseView: View {
    private let steps = ["50", "100", "200", "300", "400", "500", "600", "700", "800", "900", "950"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Semantic Colors
                semanticColorsSection
                
                // Raw Color Palette
                rawColorPaletteSection
            }
            .padding(20)
        }
        .background(Colors.surfaceBackground)
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - Raw Color Palette
    
    private var rawColorPaletteSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Header
            Text("Color Palette")
                .typography(Typography.headline2Emphasized)
                .foregroundColor(Colors.textPrimary)
            
            // Step Numbers + Color Rows
            VStack(alignment: .leading, spacing: 12) {
                // Step Numbers Header
                HStack(spacing: 0) {
                    // Spacer for color name column
                    Color.clear
                        .frame(width: 70)
                    
                    ForEach(steps, id: \.self) { step in
                        Text(step)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                // Color Rows
                colorRow("Red", colors: [
                    Colors.red50, Colors.red100, Colors.red200, Colors.red300, Colors.red400,
                    Colors.red500, Colors.red600, Colors.red700, Colors.red800, Colors.red900, Colors.red950
                ])
                
                colorRow("Orange", colors: [
                    Colors.orange50, Colors.orange100, Colors.orange200, Colors.orange300, Colors.orange400,
                    Colors.orange500, Colors.orange600, Colors.orange700, Colors.orange800, Colors.orange900, Colors.orange950
                ])
                
                colorRow("Yellow", colors: [
                    Colors.yellow50, Colors.yellow100, Colors.yellow200, Colors.yellow300, Colors.yellow400,
                    Colors.yellow500, Colors.yellow600, Colors.yellow700, Colors.yellow800, Colors.yellow900, Colors.yellow950
                ])
                
                colorRow("Lime", colors: [
                    Colors.lime50, Colors.lime100, Colors.lime200, Colors.lime300, Colors.lime400,
                    Colors.lime500, Colors.lime600, Colors.lime700, Colors.lime800, Colors.lime900, Colors.lime950
                ])
                
                colorRow("Green", colors: [
                    Colors.green50, Colors.green100, Colors.green200, Colors.green300, Colors.green400,
                    Colors.green500, Colors.green600, Colors.green700, Colors.green800, Colors.green900, Colors.green950
                ])
                
                colorRow("Teal", colors: [
                    Colors.teal50, Colors.teal100, Colors.teal200, Colors.teal300, Colors.teal400,
                    Colors.teal500, Colors.teal600, Colors.teal700, Colors.teal800, Colors.teal900, Colors.teal950
                ])
                
                colorRow("Cyan", colors: [
                    Colors.cyan50, Colors.cyan100, Colors.cyan200, Colors.cyan300, Colors.cyan400,
                    Colors.cyan500, Colors.cyan600, Colors.cyan700, Colors.cyan800, Colors.cyan900, Colors.cyan950
                ])
                
                colorRow("Blue", colors: [
                    Colors.blue50, Colors.blue100, Colors.blue200, Colors.blue300, Colors.blue400,
                    Colors.blue500, Colors.blue600, Colors.blue700, Colors.blue800, Colors.blue900, Colors.blue950
                ])
                
                colorRow("Violet", colors: [
                    Colors.violet50, Colors.violet100, Colors.violet200, Colors.violet300, Colors.violet400,
                    Colors.violet500, Colors.violet600, Colors.violet700, Colors.violet800, Colors.violet900, Colors.violet950
                ])
                
                colorRow("Purple", colors: [
                    Colors.purple50, Colors.purple100, Colors.purple200, Colors.purple300, Colors.purple400,
                    Colors.purple500, Colors.purple600, Colors.purple700, Colors.purple800, Colors.purple900, Colors.purple950
                ])
                
                colorRow("Fuchsia", colors: [
                    Colors.fuchsia50, Colors.fuchsia100, Colors.fuchsia200, Colors.fuchsia300, Colors.fuchsia400,
                    Colors.fuchsia500, Colors.fuchsia600, Colors.fuchsia700, Colors.fuchsia800, Colors.fuchsia900, Colors.fuchsia950
                ])
                
                colorRow("Magenta", colors: [
                    Colors.magenta50, Colors.magenta100, Colors.magenta200, Colors.magenta300, Colors.magenta400,
                    Colors.magenta500, Colors.magenta600, Colors.magenta700, Colors.magenta800, Colors.magenta900, Colors.magenta950
                ])
                
                colorRow("Pink", colors: [
                    Colors.pink50, Colors.pink100, Colors.pink200, Colors.pink300, Colors.pink400,
                    Colors.pink500, Colors.pink600, Colors.pink700, Colors.pink800, Colors.pink900, Colors.pink950
                ])
                
                colorRow("Gray", colors: [
                    Colors.gray50, Colors.gray100, Colors.gray200, Colors.gray300, Colors.gray400,
                    Colors.gray500, Colors.gray600, Colors.gray700, Colors.gray800, Colors.gray900, Colors.gray950
                ])
            }
        }
    }
    
    private func colorRow(_ name: String, colors: [Color]) -> some View {
        HStack(spacing: 0) {
            // Color name
            Text(name)
                .typography(Typography.body3)
                .foregroundColor(Colors.textPrimary)
                .frame(width: 70, alignment: .leading)
            
            // Color swatches
            HStack(spacing: 2) {
                ForEach(0..<colors.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(colors[index])
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
    
    private var semanticColorsSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Header
            VStack(alignment: .leading, spacing: 4) {
            Text("Semantic Colors")
                .typography(Typography.headline2Emphasized)
                    .foregroundColor(Colors.textPrimary)
            
                Text("Spectrum tokens - adaptive for light/dark mode")
                .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
            }
            
            // Persistent
            semanticColorGroup(title: "Persistent", colors: [
                ("Accent", Colors.persistentAccent),
                ("Accent Deemphasized", Colors.persistentAccentDeemphasized),
                ("Negative", Colors.persistentNegative),
                ("Negative Deemphasized", Colors.persistentNegativeDeemphasized),
                ("Positive", Colors.persistentPositive),
                ("Positive Deemphasized", Colors.persistentPositiveDeemphasized),
                ("Always White", Colors.persistentAlwaysWhite),
                ("Always Black", Colors.persistentAlwaysBlack),
            ])
            
            // Text
            semanticColorGroup(title: "Text", colors: [
                ("Primary", Colors.textPrimary),
                ("Secondary", Colors.textSecondary),
                ("Blue Link", Colors.textBlueLink),
                ("Placeholder", Colors.textPlaceholder),
                ("Disabled", Colors.textDisabled),
                ("Primary On Color", Colors.textPrimaryOnColor),
                ("Primary On Media", Colors.textPrimaryOnMedia),
                ("Secondary On Color", Colors.textSecondaryOnColor),
                ("Secondary On Media", Colors.textSecondaryOnMedia),
            ])
            
            // Icon
            semanticColorGroup(title: "Icon", colors: [
                ("Primary", Colors.iconPrimary),
                ("Secondary", Colors.iconSecondary),
                ("Placeholder", Colors.iconPlaceholder),
                ("Primary On Color", Colors.iconPrimaryOnColor),
                ("Primary On Media", Colors.iconPrimaryOnMedia),
            ])
            
            // Background
            semanticColorGroup(title: "Background", colors: [
                ("Surface", Colors.backgroundSurface, true),
                ("Card", Colors.backgroundCard, true),
                ("Deemphasized", Colors.backgroundDeemphasized, false),
                ("Wash", Colors.backgroundWash, false),
                ("Divider", Colors.backgroundDivider, false),
                ("Card Dark", Colors.backgroundCardDark, false),
                ("Overlay On Media", Colors.backgroundOverlayOnMedia, false),
                ("Overlay On Media Light", Colors.backgroundOverlayOnMediaLight, false),
            ])
            
            // Elevation (Borders)
            semanticColorGroup(title: "Elevation / Borders", colors: [
                ("Border Emphasis", Colors.elevationBorderEmphasis),
                ("Border Persistent", Colors.elevationBorderPersistent),
                ("Border Responsive", Colors.elevationBorderResponsive),
            ])
            
            // Interactive
            semanticColorGroup(title: "Interactive", colors: [
                ("Primary", Colors.interactivePrimary),
                ("Primary Pressed", Colors.interactivePrimaryPressed),
            ])
        }
    }
    
    private func semanticColorGroup(title: String, colors: [(String, Color, Bool)]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .typography(Typography.headline4Emphasized)
                .foregroundColor(Colors.textPrimary)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                ForEach(colors, id: \.0) { item in
                    SemanticColorCard(name: item.0, color: item.1, showBorder: item.2)
                }
            }
        }
    }
    
    private func semanticColorGroup(title: String, colors: [(String, Color)]) -> some View {
        semanticColorGroup(title: title, colors: colors.map { ($0.0, $0.1, false) })
    }
    
}

struct SemanticColorCard: View {
    let name: String
    let color: Color
    var showBorder: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Colors.elevationBorderEmphasis, lineWidth: 1)
                )
            
            Text(name)
                .typography(Typography.meta3)
                .foregroundColor(Colors.textSecondary)
        }
    }
}

// MARK: - Typography Showcase

struct TypographyShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                typographySection(title: "Headlines", items: [
                    ("Headline 0 Emphasized", Typography.headline0Emphasized),
                    ("Headline 1 Emphasized", Typography.headline1Emphasized),
                    ("Headline 2 Emphasized", Typography.headline2Emphasized),
                    ("Headline 3 Emphasized", Typography.headline3Emphasized),
                    ("Headline 4 Emphasized", Typography.headline4Emphasized),
                    ("Headline 3", Typography.headline3),
                    ("Headline 4", Typography.headline4),
                    ("Headline 3 Deemphasized", Typography.headline3Deemphasized),
                    ("Headline 4 Deemphasized", Typography.headline4Deemphasized),
                ])
                
                typographySection(title: "Body", items: [
                    ("Body 1", Typography.body1),
                    ("Body 2", Typography.body2),
                    ("Body 3", Typography.body3),
                    ("Body 4", Typography.body4),
                    ("Body 1 Link", Typography.body1Link),
                    ("Body 2 Link", Typography.body2Link),
                    ("Body 3 Link", Typography.body3Link),
                    ("Body 4 Link", Typography.body4Link),
                ])
                
                typographySection(title: "Button", items: [
                    ("Button 1", Typography.button1),
                    ("Button 2", Typography.button2),
                    ("Button 3", Typography.button3),
                ])
                
                typographySection(title: "Meta", items: [
                    ("Meta 1", Typography.meta1),
                    ("Meta 2", Typography.meta2),
                    ("Meta 3", Typography.meta3),
                    ("Meta 3 Link", Typography.meta3Link),
                    ("Meta 4", Typography.meta4),
                    ("Meta 4 Link", Typography.meta4Link),
                ])
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .background(Colors.surfaceBackground)
        .navigationTitle("Typography")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func typographySection(title: String, items: [(String, Typography.Style)]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .typography(Typography.headline2Emphasized)
                .foregroundColor(Colors.primaryText)
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(items, id: \.0) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.0)
                            .typography(item.1)
                            .foregroundColor(Colors.primaryText)
                        
                        Text(item.0)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.tertiaryText)
                    }
                }
            }
        }
    }
}

// MARK: - Shadows Showcase

struct ShadowsShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text("Shadow Styles")
                    .typography(Typography.headline2Emphasized)
                    .foregroundColor(Colors.primaryText)
                
                Text("Elevation and depth effects for UI elements")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.secondaryText)
                
                // UI Emphasis
                shadowCard(
                    title: "UI Emphasis",
                    description: "Single shadow for elevated cards and floating elements",
                    content: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Colors.cardBackground)
                            .frame(height: 100)
                            .shadow(Shadow.uiEmphasis)
                    }
                )
                
                // Responsive UI
                shadowCard(
                    title: "Responsive UI",
                    description: "Stronger shadow for interactive/draggable elements",
                    content: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Colors.cardBackground)
                            .frame(height: 100)
                            .shadow(Shadow.responsiveUI)
                    }
                )
                
                // Persistent UI
                shadowCard(
                    title: "Persistent UI",
                    description: "Multi-layer shadow for navigation bars and tab bars",
                    content: {
        VStack {
                            Spacer()
                            Rectangle()
                                .fill(Colors.cardBackground)
                                .frame(height: 60)
                                .shadow(Shadow.persistentUI)
                        }
                        .frame(height: 120)
                        .clipped()
                    }
                )
                
                // Text on Media
                shadowCard(
                    title: "Text & Icon on Media",
                    description: "Multi-layer shadow for text visibility on images",
                    content: {
                        ZStack {
                            Image("Posts/SampleMedia")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            VStack(spacing: 8) {
                                Image(systemName: "play.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Colors.white)
                                    .shadow(Shadow.textAndIconOnMedia)
                                
                                Text("Watch Now")
                                    .typography(Typography.button1)
                                    .foregroundColor(Colors.white)
                                    .shadow(Shadow.textAndIconOnMedia)
                            }
                        }
                        .frame(height: 120)
                    }
                )
            }
            .padding(20)
        }
        .background(Colors.surfaceBackground)
        .navigationTitle("Shadows")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func shadowCard<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.primaryText)
                
                Text(description)
                    .typography(Typography.body4)
                    .foregroundColor(Colors.secondaryText)
            }
            
            content()
                .padding(16)
                .background(Colors.surfaceSecondary)
                .cornerRadius(12)
        }
    }
}

// MARK: - Components Showcase

struct ComponentsShowcaseView: View {
    var body: some View {
        List {
            NavigationLink {
                ButtonsDetailView()
            } label: {
                Label("Buttons", systemImage: "rectangle.fill")
            }
            
            NavigationLink {
                IconButtonsDetailView()
            } label: {
                Label("Icon Buttons", systemImage: "circle.fill")
            }
            
            NavigationLink {
                TogglesDetailView()
            } label: {
                Label("Toggles", systemImage: "switch.2")
            }
            
            NavigationLink {
                ActionChipsDetailView()
            } label: {
                Label("Action Chips", systemImage: "capsule.fill")
            }
            
            NavigationLink {
                ListCellsDetailView()
            } label: {
                Label("List Cells", systemImage: "list.bullet")
            }
        }
        .navigationTitle("Components")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Buttons Detail View

struct ButtonsDetailView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Standard Variants
                buttonSection(title: "Standard Variants") {
                    VStack(spacing: 12) {
                        Button("Primary") { }
                            .pdsButton(variant: .primary, width: .fullWidth)
                        
                        Button("Primary Deemphasized") { }
                            .pdsButton(variant: .primaryDeemphasized, width: .fullWidth)
                        
                        Button("Secondary") { }
                            .pdsButton(variant: .secondary, width: .fullWidth)
                        
                        Button("Destructive") { }
                            .pdsButton(variant: .destructive, width: .fullWidth)
                    }
                }
                
                Divider()
                
                // On Color Context
                buttonSection(title: "On Color") {
                    VStack(spacing: 12) {
                        Button("Primary on Color") { }
                            .pdsButton(variant: .primary, context: .onColor, width: .fullWidth)
                        
                        Button("Secondary on Color") { }
                            .pdsButton(variant: .secondary, context: .onColor, width: .fullWidth)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: CornerRadius.card)
                            .fill(Colors.persistentPositive)
                    )
                }
                
                Divider()
                
                // On Media Context
                buttonSection(title: "On Media") {
                    ZStack {
                        Image("Posts/SampleMedia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
                        
                        VStack(spacing: 12) {
                            Button("Primary on Media") { }
                                .pdsButton(variant: .primary, context: .onMedia, width: .fullWidth)
                            
                            Button("Secondary on Media") { }
                                .pdsButton(variant: .secondary, context: .onMedia, width: .fullWidth)
                        }
                        .padding(16)
                    }
                }
                
                Divider()
                
                // Icon + Label
                buttonSection(title: "Icon + Label") {
                    VStack(spacing: 12) {
                        Button("Add Photo") { }
                            .pdsButton(variant: .primary, width: .fullWidth, icon: "photo")
                        
                        Button("Select") { }
                            .pdsButton(variant: .secondary, width: .fullWidth, icon: "chevron.down", iconPosition: .trailing)
                    }
                }
                
                Divider()
                
                // Icon Only
                buttonSection(title: "Icon Only") {
                    HStack(spacing: 16) {
                        Button { } label: {
                            Image(systemName: "plus")
                        }
                        .pdsIconButton(variant: .primary)
                        
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(variant: .primaryDeemphasized)
                        
                        Button { } label: {
                            Image(systemName: "ellipsis")
                        }
                        .pdsIconButton(variant: .secondary)
                        
                        Button { } label: {
                            Image(systemName: "trash")
                        }
                        .pdsIconButton(variant: .destructive)
                    }
                }
                
                Divider()
                
                // Size Variants
                buttonSection(title: "Size Variants") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Large")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                        
                        Button("Large Button") { }
                            .pdsButton(variant: .primary, size: .large)
                        
                        Text("Medium (Default)")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                            .padding(.top, 8)
                        
                        Button("Medium Button") { }
                            .pdsButton(variant: .primary, size: .medium)
                        
                        Text("Small")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                            .padding(.top, 8)
                        
                        Button("Small Button") { }
                            .pdsButton(variant: .primary, size: .small)
                    }
                }
                
                Divider()
                
                // Width Modes
                buttonSection(title: "Width Modes") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Flexible (fits content)")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                        
                        Button("Save") { }
                            .pdsButton(variant: .primary, width: .flexible)
                        
                        Text("Full Width")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                            .padding(.top, 8)
                        
                        Button("Save") { }
                            .pdsButton(variant: .primary, width: .fullWidth)
                    }
                }
                
                Divider()
                
                // Disabled State
                buttonSection(title: "Disabled") {
                    Button("Submit") { }
                        .pdsButton(variant: .primary, width: .fullWidth, isEnabled: false)
                }
                
                Spacer().frame(height: 40)
            }
            .padding(24)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Buttons")
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private func buttonSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .typography(Typography.headline4Emphasized)
                .foregroundColor(Colors.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            content()
        }
    }
}

// MARK: - Icon Buttons Detail View

struct IconButtonsDetailView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Size Variants
                iconSection(title: "Size Variants") {
                    HStack(spacing: 24) {
                        VStack(spacing: 8) {
                            Button { } label: {
                                Image(systemName: "heart")
                            }
                            .pdsIconButton(size: .regular)
                            
                            Text("24pt")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            Button { } label: {
                                Image(systemName: "heart")
                            }
                            .pdsIconButton(size: .small)
                            
                            Text("20pt")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
                
                Divider()
                
                // Primary Color (Default)
                iconSection(title: "Primary (Default)") {
                    HStack(spacing: 16) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(variant: .primary)
                        
                        Button { } label: {
                            Image(systemName: "message")
                        }
                        .pdsIconButton(variant: .primary)
                        
                        Button { } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .pdsIconButton(variant: .primary)
                        
                        Button { } label: {
                            Image(systemName: "ellipsis")
                        }
                        .pdsIconButton(variant: .primary)
                    }
                }
                
                Divider()
                
                // Secondary Color
                iconSection(title: "Secondary") {
                    HStack(spacing: 16) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(variant: .secondary)
                        
                        Button { } label: {
                            Image(systemName: "message")
                        }
                        .pdsIconButton(variant: .secondary)
                        
                        Button { } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .pdsIconButton(variant: .secondary)
                        
                        Button { } label: {
                            Image(systemName: "ellipsis")
                        }
                        .pdsIconButton(variant: .secondary)
                    }
                }
                
                Divider()
                
                // On Media
                iconSection(title: "On Media") {
                    ZStack(alignment: .leading) {
                        Image("Posts/SampleMedia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
                        
                        VStack(alignment: .leading, spacing: 20) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Primary")
                                    .typography(Typography.meta3)
                                    .foregroundColor(Colors.textPrimaryOnMedia)
                                
                                HStack(spacing: 16) {
                                    Button { } label: {
                                        Image(systemName: "heart")
                                    }
                                    .pdsIconButton(variant: .onMediaPrimary)
                                    
                                    Button { } label: {
                                        Image(systemName: "message")
                                    }
                                    .pdsIconButton(variant: .onMediaPrimary)
                                    
                                    Button { } label: {
                                        Image(systemName: "xmark")
                                    }
                                    .pdsIconButton(variant: .onMediaPrimary)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Secondary")
                                    .typography(Typography.meta3)
                                    .foregroundColor(Colors.textPrimaryOnMedia)
                                
                                HStack(spacing: 16) {
                                    Button { } label: {
                                        Image(systemName: "heart")
                                    }
                                    .pdsIconButton(variant: .onMediaSecondary)
                                    
                                    Button { } label: {
                                        Image(systemName: "message")
                                    }
                                    .pdsIconButton(variant: .onMediaSecondary)
                                    
                                    Button { } label: {
                                        Image(systemName: "xmark")
                                    }
                                    .pdsIconButton(variant: .onMediaSecondary)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                }
                
                Divider()
                
                // Disabled
                iconSection(title: "Disabled") {
                    HStack(spacing: 16) {
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(variant: .primary, isEnabled: false)
                        
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsIconButton(variant: .secondary, isEnabled: false)
                    }
                }
                
                Spacer().frame(height: 40)
            }
            .padding(24)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Icon Buttons")
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private func iconSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .typography(Typography.headline4Emphasized)
                .foregroundColor(Colors.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            content()
        }
    }
}

// MARK: - Toggles Detail View

struct TogglesDetailView: View {
    @State private var toggleState1 = true
    @State private var toggleState2 = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Toggle("Notifications", isOn: $toggleState1)
                    .pdsToggle()
                
                Toggle("Dark Mode", isOn: $toggleState2)
                    .pdsToggle()
                
                Toggle("Push Alerts", isOn: .constant(true))
                    .pdsToggle()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Toggles")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Action Chips Detail View

struct ActionChipsDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Standard chips
                VStack(alignment: .leading, spacing: 8) {
                    Text("Selection")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                    
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
                
                // With icons
                VStack(alignment: .leading, spacing: 8) {
                    Text("With Icons")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                    
                    HStack(spacing: 8) {
                        Button("Filter") { }
                            .pdsActionChip(icon: "slider.horizontal.3")
                        Button("Sort") { }
                            .pdsActionChip(icon: "arrow.up.arrow.down")
                        Button("Date") { }
                            .pdsActionChip(isSelected: true, icon: "calendar")
                    }
                }
                
                // Dismissible
                VStack(alignment: .leading, spacing: 8) {
                    Text("Dismissible")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                    
                    HStack(spacing: 8) {
                        Button("San Francisco") { }
                            .pdsDismissibleChip()
                        Button("Photography") { }
                            .pdsDismissibleChip()
                    }
                }
                
                // Emoji reactions
                VStack(alignment: .leading, spacing: 8) {
                    Text("Reactions")
                        .typography(Typography.meta3)
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Action Chips")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - List Cells Detail View

struct ListCellsDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Basic
                VStack(alignment: .leading, spacing: 4) {
                    Text("Basic Cell")
                        .typography(Typography.body2)
                        .foregroundColor(Colors.textPrimary)
                }
                
                // With subtitle
                VStack(alignment: .leading, spacing: 4) {
                    Text("With Subtitle")
                        .typography(Typography.body2)
                        .foregroundColor(Colors.textPrimary)
                    Text("Secondary information here")
                        .typography(Typography.body4)
                        .foregroundColor(Colors.textSecondary)
                }
                
                // Navigation
                HStack {
                    Text("Navigation Cell")
                        .typography(Typography.body2)
                        .foregroundColor(Colors.textPrimary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Colors.iconSecondary)
                }
                
                // With icon
                HStack(spacing: 12) {
                    PDSIconLeading(systemName: "globe")
                    Text("With Icon")
                        .typography(Typography.body2)
                        .foregroundColor(Colors.textPrimary)
                }
                
                // With avatar
                HStack(spacing: 12) {
                    PDSAvatarLeading(image: "person.fill")
                    VStack(alignment: .leading, spacing: 2) {
                        Text("With Avatar")
                            .typography(Typography.body2)
                            .foregroundColor(Colors.textPrimary)
                        Text("Online now")
                            .typography(Typography.body4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
                
                // Toggle
                Toggle("Toggle Cell", isOn: .constant(true))
                    .pdsToggle()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("List Cells")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Instant Feedback Detail View

struct InstantFeedbackDetailView: View {
    @State private var showNeutral = false
    @State private var showSuccess = false
    @State private var showError = false
    @State private var showWarning = false
    @State private var showWithAction = false
    @State private var showCustomIcon = false
    @State private var showTopPosition = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Types section
                    VStack(spacing: 12) {
                        Text("Types")
                            .typography(Typography.meta1)
                            .foregroundColor(Colors.textSecondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: { showNeutral = true }) {
                            Text("Neutral").frame(maxWidth: .infinity)
                        }
                        .pdsPrimaryButton()
                        
                        Button(action: { showSuccess = true }) {
                            Text("Success").frame(maxWidth: .infinity)
                        }
                        .pdsPrimaryButton()
                        
                        Button(action: { showError = true }) {
                            Text("Error").frame(maxWidth: .infinity)
                        }
                        .pdsPrimaryButton()
                        
                        Button(action: { showWarning = true }) {
                            Text("Warning").frame(maxWidth: .infinity)
                        }
                        .pdsPrimaryButton()
                    }
                    
                    Divider()
                    
                    // Variations section
                    VStack(spacing: 12) {
                        Text("Variations")
                            .typography(Typography.meta1)
                            .foregroundColor(Colors.textSecondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: { showWithAction = true }) {
                            Text("With Action Button").frame(maxWidth: .infinity)
                        }
                        .pdsSecondaryButton()
                        
                        Button(action: { showCustomIcon = true }) {
                            Text("Custom Icon").frame(maxWidth: .infinity)
                        }
                        .pdsSecondaryButton()
                        
                        Button(action: { showTopPosition = true }) {
                            Text("Top Position").frame(maxWidth: .infinity)
                        }
                        .pdsSecondaryButton()
                    }
                    
                    Spacer().frame(height: 80)
                }
                .padding(24)
            }
            .background(Colors.backgroundSurface)
        }
        .navigationTitle("Instant Feedback")
        .navigationBarTitleDisplayMode(.large)
        .pdsInstantFeedback(
            message: "This is a neutral message",
            type: .neutral,
            isPresented: $showNeutral
        )
        .pdsInstantFeedback(
            message: "Post shared successfully!",
            type: .success,
            isPresented: $showSuccess
        )
        .pdsInstantFeedback(
            message: "Unable to connect. Check your network.",
            type: .error,
            isPresented: $showError
        )
        .pdsInstantFeedback(
            message: "Your session will expire soon",
            type: .warning,
            isPresented: $showWarning
        )
        .pdsInstantFeedback(
            message: "Post deleted",
            type: .neutral,
            actionText: "Undo",
            action: { print("Undo tapped") },
            isPresented: $showWithAction
        )
        .pdsInstantFeedback(
            message: "Link copied to clipboard",
            icon: "link",
            isPresented: $showCustomIcon
        )
        .pdsInstantFeedback(
            message: "New notification received",
            type: .neutral,
            icon: "bell.fill",
            isPresented: $showTopPosition,
            position: .top
        )
    }
}

// MARK: - Sub Navigation Detail View

struct SubNavigationDetailView: View {
    @State private var selectedStandard = "all"
    @State private var selectedCallback = "posts"
    @State private var selectedScrollable = "item1"
    @State private var selectedOnMedia = "photos"
    @State private var callbackMessage = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Standard Navigation
                subNavSection(title: "Standard") {
                    PDSSubNavigationBar(
                        items: [
                            PDSSubNavItem(id: "all", title: "All"),
                            PDSSubNavItem(id: "posts", title: "Posts"),
                            PDSSubNavItem(id: "videos", title: "Videos"),
                            PDSSubNavItem(id: "tagged", title: "Tagged")
                        ],
                        selectedId: $selectedStandard
                    )
                }
                
                Divider()
                
                // With Callback Action
                subNavSection(title: "With Callback") {
                    VStack(spacing: 8) {
                        PDSSubNavigationBar(
                            items: [
                                PDSSubNavItem(id: "posts", title: "Posts"),
                                PDSSubNavItem(id: "photos", title: "Photos"),
                                PDSSubNavItem(id: "videos", title: "Videos")
                            ],
                            selectedId: $selectedCallback,
                            onItemSelected: { item in
                                callbackMessage = "Selected: \(item.title)"
                            }
                        )
                        
                        if !callbackMessage.isEmpty {
                            Text(callbackMessage)
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                                .padding(.horizontal, 16)
                        }
                    }
                }
                
                Divider()
                
                // Scrollable (Many Items)
                subNavSection(title: "Scrollable") {
                    PDSSubNavigationBar(
                        items: [
                            PDSSubNavItem(id: "item1", title: "For You"),
                            PDSSubNavItem(id: "item2", title: "Following"),
                            PDSSubNavItem(id: "item3", title: "Favorites"),
                            PDSSubNavItem(id: "item4", title: "Events"),
                            PDSSubNavItem(id: "item5", title: "Saved"),
                            PDSSubNavItem(id: "item6", title: "Trending"),
                            PDSSubNavItem(id: "item7", title: "Shop"),
                            PDSSubNavItem(id: "item8", title: "Latest")
                        ],
                        selectedId: $selectedScrollable
                    )
                }
                
                Divider()
                
                // On Media
                subNavSection(title: "On Media") {
                    ZStack {
                        Image("Posts/SampleMedia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
                        
                        PDSSubNavigationBar(
                            items: [
                                PDSSubNavItem(id: "photos", title: "Photos"),
                                PDSSubNavItem(id: "videos", title: "Videos"),
                                PDSSubNavItem(id: "albums", title: "Albums")
                            ],
                            selectedId: $selectedOnMedia,
                            context: .onMedia
                        )
                    }
                    .padding(.horizontal, 24)
                }
                
                Spacer().frame(height: 40)
            }
            .padding(.vertical, 24)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Sub Navigation")
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private func subNavSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .typography(Typography.headline4Emphasized)
                .foregroundColor(Colors.textPrimary)
                .padding(.horizontal, 24)
            
            content()
        }
    }
}

#Preview {
    NavigationStack {
        MoreTabView()
            .navigationTitle("More")
    }
}

