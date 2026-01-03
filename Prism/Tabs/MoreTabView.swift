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
                    IconsShowcaseView()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 16))
                            .foregroundColor(Colors.iconPrimary)
                            .frame(width: 24)
                        Text("Icons")
                    }
                }
                
                NavigationLink {
                    MotionShowcaseView()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "bolt.fill")
                            .font(.system(size: 16))
                            .foregroundColor(Colors.iconPrimary)
                            .frame(width: 24)
                        Text("Motion")
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
            } header: {
                Text("Foundations")
            }
            
            Section {
                NavigationLink {
                    ActionChipsDetailView()
                } label: {
                    Text("Action Chips")
                }
                
                NavigationLink {
                    ActorDetailView()
                } label: {
                    Text("Actor")
                }
                
                NavigationLink {
                    BadgeDetailView()
                } label: {
                    Text("Badges")
                }
                
                NavigationLink {
                    BottomSheetDetailView()
                } label: {
                    Text("Bottom Sheet")
                }
                
                NavigationLink {
                    ButtonsDetailView()
                } label: {
                    Text("Buttons")
                }
                
                NavigationLink {
                    ChartsDetailView()
                } label: {
                    Text("Charts")
                }
                
                NavigationLink {
                    CommentDetailView()
                } label: {
                    Text("Comment")
                }
                
                NavigationLink {
                    ComposerDetailView()
                } label: {
                    Text("Composers")
                }
                
                NavigationLink {
                    IconButtonsDetailView()
                } label: {
                    Text("Icon Buttons")
                }
                
                NavigationLink {
                    InstantFeedbackDetailView()
                } label: {
                    Text("Instant Feedback")
                }
                
                NavigationLink {
                    ListCellsDetailView()
                } label: {
                    Text("List Cells")
                }
                
                NavigationLink {
                    MediaDetailView()
                } label: {
                    Text("Media")
                }
                
                NavigationLink {
                    NotificationCellDetailView()
                } label: {
                    Text("Notification Cell")
                }
                
                NavigationLink {
                    PostHeaderDetailView()
                } label: {
                    Text("Post Header")
                }
                
                NavigationLink {
                    ProgressDetailView()
                } label: {
                    Text("Progress")
                }
                
                NavigationLink {
                    ReactionBarDetailView()
                } label: {
                    Text("Reaction Bar")
                }
                
                NavigationLink {
                    SelectMenuDetailView()
                } label: {
                    Text("Select Menus")
                }
                
                NavigationLink {
                    SubNavigationDetailView()
                } label: {
                    Text("Sub Navigation")
                }
                
                NavigationLink {
                    TextFieldDetailView()
                } label: {
                    Text("Text Fields")
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
            VStack(alignment: .leading, spacing: 48) {
                // Semantic Colors
                semanticColorsSection
                
                // Raw Color Palette
                rawColorPaletteSection
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - Raw Color Palette
    
    private var rawColorPaletteSection: some View {
        VStack(alignment: .leading, spacing: 48) {
            // Header
            Text("Color Palette")
                .typography(PDSTextScale.section.headline)
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
        VStack(alignment: .leading, spacing: 48) {
            // Header
            VStack(alignment: .leading, spacing: PDSTextScale.section.lineSpacing) {
            Text("Semantic Colors")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
            
                Text("Spectrum tokens - adaptive for light/dark mode")
                    .typography(PDSTextScale.section.body)
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
                ("Warning", Colors.persistentWarning),
                ("Warning Deemphasized", Colors.persistentWarningDeemphasized),
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
            VStack(alignment: .leading, spacing: 48) {
                // Text Pairings Section
                textPairingsSection
                
                typographyList([
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
                
                typographyList([
                    ("Body 1", Typography.body1),
                    ("Body 2", Typography.body2),
                    ("Body 3", Typography.body3),
                    ("Body 4", Typography.body4),
                    ("Body 1 Link", Typography.body1Link),
                    ("Body 2 Link", Typography.body2Link),
                    ("Body 3 Link", Typography.body3Link),
                    ("Body 4 Link", Typography.body4Link),
                ])
                
                typographyList([
                    ("Button 1", Typography.button1),
                    ("Button 2", Typography.button2),
                    ("Button 3", Typography.button3),
                ])
                
                typographyList([
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
        .background(Colors.backgroundSurface)
        .navigationTitle("Typography")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - Text Pairings
    
    private var textPairingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.section.lineSpacing) {
                Text("Text Pairings")
                    .typography(PDSTextScale.section.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text("Coordinated scales for visual hierarchy")
                    .typography(PDSTextScale.section.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            VStack(spacing: 1) {
                textPairingRow(scale: .hero)
                
                textPairingRow(scale: .section)
                
                textPairingRow(scale: .content)
                
                textPairingRow(scale: .compact)
            }
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))
        }
    }
    
    private func textPairingRow(scale: PDSTextScale) -> some View {
        let scaleName: String = {
            switch scale {
            case .hero: return "Hero"
            case .section: return "Section"
            case .content: return "Content"
            case .compact: return "Compact"
            }
        }()
        
        return VStack(alignment: .leading, spacing: scale.lineSpacing) {
            Text("\(scaleName) Headline")
                .typography(scale.headline)
                .foregroundColor(Colors.textPrimary)
            
            Text("\(scaleName) Body")
                .typography(scale.body)
                .foregroundColor(Colors.textSecondary)
            
            Text("\(scaleName) Meta")
                .typography(scale.meta)
                .foregroundColor(Colors.gray400)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .pdsTextPadding(scale)
        .background(Colors.backgroundCardFlat)
    }
    
    private func typographyList(_ items: [(String, Typography.Style)]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(items, id: \.0) { item in
                Text(item.0)
                    .typography(item.1)
                    .foregroundColor(Colors.textPrimary)
            }
        }
    }
}

// MARK: - Shadows Showcase

struct ShadowsShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                VStack(alignment: .leading, spacing: PDSTextScale.section.lineSpacing) {
                Text("Shadow Styles")
                        .typography(PDSTextScale.section.headline)
                        .foregroundColor(Colors.textPrimary)
                
                Text("Elevation and depth effects for UI elements")
                        .typography(PDSTextScale.section.body)
                        .foregroundColor(Colors.textSecondary)
                }
                
                // UI Emphasis
                shadowCard(
                    title: "UI Emphasis",
                    description: "Single shadow for elevated cards and floating elements",
                    content: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(light: Colors.white, dark: Colors.gray700))
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
                            .fill(Color(light: Colors.white, dark: Colors.gray700))
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
                                .fill(Color(light: Colors.white, dark: Colors.gray700))
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
        .background(Colors.backgroundSurface)
        .navigationTitle("Shadows")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func shadowCard<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
                .padding(16)
                .background(Colors.backgroundWash)
                .cornerRadius(12)
        }
    }
}

// MARK: - Motion Showcase

struct MotionShowcaseView: View {
    @State private var animateDurations = false
    @State private var animateSprings = false
    @State private var animateInteractive = false
    @State private var animateMotionTypes = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Motion Types Section
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                        Text("Motion Types")
                            .typography(PDSTextScale.content.headline)
                            .foregroundColor(Colors.textPrimary)
                        
                        Text("Tap to animate all")
                            .typography(PDSTextScale.content.body)
                            .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 12) {
                        MotionTypeRow(name: "Enter / Exit", description: "Appearing & disappearing", animation: Motion.enter, animationType: .enterExit, isAnimating: animateMotionTypes)
                        MotionTypeRow(name: "Expand / Collapse", description: "Growing & shrinking", animation: Motion.expand, animationType: .expandCollapse, isAnimating: animateMotionTypes)
                        MotionTypeRow(name: "Swap", description: "Exchanging positions", animation: Motion.swap, animationType: .swap, isAnimating: animateMotionTypes)
                        MotionTypeRow(name: "Move", description: "Standard repositioning", animation: Motion.move, animationType: .move, isAnimating: animateMotionTypes)
                        MotionTypeRow(name: "Quick Move", description: "Fast repositioning", animation: Motion.quickMove, animationType: .move, isAnimating: animateMotionTypes)
                        MotionTypeRow(name: "Passive Move", description: "Subtle repositioning", animation: Motion.passiveMove, animationType: .move, isAnimating: animateMotionTypes)
                        MotionTypeRow(name: "Fade", description: "Opacity transition", animation: Motion.fade, animationType: .fade, isAnimating: animateMotionTypes)
                    }
                }
                .padding(16)
                .background(Colors.backgroundDeemphasized)
                .cornerRadius(12)
                .onTapGesture {
                    animateMotionTypes.toggle()
                }
                
                // Durations Section
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                    Text("Durations")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Colors.textPrimary)
                    
                    Text("Tap to animate all")
                        .font(.system(size: 13))
                        .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 12) {
                        MotionDurationRow(name: "Instant", duration: Motion.instantDuration, durationLabel: "0.1s", isAnimating: animateDurations)
                        MotionDurationRow(name: "Quick", duration: Motion.quickDuration, durationLabel: "0.15s", isAnimating: animateDurations)
                        MotionDurationRow(name: "Standard", duration: Motion.standardDuration, durationLabel: "0.2s", isAnimating: animateDurations)
                        MotionDurationRow(name: "Moderate", duration: Motion.moderateDuration, durationLabel: "0.3s", isAnimating: animateDurations)
                        MotionDurationRow(name: "Slow", duration: Motion.slowDuration, durationLabel: "0.4s", isAnimating: animateDurations)
                        MotionDurationRow(name: "Deliberate", duration: Motion.deliberateDuration, durationLabel: "0.5s", isAnimating: animateDurations)
                    }
                }
                .padding(16)
                .background(Colors.backgroundDeemphasized)
                .cornerRadius(12)
                .onTapGesture {
                    animateDurations.toggle()
                }
                
                // Springs Section
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                    Text("Springs")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Colors.textPrimary)
                    
                    Text("Tap to animate all")
                        .font(.system(size: 13))
                        .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 12) {
                        MotionSpringRow(name: "Snappy", animation: Motion.springSnappy, description: "0.25s, 0.8 damping", isAnimating: animateSprings)
                        MotionSpringRow(name: "Spring", animation: Motion.spring, description: "0.3s, 0.7 damping", isAnimating: animateSprings)
                        MotionSpringRow(name: "Bouncy", animation: Motion.springBouncy, description: "0.4s, 0.6 damping", isAnimating: animateSprings)
                        MotionSpringRow(name: "Gentle", animation: Motion.springGentle, description: "0.5s, 0.8 damping", isAnimating: animateSprings)
                    }
                }
                .padding(16)
                .background(Colors.backgroundDeemphasized)
                .cornerRadius(12)
                .onTapGesture {
                    animateSprings.toggle()
                }
                
                // Interactive Section
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                    Text("Interactive")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Colors.textPrimary)
                    
                    Text("Tap to animate all")
                        .font(.system(size: 13))
                        .foregroundColor(Colors.textSecondary)
                    }
                    
                    VStack(spacing: 12) {
                        MotionInteractiveRow(name: "Button Press", description: "Quick tap feedback", animation: Motion.buttonPress, isAnimating: animateInteractive)
                        MotionInteractiveRow(name: "Toggle", description: "Switch state change", animation: Motion.toggle, isAnimating: animateInteractive)
                        MotionInteractiveRow(name: "Card Transition", description: "Card animations", animation: Motion.cardTransition, isAnimating: animateInteractive)
                        MotionInteractiveRow(name: "List Item", description: "Row interactions", animation: Motion.listItem, isAnimating: animateInteractive)
                        MotionInteractiveRow(name: "Fade", description: "Opacity change", animation: Motion.fade, isAnimating: animateInteractive)
                    }
                }
                .padding(16)
                .background(Colors.backgroundDeemphasized)
                .cornerRadius(12)
                .onTapGesture {
                    animateInteractive.toggle()
                }
                
                // Delays Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Delays")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Colors.textPrimary)
                    
                    VStack(spacing: 8) {
                        DelayRow(name: "No Delay", delay: Motion.noDelay)
                        DelayRow(name: "Short", delay: Motion.shortDelay)
                        DelayRow(name: "Standard", delay: Motion.standardDelay)
                        DelayRow(name: "Long", delay: Motion.longDelay)
                    }
                }
                .padding(16)
                .background(Colors.backgroundDeemphasized)
                .cornerRadius(12)
            }
            .padding(16)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Motion")
        .navigationBarTitleDisplayMode(.large)
    }
}

private struct MotionDurationRow: View {
    let name: String
    let duration: Double
    let durationLabel: String
    let isAnimating: Bool
    private let squareSize: CGFloat = 20
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Colors.textPrimary)
                Text(durationLabel)
                    .font(.system(size: 12))
                    .foregroundColor(Colors.textSecondary)
            }
            .frame(width: 120, alignment: .leading)
            
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 4)
                    .fill(Colors.persistentAccent)
                    .frame(width: squareSize, height: squareSize)
                    .position(x: isAnimating ? geometry.size.width - squareSize/2 - 4 : squareSize/2 + 4, y: geometry.size.height / 2)
                    .animation(.easeInOut(duration: duration), value: isAnimating)
            }
            .frame(height: 28)
            .background(Colors.backgroundSurface)
            .cornerRadius(6)
        }
    }
}

private struct MotionSpringRow: View {
    let name: String
    let animation: Animation
    let description: String
    let isAnimating: Bool
    private let squareSize: CGFloat = 20
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Colors.textPrimary)
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(Colors.textSecondary)
            }
            .frame(width: 120, alignment: .leading)
            
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 4)
                    .fill(Colors.persistentAccent)
                    .frame(width: squareSize, height: squareSize)
                    .position(x: isAnimating ? geometry.size.width - squareSize/2 - 4 : squareSize/2 + 4, y: geometry.size.height / 2)
                    .animation(animation, value: isAnimating)
            }
            .frame(height: 28)
            .background(Colors.backgroundSurface)
            .cornerRadius(6)
        }
    }
}

private struct MotionInteractiveRow: View {
    let name: String
    let description: String
    let animation: Animation
    let isAnimating: Bool
    private let squareSize: CGFloat = 20
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Colors.textPrimary)
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(Colors.textSecondary)
            }
                .frame(width: 120, alignment: .leading)
            
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 4)
                    .fill(Colors.persistentAccent)
                    .frame(width: squareSize, height: squareSize)
                    .position(x: isAnimating ? geometry.size.width - squareSize/2 - 4 : squareSize/2 + 4, y: geometry.size.height / 2)
                    .animation(animation, value: isAnimating)
            }
            .frame(height: 28)
            .background(Colors.backgroundSurface)
            .cornerRadius(6)
        }
    }
}

private struct DelayRow: View {
    let name: String
    let delay: Double
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Colors.textPrimary)
            Spacer()
            Text("\(delay, specifier: "%.2f")s")
                .font(.system(size: 15, design: .monospaced))
                .foregroundColor(Colors.textSecondary)
        }
    }
}

private enum MotionAnimationType {
    case enterExit, expandCollapse, swap, move, fade
}

private struct MotionTypeRow: View {
    let name: String
    let description: String
    let animation: Animation
    let animationType: MotionAnimationType
    let isAnimating: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Colors.textPrimary)
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(Colors.textSecondary)
            }
            .frame(width: 120, alignment: .leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Colors.backgroundSurface)
                
                animatedContent
            }
            .frame(height: 28)
        }
    }
    
    @ViewBuilder
    private var animatedContent: some View {
        let squareSize: CGFloat = 20
        
        switch animationType {
        case .enterExit:
            // Enter/Exit - opacity animation
            RoundedRectangle(cornerRadius: 4)
                .fill(Colors.persistentAccent)
                .frame(width: squareSize, height: squareSize)
                .opacity(isAnimating ? 1 : 0)
                .animation(animation, value: isAnimating)
            
        case .expandCollapse:
            // Expand/Collapse - scale animation
            RoundedRectangle(cornerRadius: 4)
                .fill(Colors.persistentAccent)
                .frame(width: isAnimating ? 80 : squareSize, height: squareSize)
                .animation(animation, value: isAnimating)
            
        case .swap:
            // Two elements swapping with opacity change
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Colors.persistentAccent)
                    .frame(width: squareSize, height: squareSize)
                    .opacity(isAnimating ? 0.4 : 1.0)
                    .offset(x: isAnimating ? 28 : 0)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Colors.persistentAccent)
                    .frame(width: squareSize, height: squareSize)
                    .opacity(isAnimating ? 1.0 : 0.4)
                    .offset(x: isAnimating ? -28 : 0)
            }
            .animation(animation, value: isAnimating)
            
        case .move:
            // Position animation
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 4)
                    .fill(Colors.persistentAccent)
                    .frame(width: squareSize, height: squareSize)
                    .position(x: isAnimating ? geometry.size.width - squareSize/2 - 4 : squareSize/2 + 4, y: geometry.size.height / 2)
                    .animation(animation, value: isAnimating)
            }
            
        case .fade:
            // Crossfade opacity
            RoundedRectangle(cornerRadius: 4)
                .fill(Colors.persistentAccent)
                .frame(width: squareSize, height: squareSize)
                .opacity(isAnimating ? 0.3 : 1)
                .animation(animation, value: isAnimating)
        }
    }
}

// MARK: - Icons Showcase

struct IconsShowcaseView: View {
    @State private var searchText = ""
    
    private let categories: [(String, [String])] = [
        ("Navigation", [
            "chevron.right", "chevron.left", "chevron.up", "chevron.down",
            "chevron.up.chevron.down", "chevron.backward", "chevron.forward",
            "arrow.left", "arrow.right", "arrow.up", "arrow.down",
            "arrow.up.left", "arrow.up.right", "arrow.down.left", "arrow.down.right",
            "arrow.turn.up.left", "arrow.turn.up.right", "arrow.uturn.left", "arrow.uturn.right",
            "arrowshape.turn.up.left", "arrowshape.turn.up.right", "arrowshape.turn.up.left.fill",
            "arrow.clockwise", "arrow.counterclockwise", "arrow.triangle.2.circlepath"
        ]),
        ("Actions", [
            "plus", "minus", "plus.circle", "plus.circle.fill", "minus.circle", "minus.circle.fill",
            "xmark", "xmark.circle", "xmark.circle.fill", "checkmark", "checkmark.circle", "checkmark.circle.fill",
            "ellipsis", "ellipsis.circle", "ellipsis.circle.fill",
            "line.3.horizontal", "line.3.horizontal.decrease", "slider.horizontal.3",
            "pencil", "pencil.circle", "pencil.circle.fill", "square.and.pencil",
            "trash", "trash.fill", "trash.circle", "trash.circle.fill",
            "folder", "folder.fill", "folder.badge.plus", "folder.badge.minus",
            "doc", "doc.fill", "doc.badge.plus", "doc.text", "doc.text.fill"
        ]),
        ("Communication", [
            "message", "message.fill", "message.circle", "message.circle.fill",
            "bubble.left", "bubble.right", "bubble.left.fill", "bubble.right.fill",
            "bubble.left.and.bubble.right", "bubble.left.and.bubble.right.fill",
            "phone", "phone.fill", "phone.circle", "phone.circle.fill",
            "video", "video.fill", "video.circle", "video.circle.fill",
            "envelope", "envelope.fill", "envelope.circle", "envelope.circle.fill",
            "paperplane", "paperplane.fill", "paperplane.circle", "paperplane.circle.fill"
        ]),
        ("Social", [
            "heart", "heart.fill", "heart.circle", "heart.circle.fill",
            "star", "star.fill", "star.circle", "star.circle.fill",
            "hand.thumbsup", "hand.thumbsup.fill", "hand.thumbsdown", "hand.thumbsdown.fill",
            "bookmark", "bookmark.fill", "bookmark.circle", "bookmark.circle.fill",
            "flag", "flag.fill", "flag.circle", "flag.circle.fill",
            "bell", "bell.fill", "bell.circle", "bell.circle.fill", "bell.badge", "bell.badge.fill",
            "square.and.arrow.up", "square.and.arrow.up.fill", "square.and.arrow.down", "square.and.arrow.down.fill"
        ]),
        ("People", [
            "person", "person.fill", "person.circle", "person.circle.fill",
            "person.crop.circle", "person.crop.circle.fill", "person.crop.circle.badge.checkmark",
            "person.crop.circle.badge.plus", "person.crop.circle.badge.minus", "person.crop.circle.badge.xmark",
            "person.2", "person.2.fill", "person.2.circle", "person.2.circle.fill",
            "person.3", "person.3.fill", "person.3.sequence", "person.3.sequence.fill",
            "figure.stand", "figure.walk", "figure.wave", "figure.arms.open"
        ]),
        ("Status", [
            "checkmark.seal", "checkmark.seal.fill", "xmark.seal", "xmark.seal.fill",
            "exclamationmark.circle", "exclamationmark.circle.fill", "exclamationmark.triangle", "exclamationmark.triangle.fill",
            "info.circle", "info.circle.fill", "questionmark.circle", "questionmark.circle.fill",
            "eye", "eye.fill", "eye.slash", "eye.slash.fill",
            "lock", "lock.fill", "lock.circle", "lock.circle.fill",
            "lock.open", "lock.open.fill", "key", "key.fill"
        ]),
        ("Media", [
            "photo", "photo.fill", "photo.circle", "photo.circle.fill",
            "camera", "camera.fill", "camera.circle", "camera.circle.fill",
            "video", "video.fill", "video.circle", "video.circle.fill",
            "play", "play.fill", "play.circle", "play.circle.fill",
            "pause", "pause.fill", "pause.circle", "pause.circle.fill",
            "stop", "stop.fill", "stop.circle", "stop.circle.fill",
            "backward", "backward.fill", "forward", "forward.fill",
            "mic", "mic.fill", "mic.circle", "mic.circle.fill",
            "speaker", "speaker.fill", "speaker.wave.2", "speaker.wave.2.fill", "speaker.wave.3.fill"
        ]),
        ("Editing", [
            "scissors", "paintbrush", "paintbrush.fill", "paintbrush.pointed", "paintbrush.pointed.fill",
            "paintpalette", "paintpalette.fill", "eyedropper", "eyedropper.full",
            "crop", "crop.rotate", "wand.and.rays", "wand.and.stars",
            "slider.horizontal.below.rectangle", "slider.vertical.3",
            "textformat", "textformat.abc", "textformat.size", "bold.italic.underline",
            "list.bullet", "list.number", "list.dash", "checklist"
        ]),
        ("System", [
            "gear", "gear.circle", "gear.circle.fill", "gearshape", "gearshape.fill",
            "house", "house.fill", "house.circle", "house.circle.fill",
            "magnifyingglass", "magnifyingglass.circle", "magnifyingglass.circle.fill",
            "globe", "globe.americas", "globe.europe.africa", "globe.asia.australia",
            "wifi", "wifi.slash", "antenna.radiowaves.left.and.right",
            "battery.100", "battery.75", "battery.50", "battery.25", "battery.0",
            "bolt", "bolt.fill", "bolt.circle", "bolt.circle.fill"
        ]),
        ("Weather", [
            "sun.max", "sun.max.fill", "sun.min", "sun.min.fill",
            "moon", "moon.fill", "moon.stars", "moon.stars.fill",
            "cloud", "cloud.fill", "cloud.sun", "cloud.sun.fill",
            "cloud.rain", "cloud.rain.fill", "cloud.heavyrain", "cloud.heavyrain.fill",
            "cloud.bolt", "cloud.bolt.fill", "cloud.snow", "cloud.snow.fill",
            "wind", "tornado", "humidity", "thermometer.sun"
        ]),
        ("Objects", [
            "cart", "cart.fill", "cart.circle", "cart.circle.fill", "cart.badge.plus",
            "bag", "bag.fill", "bag.circle", "bag.circle.fill", "bag.badge.plus",
            "creditcard", "creditcard.fill", "creditcard.circle", "creditcard.circle.fill",
            "gift", "gift.fill", "gift.circle", "gift.circle.fill",
            "tag", "tag.fill", "tag.circle", "tag.circle.fill",
            "clock", "clock.fill", "clock.circle", "clock.circle.fill",
            "calendar", "calendar.circle", "calendar.circle.fill", "calendar.badge.plus"
        ]),
        ("Devices", [
            "iphone", "iphone.gen3", "ipad", "ipad.landscape",
            "laptopcomputer", "desktopcomputer", "display", "tv",
            "applewatch", "airpods", "airpodspro", "headphones",
            "keyboard", "computermouse", "printer", "scanner"
        ])
    ]
    
    private let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    private var filteredCategories: [(String, [String])] {
        if searchText.isEmpty {
            return categories
        }
        let query = searchText.lowercased()
        return categories.compactMap { category in
            let filteredIcons = category.1.filter { $0.lowercased().contains(query) }
            return filteredIcons.isEmpty ? nil : (category.0, filteredIcons)
        }
    }
    
    private var allFilteredIcons: [String] {
        if searchText.isEmpty { return [] }
        let query = searchText.lowercased()
        return categories.flatMap { $0.1 }.filter { $0.lowercased().contains(query) }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 48) {
                // Show flat grid when searching, categories when not
                if !searchText.isEmpty {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(allFilteredIcons, id: \.self) { icon in
                            iconCard(icon: icon)
                        }
                    }
                    .padding(.horizontal, 12)
                    
                    if allFilteredIcons.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 48))
                                .foregroundColor(Colors.textSecondary)
                            Text("No icons found")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(Colors.textSecondary)
                            Text("Try a different search term")
                                .font(.system(size: 15))
                                .foregroundColor(Colors.textSecondary)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 60)
                    }
                } else {
                    ForEach(categories, id: \.0) { category in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(category.0)
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(Colors.textPrimary)
                                .padding(.horizontal, 12)
                            
                            LazyVGrid(columns: columns, spacing: 8) {
                                ForEach(category.1, id: \.self) { icon in
                                    iconCard(icon: icon)
                                }
                            }
                            .padding(.horizontal, 12)
                        }
                    }
                }
            }
            .padding(.vertical, 16)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Icons")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $searchText, prompt: "Search icons...")
    }
    
    private func iconCard(icon: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(Colors.iconPrimary)
                .frame(maxWidth: .infinity, minHeight: 80, maxHeight: 80)
                .background(Colors.backgroundDeemphasized)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(icon)
                .font(.system(size: 10))
                .foregroundColor(Colors.textSecondary)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
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
            VStack(spacing: 48) {
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
                        
                        Button("Destructive Deemphasized") { }
                            .pdsButton(variant: .destructiveDeemphasized, width: .fullWidth)
                        
                        Button("Warning") { }
                            .pdsButton(variant: .warning, width: .fullWidth)
                        
                        Button("Warning Deemphasized") { }
                            .pdsButton(variant: .warningDeemphasized, width: .fullWidth)
                    }
                }
                
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
                
                // On Media Context
                buttonSection(title: "On Media") {
                        VStack(spacing: 12) {
                            Button("Primary on Media") { }
                                .pdsButton(variant: .primary, context: .onMedia, width: .fullWidth)
                            
                            Button("Secondary on Media") { }
                                .pdsButton(variant: .secondary, context: .onMedia, width: .fullWidth)
                        }
                        .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(
                        Image("Posts/SampleMedia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
                }
                
                // Icon + Label
                buttonSection(title: "Icon + Label") {
                    VStack(spacing: 12) {
                        Button("Add Photo") { }
                            .pdsButton(variant: .primary, width: .fullWidth, icon: "photo")
                        
                        Button("Select") { }
                            .pdsButton(variant: .secondary, width: .fullWidth, icon: "chevron.down", iconPosition: .trailing)
                    }
                }
                
                // Icon Only (Circular)
                buttonSection(title: "Icon Only (Circular)") {
                    HStack(spacing: 16) {
                        Button { } label: {
                            Image(systemName: "plus")
                        }
                        .pdsCircularButton(variant: .primary)
                        
                        Button { } label: {
                            Image(systemName: "heart")
                        }
                        .pdsCircularButton(variant: .primaryDeemphasized)
                        
                        Button { } label: {
                            Image(systemName: "ellipsis")
                        }
                        .pdsCircularButton(variant: .secondary)
                        
                        Button { } label: {
                            Image(systemName: "trash")
                        }
                        .pdsCircularButton(variant: .destructive)
                    }
                }
                
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
            VStack(spacing: 48) {
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
                
                // On Media
                iconSection(title: "On Media") {
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        Image("Posts/SampleMedia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
                }
                
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
            VStack(alignment: .leading, spacing: 48) {
                // Horizontal Scroll Example
                chipSection(title: "Horizontal Scroll", description: "Scrollable chip row for many options") {
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
                            Button("Documents") { }
                                .pdsActionChip()
                            Button("Audio") { }
                                .pdsActionChip()
                            Button("Archives") { }
                            .pdsActionChip()
                    }
                        .padding(.horizontal, 21) // 20 + 1 for border
                    }
                    .scrollClipDisabled(true)
                    .padding(.horizontal, -20)
                }
                
                // With icons
                chipSection(title: "With Icons", description: "Chips with leading SF Symbols") {
                    FlowLayout(spacing: 8) {
                        Button("Filter") { }
                            .pdsActionChip(icon: "slider.horizontal.3")
                        Button("Sort") { }
                            .pdsActionChip(icon: "arrow.up.arrow.down")
                        Button("Date") { }
                            .pdsActionChip(isSelected: true, icon: "calendar")
                        Button("Location") { }
                            .pdsActionChip(icon: "location")
                    }
                }
                
                // On Color
                chipSection(title: "On Color", description: "Chips on colored backgrounds") {
                    VStack(spacing: 0) {
                        ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                                Button("Featured") { }
                                    .pdsActionChip(isSelected: true, context: .onColor)
                                Button("Popular") { }
                                    .pdsActionChip(context: .onColor)
                                Button("Recent") { }
                                    .pdsActionChip(context: .onColor)
                                Button("Trending") { }
                                    .pdsActionChip(context: .onColor)
                            }
                            .padding(16)
                        }
                    }
                    .background(Colors.persistentAccent)
                    .cornerRadius(12)
                }
                
                // On Media
                chipSection(title: "On Media", description: "Chips on images or video") {
                    ZStack(alignment: .bottom) {
                        Image("Posts/SampleMedia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 160)
                            .clipped()
                        
                        LinearGradient(
                            colors: [.clear, .black.opacity(0.6)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 80)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                                Button("Nature") { }
                                    .pdsActionChip(isSelected: true, context: .onMedia)
                                Button("Landscape") { }
                                    .pdsActionChip(context: .onMedia)
                                Button("Photography") { }
                                    .pdsActionChip(context: .onMedia)
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                        }
                        .scrollClipDisabled(true)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                // Dismissible
                chipSection(title: "Dismissible", description: "Removable filter chips") {
                    FlowLayout(spacing: 8) {
                        Button("San Francisco") { }
                            .pdsDismissibleChip()
                        Button("Photography") { }
                            .pdsDismissibleChip()
                        Button("2024") { }
                            .pdsDismissibleChip()
                    }
                }
                
                // Emoji reactions
                chipSection(title: "Reactions", description: "Emoji chips with counts") {
                    FlowLayout(spacing: 8) {
                        Button("👍") { }
                            .pdsEmojiChip(count: 12, isSelected: true)
                        Button("❤️") { }
                            .pdsEmojiChip(count: 5)
                        Button("😂") { }
                            .pdsEmojiChip(count: 3)
                        Button("😮") { }
                            .pdsEmojiChip()
                        Button("🎉") { }
                            .pdsEmojiChip(count: 2)
                    }
                }
                
                // Author chips
                chipSection(title: "Author", description: "Chips with avatar and name") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            Button("John Doe") { }
                                .pdsAuthorChip(actorInitials: "JD", isSelected: true)
                            Button("Jane Smith") { }
                                .pdsAuthorChip(actorInitials: "JS")
                            Button("Alex Chen") { }
                                .pdsAuthorChip(actorInitials: "AC")
                            Button("Sam Wilson") { }
                                .pdsAuthorChip(actorInitials: "SW")
                        }
                        .padding(.horizontal, 21) // 20 + 1 for border
                    }
                    .scrollClipDisabled(true)
                    .padding(.horizontal, -20)
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Action Chips")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func chipSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            .zIndex(1)
            .background(Colors.backgroundSurface)
            
            content()
        }
    }
}

// MARK: - Badge Detail View

struct BadgeDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Variants
                badgeSection(title: "Variants", description: "Different badge styles for various contexts") {
                    FlowLayout(spacing: 8) {
                        PDSBadge("Neutral", variant: .neutral)
                        PDSBadge("Accent", variant: .accent)
                        PDSBadge("Positive", variant: .positive)
                        PDSBadge("Negative", variant: .negative)
                        PDSBadge("Warning", variant: .warning)
                    }
                }
                
                // Solid variants
                badgeSection(title: "Solid Variants", description: "High-contrast badges for emphasis") {
                    FlowLayout(spacing: 8) {
                        PDSBadge("Neutral", variant: .neutral, isSolid: true)
                        PDSBadge("Accent", variant: .accent, isSolid: true)
                        PDSBadge("Positive", variant: .positive, isSolid: true)
                        PDSBadge("Negative", variant: .negative, isSolid: true)
                        PDSBadge("Warning", variant: .warning, isSolid: true)
                    }
                }
                
                // Sizes
                badgeSection(title: "Sizes", description: "Available badge sizes") {
                    FlowLayout(spacing: 8) {
                        PDSBadge("Small", variant: .accent, size: .small)
                        PDSBadge("Medium", variant: .accent, size: .medium)
                        PDSBadge("Large", variant: .accent, size: .large)
                    }
                }
                
                // With icons
                badgeSection(title: "With Icons", description: "Badges with leading icons") {
                    FlowLayout(spacing: 8) {
                        PDSBadge("Verified", icon: "checkmark.seal.fill", variant: .accent)
                        PDSBadge("New", icon: "sparkles", variant: .positive)
                        PDSBadge("Urgent", icon: "exclamationmark.triangle.fill", variant: .negative)
                    }
                }
                
                // Count badges
                badgeSection(title: "Count Badges", description: "Notification counts with max overflow") {
                    FlowLayout(spacing: 12) {
                        PDSBadge.count(3)
                        PDSBadge.count(12)
                        PDSBadge.count(99)
                        PDSBadge.count(150)
                        PDSBadge.count(5, variant: .accent)
                    }
                }
                
                // Dot indicators
                badgeSection(title: "Dot Indicators", description: "Minimal status indicators") {
                    FlowLayout(spacing: 16) {
                        HStack(spacing: 4) {
                            PDSBadge.dot(variant: .positive)
                            Text("Online")
                                .typography(Typography.body3)
                        }
                        
                        HStack(spacing: 4) {
                            PDSBadge.dot(variant: .warning)
                            Text("Away")
                                .typography(Typography.body3)
                        }
                        
                        HStack(spacing: 4) {
                            PDSBadge.dot(variant: .neutral)
                            Text("Offline")
                                .typography(Typography.body3)
                        }
                    }
                }
                
                // Status badges
                badgeSection(title: "Status Badges", description: "Pre-configured status indicators") {
                    FlowLayout(spacing: 8) {
                            PDSStatusBadge(.active)
                            PDSStatusBadge(.pending)
                            PDSStatusBadge(.inactive)
                            PDSStatusBadge(.success)
                            PDSStatusBadge(.warning)
                            PDSStatusBadge(.error)
                        }
                    }
                }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Badges")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func badgeSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Bottom Sheet Detail View

struct BottomSheetDetailView: View {
    @State private var showBasicSheet = false
    @State private var showTitledSheet = false
    @State private var showSmallSheet = false
    @State private var showLargeSheet = false
    @State private var showCustomSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Basic Sheet
                sheetSection(
                    title: "Basic Sheet",
                    description: "Default bottom sheet with medium and large detents"
                ) {
                    Button("Show Basic Sheet") {
                        showBasicSheet = true
                    }
                    .pdsButton(variant: .primary, size: .medium)
                }
                
                // With Title & Close
                sheetSection(
                    title: "With Header",
                    description: "Sheet with title and close button"
                ) {
                    Button("Show Sheet with Header") {
                        showTitledSheet = true
                    }
                    .pdsButton(variant: .secondary, size: .medium)
                }
                
                // Small Sheet
                sheetSection(
                    title: "Small Detent",
                    description: "Compact sheet for quick actions"
                ) {
                    Button("Show Small Sheet") {
                        showSmallSheet = true
                    }
                    .pdsButton(variant: .secondary, size: .medium)
                }
                
                // Large Only
                sheetSection(
                    title: "Large Only",
                    description: "Full-height sheet without resize option"
                ) {
                    Button("Show Large Sheet") {
                        showLargeSheet = true
                    }
                    .pdsButton(variant: .secondary, size: .medium)
                }
                
                // Custom Height
                sheetSection(
                    title: "Custom Height",
                    description: "Sheet with custom fractional height (40%)"
                ) {
                    Button("Show Custom Sheet") {
                        showCustomSheet = true
                    }
                    .pdsButton(variant: .secondary, size: .medium)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Bottom Sheet")
        .navigationBarTitleDisplayMode(.large)
        // Basic sheet
        .pdsBottomSheet(isPresented: $showBasicSheet) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Basic Bottom Sheet")
                    .typography(Typography.headline2)
                    .foregroundColor(Colors.textPrimary)
                
                Text("This is a default bottom sheet with medium and large detents. Drag the sheet up or down to resize it.")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                Rectangle()
                    .fill(Colors.backgroundDivider)
                    .frame(height: 1)
                    .padding(.vertical, 8)
                
                Text("The sheet uses the native iOS presentation with PDS styling applied for background color, corner radius, and drag indicator.")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                Spacer()
            }
            .padding(20)
        }
        // Sheet with header
        .pdsBottomSheet(
            isPresented: $showTitledSheet,
            showCloseButton: true,
            title: "Options"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("This sheet has a header with title and close button. Useful for modal selections or settings.")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                PDSCellGroup {
                    PDSNavigationCell(title: "Account Settings") {}
                    PDSNavigationCell(title: "Privacy") {}
                    PDSNavigationCell(title: "Notifications") {}
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        // Small sheet
        .pdsBottomSheet(
            isPresented: $showSmallSheet,
            detents: [.small]
        ) {
            VStack(spacing: 16) {
                Text("Confirm Action")
                    .typography(Typography.headline3)
                    .foregroundColor(Colors.textPrimary)
                
                Text("Are you sure you want to continue?")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                HStack(spacing: 12) {
                    Button("Cancel") {
                        showSmallSheet = false
                    }
                    .pdsButton(variant: .secondary, size: .medium, width: .fullWidth)
                    
                    Button("Confirm") {
                        showSmallSheet = false
                    }
                    .pdsButton(variant: .primary, size: .medium, width: .fullWidth)
                }
            }
            .padding(20)
        }
        // Large only sheet
        .pdsBottomSheet(
            isPresented: $showLargeSheet,
            detents: [.large],
            showCloseButton: true,
            title: "Full Screen Content"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("This sheet opens to full height and cannot be resized to a smaller detent.")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                ForEach(1..<10) { index in
                    HStack {
                        Circle()
                            .fill(Colors.backgroundDeemphasized)
                            .frame(width: 40, height: 40)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Item \(index)")
                                .typography(Typography.headline4)
                                .foregroundColor(Colors.textPrimary)
                            
                            Text("Description text goes here")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        // Custom height sheet
        .pdsBottomSheet(
            isPresented: $showCustomSheet,
            detents: [.fraction(0.4)],
            showDragIndicator: true
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Custom Height")
                    .typography(Typography.headline2)
                    .foregroundColor(Colors.textPrimary)
                
                Text("This sheet uses a custom fractional height of 40% of the screen.")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                Button("Close") {
                    showCustomSheet = false
                }
                .pdsButton(variant: .primary, size: .medium, width: .fullWidth)
                
                Spacer()
            }
            .padding(20)
        }
    }
    
    private func sheetSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Flow Layout (for wrapping badges)

private struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        // Use full proposed width to prevent layout gaps
        let width = proposal.width ?? result.size.width
        return CGSize(width: width, height: result.size.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y), proposal: .unspecified)
        }
    }
    
    private func arrangeSubviews(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, positions: [CGPoint]) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var lineHeight: CGFloat = 0
        var totalHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if currentX + size.width > maxWidth && currentX > 0 {
                currentX = 0
                currentY += lineHeight + spacing
                lineHeight = 0
            }
            
            positions.append(CGPoint(x: currentX, y: currentY))
            lineHeight = max(lineHeight, size.height)
            currentX += size.width + spacing
        }
        
        totalHeight = currentY + lineHeight
        return (CGSize(width: maxWidth, height: totalHeight), positions)
    }
}

// MARK: - List Cells Detail View

struct ListCellsDetailView: View {
    @State private var toggleValue1 = true
    @State private var toggleValue2 = false
    @State private var checkmark1 = true
    @State private var checkmark2 = false
    @State private var checkmark3 = false
    @State private var selectedRadio = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Basic Cells - Using new PDSCell with PDSCellGroup
                listCellSection(title: "Basic Cells", description: "Standard list items with optional subtitle and icon") {
                    PDSCellGroup {
                        PDSCell("Profile")
                        PDSCell("Account", subtitle: "john@example.com")
                        PDSCell("Language", subtitle: "English") {
                            PDSCellIcon(systemName: "globe")
                        }
                    }
                }
                
                // Navigation Cells
                listCellSection(title: "Navigation Cells", description: "Cells with chevron indicating drill-down navigation") {
                    PDSCellGroup {
                        PDSNavigationCell(title: "Privacy") { }
                        PDSNavigationCell(title: "Notifications", subtitle: "Push, Email, SMS") { }
                        PDSNavigationCell(
                            title: "Appearance",
                            leadingIcon: "paintbrush",
                            leadingIconColor: Colors.persistentAccent
                        ) { }
                    }
                }
                
                // Toggle Cells
                listCellSection(title: "Toggle Cells", description: "Cells with toggle switch for on/off settings") {
                    PDSCellGroup {
                        PDSToggleCell(title: "Dark Mode", isOn: $toggleValue1)
                        PDSToggleCell(
                            title: "Notifications",
                            subtitle: "Receive push notifications",
                            isOn: $toggleValue2
                        )
                    }
                }
                
                // Avatar Cells
                listCellSection(title: "Avatar Cells", description: "Cells with user avatar for contact lists") {
                    PDSCellGroup {
                        PDSAvatarCell(
                            title: "John Doe",
                            subtitle: "Last seen 5 min ago",
                            avatarInitials: "JD",
                            avatarBadge: .offline,
                            action: { }
                        )
                        PDSAvatarCell(
                            title: "Jane Smith",
                            subtitle: "Active now",
                            avatarInitials: "JS",
                            avatarBadge: .online,
                            showChevron: true,
                            action: { }
                        )
                    }
                }
                
                // Detail Cells
                listCellSection(title: "Detail Cells", description: "iOS Settings style with right-aligned detail value") {
                    PDSCellGroup {
                        PDSDetailCell(title: "Language", detail: "English")
                        PDSDetailCell(title: "Region", detail: "United States", showChevron: true, action: { })
                        PDSDetailCell(
                            title: "Storage",
                            detail: "45.2 GB",
                            leadingIcon: "internaldrive",
                            showChevron: true,
                            action: { }
                        )
                    }
                }
                
                // Badge Cells
                listCellSection(title: "Badge Cells", description: "Cells with count badges for notifications") {
                    PDSCellGroup {
                        PDSBadgeCell(
                            title: "Messages",
                            leadingIcon: "message.fill",
                            leadingIconColor: Colors.persistentAccent,
                            count: 12,
                            showChevron: true,
                            action: { }
                        )
                        PDSBadgeCell(
                            title: "Notifications",
                            subtitle: "3 unread",
                            leadingIcon: "bell.fill",
                            leadingIconColor: Colors.persistentWarning,
                            count: 3,
                            badgeVariant: .warning,
                            action: { }
                        )
                        PDSBadgeCell(
                            title: "Updates",
                            leadingIcon: "arrow.down.circle.fill",
                            leadingIconColor: Colors.persistentPositive,
                            count: 5,
                            badgeVariant: .positive
                        )
                    }
                }
                
                // Status Cells
                listCellSection(title: "Status Cells", description: "Cells with colored status dot indicators") {
                    PDSCellGroup {
                        PDSStatusCell(title: "Alex Johnson", status: .online, action: { })
                        PDSStatusCell(
                            title: "Sarah Williams",
                            subtitle: "In a meeting",
                            status: .busy,
                            action: { }
                        )
                        PDSStatusCell(
                            title: "Mike Brown",
                            subtitle: "Back in 30 min",
                            status: .away,
                            showChevron: true,
                            action: { }
                        )
                        PDSStatusCell(title: "Emily Davis", status: .offline)
                    }
                }
                
                // Checkmark Cells
                listCellSection(title: "Checkmark Cells", description: "Multi-selection with checkmark indicator") {
                    PDSCellGroup {
                        PDSCheckmarkCell(title: "Email notifications", isSelected: $checkmark1)
                        PDSCheckmarkCell(
                            title: "Push notifications",
                            subtitle: "Receive alerts on your device",
                            isSelected: $checkmark2
                        )
                        PDSCheckmarkCell(title: "SMS notifications", isSelected: $checkmark3)
                    }
                }
                
                // Radio Cells
                listCellSection(title: "Radio Cells", description: "Single-selection with radio button indicator") {
                    PDSCellGroup {
                        PDSRadioCell(
                            title: "Light",
                            leadingIcon: "sun.max",
                            isSelected: selectedRadio == 0,
                            action: { selectedRadio = 0 }
                        )
                        PDSRadioCell(
                            title: "Dark",
                            leadingIcon: "moon",
                            isSelected: selectedRadio == 1,
                            action: { selectedRadio = 1 }
                        )
                        PDSRadioCell(
                            title: "System",
                            subtitle: "Match device settings",
                            leadingIcon: "circle.lefthalf.filled",
                            isSelected: selectedRadio == 2,
                            action: { selectedRadio = 2 }
                        )
                    }
                }
                
                // Destructive Cells
                listCellSection(title: "Destructive Cells", description: "Red styling for dangerous actions") {
                    PDSCellGroup {
                        PDSDestructiveCell(title: "Delete Account", action: { })
                        PDSDestructiveCell(
                            title: "Block User",
                            subtitle: "They won't be able to contact you",
                            leadingIcon: "nosign",
                            action: { }
                        )
                        PDSDestructiveCell(
                            title: "Sign Out",
                            leadingIcon: "rectangle.portrait.and.arrow.right",
                            action: { }
                        )
                    }
                }
                
                // Action Cells
                listCellSection(title: "Action Cells", description: "Cells with action button on the right") {
                    PDSCellGroup {
                        PDSActionCell(
                            title: "Sarah Johnson",
                            subtitle: "5 mutual friends",
                            actionTitle: "Follow",
                            onAction: { }
                        )
                        PDSActionCell(
                            title: "Mike Wilson",
                            subtitle: "Suggested for you",
                            actionTitle: "Invite",
                            actionVariant: .secondary,
                            onAction: { }
                        )
                        PDSActionCell(
                            title: "Premium Features",
                            subtitle: "Unlock all features",
                            leadingIcon: "star.fill",
                            leadingIconColor: Colors.persistentWarning,
                            actionTitle: "Upgrade",
                            onAction: { }
                        )
                    }
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("List Cells")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func listCellSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Instant Feedback Detail View

struct InstantFeedbackDetailView: View {
    @State private var showNeutral = false
    @State private var showSuccess = false
    @State private var showError = false
    @State private var showWarning = false
    @State private var showWithAction = false
    @State private var showWithActor = false
    @State private var showTopPosition = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 48) {
                    // Static Variants Section
                    feedbackSection(title: "Variants", description: "Different feedback types for various contexts") {
                    VStack(spacing: 12) {
                            // Neutral
                            staticFeedbackRow(
                                message: "This is a neutral message",
                                type: .neutral
                            )
                            
                            // Success
                            staticFeedbackRow(
                                message: "Changes saved successfully",
                                type: .success
                            )
                            
                            // Error
                            staticFeedbackRow(
                                message: "Unable to save changes",
                                type: .error
                            )
                            
                            // Warning
                            staticFeedbackRow(
                                message: "Your connection is unstable",
                                type: .warning
                            )
                        }
                    }
                    
                    // Static Variations Section
                    feedbackSection(title: "Variations", description: "Additional configurations") {
                        VStack(spacing: 12) {
                            // With Action
                            staticFeedbackRowWithAction(
                                message: "Item removed from list",
                                actionText: "Undo"
                            )
                            
                            // Custom Icon
                            staticFeedbackRowWithIcon(
                                message: "Link copied to clipboard",
                                icon: "doc.on.doc.fill"
                            )
                            
                            // With Actor
                            staticFeedbackRowWithActor(
                                message: "John liked your post",
                                initials: "JD"
                            )
                        }
                    }
                    
                    // Interactive Section
                    feedbackSection(title: "Try It", description: "Tap to trigger feedback") {
                        VStack(spacing: 12) {
                            HStack(spacing: 12) {
                        Button(action: { showNeutral = true }) {
                            Text("Neutral").frame(maxWidth: .infinity)
                        }
                                .pdsSecondaryButton()
                        
                        Button(action: { showSuccess = true }) {
                            Text("Success").frame(maxWidth: .infinity)
                        }
                                .pdsSecondaryButton()
                            }
                        
                            HStack(spacing: 12) {
                        Button(action: { showError = true }) {
                            Text("Error").frame(maxWidth: .infinity)
                        }
                                .pdsSecondaryButton()
                        
                        Button(action: { showWarning = true }) {
                            Text("Warning").frame(maxWidth: .infinity)
                        }
                                .pdsSecondaryButton()
                            }
                            
                            HStack(spacing: 12) {
                        Button(action: { showWithAction = true }) {
                                    Text("With Action").frame(maxWidth: .infinity)
                        }
                        .pdsSecondaryButton()
                        
                                Button(action: { showWithActor = true }) {
                                    Text("With Actor").frame(maxWidth: .infinity)
                        }
                        .pdsSecondaryButton()
                            }
                        
                        Button(action: { showTopPosition = true }) {
                            Text("Top Position").frame(maxWidth: .infinity)
                        }
                        .pdsSecondaryButton()
                        }
                    }
                    
                    Spacer().frame(height: 80)
                }
                .padding(20)
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
            action: { },
            isPresented: $showWithAction
        )
        .pdsInstantFeedback(
            message: "John liked your post",
            actorInitials: "JD",
            isPresented: $showWithActor
        )
        .pdsInstantFeedback(
            message: "New notification received",
            type: .neutral,
            icon: "bell.fill",
            isPresented: $showTopPosition,
            position: .top
        )
    }
    
    private func feedbackSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
    
    private func staticFeedbackRow(message: String, type: PDSInstantFeedbackType) -> some View {
        HStack(spacing: 12) {
            if let icon = type.icon {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(type.iconColor)
            }
            
            Text(message)
                .typography(Typography.body3)
                .foregroundColor(Colors.textPrimaryOnColor)
                .lineLimit(2)
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.card)
                .fill(Colors.backgroundCardDark)
        )
        .environment(\.colorScheme, .dark)
    }
    
    private func staticFeedbackRowWithAction(message: String, actionText: String) -> some View {
        HStack(spacing: 12) {
            Text(message)
                .typography(Typography.body3)
                .foregroundColor(Colors.textPrimaryOnColor)
                .lineLimit(2)
            
            Spacer(minLength: 0)
            
            Text(actionText)
                .typography(Typography.button3)
                .foregroundColor(Colors.textBlueLink)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.card)
                .fill(Colors.backgroundCardDark)
        )
        .environment(\.colorScheme, .dark)
    }
    
    private func staticFeedbackRowWithIcon(message: String, icon: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Colors.iconPrimaryOnColor)
            
            Text(message)
                .typography(Typography.body3)
                .foregroundColor(Colors.textPrimaryOnColor)
                .lineLimit(2)
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.card)
                .fill(Colors.backgroundCardDark)
        )
        .environment(\.colorScheme, .dark)
    }
    
    private func staticFeedbackRowWithActor(message: String, initials: String) -> some View {
        HStack(spacing: 12) {
            PDSActor(initials: initials, size: .small)
            
            Text(message)
                .typography(Typography.body3)
                .foregroundColor(Colors.textPrimaryOnColor)
                .lineLimit(2)
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.card)
                .fill(Colors.backgroundCardDark)
        )
        .environment(\.colorScheme, .dark)
    }
}

// MARK: - Actor Detail View

struct ActorDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Sizes
                actorSection(title: "Sizes", description: "Standard size variants for different contexts") {
                    HStack(spacing: 20) {
                        VStack(spacing: 8) {
                            PDSActor(image: "sampleProfile", size: .xsmall)
                            Text("24")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(image: "sampleProfile", size: .small)
                            Text("32")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(image: "sampleProfile", size: .medium)
                            Text("40")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(image: "sampleProfile", size: .large)
                            Text("56")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(image: "sampleProfile", size: .xlarge)
                            Text("80")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
                
                // Image Sources
                actorSection(title: "Image Sources", description: "Different ways to display actor content") {
                    HStack(spacing: 20) {
                        VStack(spacing: 8) {
                            PDSActor(image: "sampleProfile", size: .large)
                            Text("Image")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(initials: "JD", size: .large)
                            Text("Initials")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(systemImage: "star.fill", size: .large)
                            Text("SF Symbol")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(size: .large)
                            Text("Placeholder")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
                
                // Badge Types
                actorSection(title: "Badges", description: "Status indicators and notification counts") {
                    HStack(spacing: 16) {
                        VStack(spacing: 8) {
                            PDSActor(initials: "AB", size: .large, badge: .online)
                            Text("Online")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(initials: "CD", size: .large, badge: .offline)
                            Text("Offline")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(initials: "EF", size: .large, badge: .away)
                            Text("Away")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(initials: "GH", size: .large, badge: .count(5))
                            Text("Count")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        VStack(spacing: 8) {
                            PDSActor(initials: "IJ", size: .large, badge: .icon("checkmark"))
                            Text("Icon")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
                
                // Actor Stack
                actorSection(title: "Actor Stack", description: "Overlapping avatars for group displays") {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            PDSActorStack(urls: [nil, nil, nil], size: .medium, maxVisible: 3)
                            Spacer()
                            Text("3 actors")
                                .typography(Typography.body4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        HStack {
                            PDSActorStack(urls: [nil, nil, nil, nil, nil], size: .medium, maxVisible: 3)
                            Spacer()
                            Text("5 actors, max 3 visible")
                                .typography(Typography.body4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        HStack {
                            PDSActorStack(urls: Array(repeating: nil, count: 10), size: .small, maxVisible: 4)
                            Spacer()
                            Text("10 actors, max 4 visible")
                                .typography(Typography.body4)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Actor")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func actorSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Comment Detail View

struct CommentDetailView: View {
    @State private var showReplies = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Basic Comments
                commentSection(title: "Basic Comments", description: "Standard comment display with author info") {
                    VStack(spacing: 0) {
                        PDSComment(
                            authorName: "John Doe",
                            authorInitials: "JD",
                            text: "This is a great post! Love the design.",
                            timestamp: "2h",
                            likeCount: 12,
                            isLiked: true
                        )
                        
                        PDSComment(
                            authorName: "Jane Smith",
                            authorInitials: "JS",
                            text: "Totally agree with this. The attention to detail is impressive and I think more people should see this kind of work.",
                            timestamp: "1h",
                            isVerified: true,
                            likeCount: 5
                        )
                        
                        PDSComment(
                            authorName: "Alex Chen",
                            authorInitials: "AC",
                            text: "I have a question about the implementation. How did you handle the edge cases?",
                            timestamp: "30m"
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // Comments with Images
                commentSection(title: "Comments with Images", description: "Comments with attached photos") {
                    VStack(spacing: 0) {
                        PDSComment(
                            authorName: "David Kim",
                            authorInitials: "DK",
                            text: "Check out this view from my hike today!",
                            image: Image("Posts/SampleMedia"),
                            timestamp: "45m",
                            likeCount: 24,
                            isLiked: true
                        )
                        
                        PDSComment(
                            authorName: "Lisa Park",
                            authorInitials: "LP",
                            text: "",
                            image: Image("Posts/SampleMedia"),
                            timestamp: "2h",
                            likeCount: 8
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // Threaded Comments
                commentSection(title: "Threaded Comments", description: "Comments with nested replies") {
                    VStack(spacing: 0) {
                        PDSCommentThread(
                            comment: PDSComment(
                                authorName: "Sarah Wilson",
                                authorInitials: "SW",
                                text: "Anyone else having this issue with the latest update?",
                                timestamp: "3h",
                                likeCount: 8
                            ),
                            replies: [
                                PDSComment(
                                    authorName: "Mike Johnson",
                                    authorInitials: "MJ",
                                    text: "Yes! I've been seeing the same thing.",
                                    timestamp: "2h",
                                    likeCount: 3
                                ),
                                PDSComment(
                                    authorName: "Emily Brown",
                                    authorInitials: "EB",
                                    text: "Try clearing the cache, that worked for me.",
                                    timestamp: "1h",
                                    likeCount: 5,
                                    isLiked: true
                                )
                            ],
                            showReplies: showReplies,
                            onToggleReplies: { showReplies.toggle() }
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Comment")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func commentSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Notification Cell Detail View

struct NotificationCellDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Social Notifications
                notificationSection(title: "Social", description: "Likes, comments, and follows") {
                    VStack(spacing: 0) {
                        PDSNotificationCell(
                            type: .like,
                            actorName: "John Doe",
                            actorInitials: "JD",
                            message: "John Doe liked your photo.",
                            timestamp: "2h"
                        )
                        
                        PDSNotificationCell(
                            type: .comment,
                            actorName: "Jane Smith",
                            actorInitials: "JS",
                            message: "Jane Smith commented on your post: \"This is amazing!\"",
                            timestamp: "1h",
                            isRead: true
                        )
                        
                        PDSNotificationCell(
                            type: .follow,
                            actorName: "Alex Chen",
                            actorInitials: "AC",
                            message: "Alex Chen started following you.",
                            timestamp: "30m"
                        )
                    }
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // With Actions
                notificationSection(title: "With Actions", description: "Friend requests and invites") {
                    VStack(spacing: 0) {
                        PDSNotificationCell(
                            type: .friendRequest,
                            actorName: "Sarah Wilson",
                            actorInitials: "SW",
                            message: "Sarah Wilson sent you a friend request.",
                            timestamp: "5m",
                            actionButtons: [
                                PDSNotificationAction(title: "Accept", isPrimary: true, action: {}),
                                PDSNotificationAction(title: "Decline", action: {})
                            ]
                        )
                        
                        PDSNotificationCell(
                            type: .groupInvite,
                            actorName: "Mike Johnson",
                            actorInitials: "MJ",
                            message: "Mike Johnson invited you to join Swift Developers.",
                            timestamp: "1h",
                            actionButtons: [
                                PDSNotificationAction(title: "Join", isPrimary: true, action: {}),
                                PDSNotificationAction(title: "Ignore", action: {})
                            ]
                        )
                    }
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // Other Types
                notificationSection(title: "Other Types", description: "Various notification types") {
                    VStack(spacing: 0) {
                        PDSNotificationCell(
                            type: .birthday,
                            actorName: "Emily Brown",
                            actorInitials: "EB",
                            message: "It's Emily Brown's birthday today!",
                            timestamp: "Today"
                        )
                        
                        PDSNotificationCell(
                            type: .mention,
                            actorName: "David Lee",
                            actorInitials: "DL",
                            message: "David Lee mentioned you in a comment.",
                            timestamp: "3h",
                            isRead: true
                        )
                        
                        PDSNotificationCell(
                            type: .share,
                            actorName: "Lisa Park",
                            actorInitials: "LP",
                            message: "Lisa Park shared your post.",
                            timestamp: "5h"
                        )
                    }
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Notification Cell")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func notificationSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Post Header Detail View

struct PostHeaderDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Standard Headers
                headerSection(title: "Standard", description: "Basic post header with author info") {
                    VStack(spacing: 0) {
                        PDSPostHeader(
                            authorName: "John Doe",
                            authorInitials: "JD",
                            timestamp: "2h",
                            privacy: .public,
                            onMoreTap: {}
                        )
                        
                        PDSPostHeader(
                            authorName: "Jane Smith",
                            authorInitials: "JS",
                            timestamp: "5h",
                            privacy: .friends,
                            isVerified: true,
                            onMoreTap: {},
                            onCloseTap: {}
                        )
                    }
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // With Subtitle
                headerSection(title: "With Subtitle", description: "Location and context information") {
                    VStack(spacing: 0) {
                        PDSPostHeader(
                            authorName: "Alex Chen",
                            authorInitials: "AC",
                            subtitle: "is at San Francisco, CA",
                            timestamp: "1h",
                            privacy: .public,
                            onMoreTap: {}
                        )
                        
                        PDSPostHeader(
                            authorName: "Sarah Wilson",
                            authorInitials: "SW",
                            subtitle: "is with Mike Johnson and 3 others",
                            timestamp: "3h",
                            privacy: .friends,
                            onMoreTap: {}
                        )
                    }
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // Sponsored
                headerSection(title: "Sponsored", description: "Promoted content header") {
                    PDSPostHeader(
                        authorName: "Prism Tech",
                        authorInitials: "PT",
                        timestamp: "Sponsored",
                        isVerified: true,
                        isSponsored: true,
                        onMoreTap: {},
                        onCloseTap: {}
                    )
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // Compact Variant
                headerSection(title: "Compact", description: "Smaller header for feeds") {
                    VStack(alignment: .leading, spacing: 0) {
                        PDSPostHeaderCompact(
                            authorName: "John Doe",
                            authorInitials: "JD",
                            timestamp: "2h"
                        )
                        .padding(16)
                        
                        PDSPostHeaderCompact(
                            authorName: "Jane Smith",
                            authorInitials: "JS",
                            timestamp: "5h",
                            isVerified: true
                        )
                    .padding(16)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Post Header")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func headerSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Reaction Bar Detail View

struct ReactionBarDetailView: View {
    // Post Actions state (independent)
    @State private var postActionsReaction: PDSReactionType? = nil
    @State private var showPostActionsPicker = false
    
    // Reaction Picker demo state (independent)
    @State private var pickerDemoReaction: PDSReactionType? = nil
    @State private var pickerDemoEmoji: String? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Reaction Bar
                reactionSection(title: "Reaction Bar", description: "Summary of reactions, comments, and shares") {
                    VStack(spacing: 16) {
                        PDSReactionBar(
                            summary: PDSReactionSummary(
                                reactions: [
                                    .like: 45,
                                    .love: 23,
                                    .haha: 12
                                ]
                            ),
                            commentCount: 15,
                            shareCount: 3
                        )
                        .background(Colors.backgroundCard)
                        .cornerRadius(CornerRadius.medium)
                        
                        PDSReactionBar(
                            summary: PDSReactionSummary(
                                reactions: [
                                    .love: 3,
                                    .like: 2
                                ],
                                topReactors: [
                                    PDSReactorInfo(name: "John", url: nil, initials: "JD"),
                                    PDSReactorInfo(name: "Jane", url: nil, initials: "JS")
                                ]
                            ),
                            commentCount: 5
                        )
                        .background(Colors.backgroundCard)
                        .cornerRadius(CornerRadius.medium)
                    }
                }
                
                // Post Actions
                reactionSection(title: "Post Actions", description: "Tap to toggle, long-press for more reactions") {
                    VStack(spacing: 12) {
                        if showPostActionsPicker {
                            PDSReactionPicker(
                                onSelect: { reaction in
                                    postActionsReaction = reaction
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        showPostActionsPicker = false
                                    }
                                },
                                onCustomEmoji: { emoji in
                                    postActionsReaction = nil
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        showPostActionsPicker = false
                                    }
                                }
                            )
                            .transition(.scale.combined(with: .opacity))
                        }
                        
                        PDSPostActions(
                            userReaction: postActionsReaction,
                            onLike: {
                                if showPostActionsPicker {
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        showPostActionsPicker = false
                                    }
                                } else if postActionsReaction == nil {
                                    postActionsReaction = .like
                                } else {
                                    postActionsReaction = nil
                                }
                            },
                            onComment: {},
                            onShare: {},
                            onLongPressLike: {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    showPostActionsPicker = true
                                }
                            }
                        )
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                    }
                }
                
                // Reaction Picker
                reactionSection(title: "Reaction Picker", description: "Tap any reaction to select") {
                    VStack(spacing: 16) {
                        PDSReactionPicker(
                            onSelect: { reaction in
                                pickerDemoReaction = reaction
                                pickerDemoEmoji = nil
                            },
                            onCustomEmoji: { emoji in
                                pickerDemoEmoji = emoji
                                pickerDemoReaction = nil
                            }
                        )
                        
                        if let reaction = pickerDemoReaction {
                            Text("Selected: \(reaction.name) \(reaction.icon)")
                                .typography(Typography.body3)
                                .foregroundColor(Colors.textSecondary)
                        } else if let emoji = pickerDemoEmoji {
                            Text("Selected: \(emoji)")
                                .typography(Typography.body3)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                }
                
                // Reaction Actors
                reactionSection(title: "Reaction Actors", description: "Who reacted with avatars") {
                    VStack(spacing: 16) {
                        HStack {
                            PDSReactionActors(
                                reactors: [
                                    PDSReactorInfo(name: "John", url: nil, initials: "JD"),
                                    PDSReactorInfo(name: "Jane", url: nil, initials: "JS"),
                                    PDSReactorInfo(name: "Alex", url: nil, initials: "AC")
                                ],
                                totalCount: 3,
                                borderColor: Colors.backgroundCard
                            )
                            
                            Spacer()
                            
                            Text("3 people")
                                .typography(Typography.body4)
                                .foregroundColor(Colors.textSecondary)
                        }
                        
                        HStack {
                            PDSReactionActors(
                                reactors: [
                                    PDSReactorInfo(name: "John", url: nil, initials: "JD"),
                                    PDSReactorInfo(name: "Jane", url: nil, initials: "JS"),
                                    PDSReactorInfo(name: "Alex", url: nil, initials: "AC")
                                ],
                                totalCount: 15,
                                maxVisible: 3,
                                borderColor: Colors.backgroundCard
                            )
                            
                            Spacer()
                            
                            Text("15 people")
                                .typography(Typography.body4)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                    .padding(16)
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Reaction Bar")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func reactionSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Composer Detail View

struct ComposerDetailView: View {
    @State private var textAreaText = ""
    @State private var commentText = ""
    @State private var messageText = ""
    @State private var showComposeSheet = false
    @State private var postText = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Text Area
                composerSection(title: "Text Area", description: "Multi-line text input with character limit") {
                    PDSTextArea(
                        label: "Description",
                        placeholder: "Write something...",
                        text: $textAreaText,
                        maxLength: 280
                    )
                }
                
                // Comment Input
                composerSection(title: "Comment Input", description: "Compact inline input with avatar") {
                    PDSCommentInput(
                        text: $commentText,
                        actorInitials: "JD",
                        onSubmit: { commentText = "" }
                    )
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // Message Input
                composerSection(title: "Message Input", description: "Chat-style with action buttons") {
                    PDSMessageInput(
                        text: $messageText,
                        onSend: { messageText = "" },
                        leadingActions: [
                            .init(icon: "plus.circle.fill", action: {})
                        ],
                        trailingActions: [
                            .init(icon: "camera.fill", action: {}),
                            .init(icon: "mic.fill", action: {})
                        ]
                    )
                    .background(Colors.backgroundCard)
                    .cornerRadius(CornerRadius.medium)
                }
                
                // Compose Sheet
                composerSection(title: "Compose Sheet", description: "Full-screen compose modal") {
                    Button("Open Compose Sheet") {
                        showComposeSheet = true
                    }
                    .pdsButton(variant: .primary)
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Composers")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showComposeSheet) {
            PDSComposeSheet(
                text: $postText,
                isPresented: $showComposeSheet,
                actorName: "John Doe",
                actorInitials: "JD",
                onSubmit: { postText = "" }
            )
        }
    }
    
    private func composerSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Select Menu Detail View

struct SelectMenuDetailView: View {
    @State private var selectedOption = "Option 1"
    @State private var selectedCountry = "USA"
    @State private var showActionSheet = false
    
    struct Tag: Identifiable, Hashable {
        let id: String
        let name: String
    }
    @State private var selectedTags: Set<String> = []
    
    let options = ["Option 1", "Option 2", "Option 3"]
    let countries = ["USA", "Canada", "Mexico", "UK"]
    let tags = [
        Tag(id: "1", name: "Design"),
        Tag(id: "2", name: "Development"),
        Tag(id: "3", name: "Marketing"),
        Tag(id: "4", name: "Product"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Native Menu
                selectSection(title: "Native Menu", description: "Uses system Menu component") {
                    PDSSelectMenu(
                        label: "Select an option",
                        displayValue: selectedOption
                    ) {
                        ForEach(options, id: \.self) { option in
                            Button(option) {
                                selectedOption = option
                            }
                        }
                    }
                }
                
                // Native Picker (Menu style)
                selectSection(title: "Picker (Menu)", description: "Native Picker with menu style") {
                    PDSPicker(label: "Country", selection: $selectedCountry, style: .menu) {
                        ForEach(countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                }
                
                // Native Picker (Segmented)
                selectSection(title: "Picker (Segmented)", description: "Native segmented control") {
                    PDSPicker(label: "Country", selection: $selectedCountry, style: .segmented) {
                        ForEach(countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                }
                
                // Multi-Select List
                selectSection(title: "Multi-Select", description: "Native list with checkboxes") {
                    PDSMultiSelectList(
                        options: tags,
                        selections: $selectedTags,
                        optionLabel: { $0.name }
                    )
                    .frame(height: 180)
                    
                    if !selectedTags.isEmpty {
                        Text("Selected: \(tags.filter { selectedTags.contains($0.id) }.map { $0.name }.joined(separator: ", "))")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
                
                // With Error
                selectSection(title: "Validation", description: "Error state example") {
                    PDSSelectMenu(
                        label: "Category",
                        displayValue: "",
                        errorText: "Please select a category"
                    ) {
                        ForEach(options, id: \.self) { option in
                            Button(option) {}
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Select Menus")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func selectSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Text Field Detail View

struct TextFieldDetailView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = "john"
    @State private var website = ""
    @State private var search = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Standard Inputs
                fieldSection(title: "Standard", description: "Basic input with label") {
                    VStack(spacing: 16) {
                        PDSTextField(
                            label: "Email",
                            placeholder: "you@example.com",
                            text: $email
                        )
                        
                        PDSPasswordField(
                            label: "Password",
                            placeholder: "Enter password",
                            text: $password,
                            helpText: "Must be at least 8 characters"
                        )
                    }
                }
                
                // Validation States
                fieldSection(title: "Validation", description: "Error and disabled states") {
                    VStack(spacing: 16) {
                        PDSTextField(
                            label: "Username",
                            placeholder: "Enter username",
                            text: $username,
                            errorText: "Username is already taken"
                        )
                        
                        PDSTextField(
                            label: "Email",
                            placeholder: "you@example.com",
                            text: .constant("disabled@example.com"),
                            isDisabled: true
                        )
                    }
                }
                
                // With Icons
                fieldSection(title: "With Icons", description: "Leading and trailing icons") {
                    VStack(spacing: 16) {
                        PDSTextField(
                            placeholder: "Search",
                            text: $search,
                            leadingIcon: "magnifyingglass"
                        )
                        
                        PDSTextField(
                            label: "Website",
                            placeholder: "example.com",
                            text: $website,
                            leadingIcon: "globe",
                            trailingIcon: "arrow.up.right"
                        )
                    }
                }
                
                // Search Field
                fieldSection(title: "Search Field", description: "Pill-shaped with clear button") {
                    PDSSearchField(text: $search)
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Text Fields")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func fieldSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
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
            VStack(spacing: 48) {
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
                
                // On Media
                subNavSection(title: "On Media") {
                        PDSSubNavigationBar(
                            items: [
                                PDSSubNavItem(id: "photos", title: "Photos"),
                                PDSSubNavItem(id: "videos", title: "Videos"),
                                PDSSubNavItem(id: "albums", title: "Albums")
                            ],
                            selectedId: $selectedOnMedia,
                            context: .onMedia
                        )
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity)
                    .background(
                        Image("Posts/SampleMedia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
                    .padding(.horizontal, 20)
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
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
                .padding(.horizontal, 20)
            
            content()
        }
    }
}

// MARK: - Media Detail View

struct MediaDetailView: View {
    private let sampleImage = Image("Posts/SampleMedia")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Landscape Ratios
                mediaSection(title: "Landscape Ratios", description: "Wide aspect ratios for video and photography") {
                    VStack(spacing: 20) {
                        ForEach([PDSMediaRatio.ratio16x9, .ratio3x2, .ratio4x3, .ratio5x4], id: \.label) { ratio in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(ratio.label)
                                    .typography(Typography.meta2)
                                    .foregroundColor(Colors.textSecondary)
                                
                                PDSMedia(ratio: ratio) {
                                    sampleImage
                                        .resizable()
                                }
                            }
                        }
                    }
                }
                
                // Square
                mediaSection(title: "Square", description: "1:1 ratio for profile images and thumbnails") {
                    PDSMedia(ratio: .ratio1x1) {
                        sampleImage
                            .resizable()
                    }
                }
                
                // Portrait Ratios
                mediaSection(title: "Portrait Ratios", description: "Tall aspect ratios for stories and portraits") {
                    HStack(alignment: .top, spacing: 12) {
                        ForEach([PDSMediaRatio.ratio4x5, .ratio3x5, .ratio9x16], id: \.label) { ratio in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(ratio.label)
                                    .typography(Typography.meta2)
                                    .foregroundColor(Colors.textSecondary)
                                
                                PDSMedia(ratio: ratio) {
                                    sampleImage
                                        .resizable()
                                }
                            }
                        }
                    }
                }
                
                // Custom Ratio
                mediaSection(title: "Custom Ratio", description: "Define any aspect ratio") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("21:9 (Ultrawide)")
                            .typography(Typography.meta2)
                            .foregroundColor(Colors.textSecondary)
                        
                        PDSMedia(ratio: .custom(width: 21, height: 9)) {
                            sampleImage
                                .resizable()
                        }
                    }
                }
                
                // Placeholder States
                mediaSection(title: "Placeholder States", description: "Loading and empty states") {
                    HStack(spacing: 12) {
                        PDSMediaPlaceholder(ratio: .ratio1x1, icon: "photo")
                        PDSMediaPlaceholder(ratio: .ratio1x1, icon: "video")
                        PDSMediaPlaceholder(ratio: .ratio1x1, icon: "music.note")
                    }
                }
                
                // Async Loading
                mediaSection(title: "Async Loading", description: "Remote image with loading state") {
                    PDSAsyncMedia(
                        url: URL(string: "https://picsum.photos/800/450"),
                        ratio: .ratio16x9
                    )
                }
                
                Spacer().frame(height: 20)
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Media")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func mediaSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Progress Detail View

struct ProgressDetailView: View {
    @State private var animatedProgress: Double = 0.0
    @State private var currentStep: Int = 1
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Progress Bar
                progressSection(title: "Progress Bar", description: "Linear progress indicators") {
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Variants")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            
                            PDSProgressBar(progress: 0.65, variant: .accent)
                            PDSProgressBar(progress: 0.8, variant: .positive)
                            PDSProgressBar(progress: 0.45, variant: .warning)
                            PDSProgressBar(progress: 0.3, variant: .negative)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Sizes")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            
                            PDSProgressBar(progress: 0.6, size: .small)
                            PDSProgressBar(progress: 0.6, size: .medium)
                            PDSProgressBar(progress: 0.6, size: .large)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("With Label")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            
                            PDSProgressBar(progress: animatedProgress, showLabel: true)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Indeterminate")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            
                            PDSProgressBar(progress: 0, isIndeterminate: true)
                        }
                    }
                }
                
                // Progress Ring
                progressSection(title: "Progress Ring", description: "Circular progress indicators") {
                    VStack(spacing: 24) {
                        HStack(spacing: 24) {
                            PDSProgressRing(progress: animatedProgress, size: .small)
                            PDSProgressRing(progress: animatedProgress, size: .medium)
                            PDSProgressRing(progress: animatedProgress, size: .large)
                        }
                        
                        HStack(spacing: 24) {
                            PDSProgressRing(progress: 0.65, variant: .accent, size: .medium)
                            PDSProgressRing(progress: 0.8, variant: .positive, size: .medium)
                            PDSProgressRing(progress: 0.45, variant: .warning, size: .medium)
                        }
                        
                        HStack(spacing: 24) {
                            PDSProgressRing(progress: 0.6, size: .large, labelStyle: .fraction(current: 6, total: 10))
                            PDSProgressRing(progress: 1.0, variant: .positive, size: .large, labelStyle: .custom("Done!"))
                        }
                    }
                }
                
                // Progress Steps
                progressSection(title: "Progress Steps", description: "Multi-step flow indicators") {
                    VStack(spacing: 32) {
                        PDSProgressSteps(
                            steps: ["Account", "Profile", "Settings", "Done"],
                            currentStep: currentStep
                        )
                        
                        HStack(spacing: 12) {
                            Button("Back") {
                                if currentStep > 0 { currentStep -= 1 }
                            }
                            .pdsButton(variant: .secondary, size: .small)
                            .disabled(currentStep == 0)
                            
                            Button("Next") {
                                if currentStep < 3 { currentStep += 1 }
                            }
                            .pdsButton(variant: .primary, size: .small)
                            .disabled(currentStep == 3)
                        }
                        .fixedSize()
                        
                        PDSProgressSteps(
                            steps: ["Create account", "Set up profile", "Choose preferences", "Start exploring"],
                            currentStep: currentStep,
                            orientation: .vertical
                        )
                    }
                }
                
                // Progress Stepper
                progressSection(title: "Progress Stepper", description: "Segmented progress indicator") {
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("4 sections, 2 complete")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            PDSProgressStepper(totalSections: 4, completedSections: 2)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("5 sections, 3 complete")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            PDSProgressStepper(totalSections: 5, completedSections: 3, variant: .positive)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Interactive")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            PDSProgressStepper(totalSections: 4, completedSections: currentStep + 1)
                        }
                    }
                }
                
                // Streak Indicator
                progressSection(title: "Streak Indicator", description: "Habit tracking displays") {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Styles")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            HStack(spacing: 12) {
                                PDSStreakIndicator(count: 14, style: .flame)
                                PDSStreakIndicator(count: 7, style: .lightning)
                                PDSStreakIndicator(count: 30, style: .star)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Sizes")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            HStack(spacing: 12) {
                                PDSStreakIndicator(count: 14, size: .small)
                                PDSStreakIndicator(count: 14, size: .medium)
                                PDSStreakIndicator(count: 14, size: .large)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("States")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            HStack(spacing: 12) {
                                PDSStreakIndicator(count: 14, isActive: true)
                                PDSStreakIndicator(count: 0, isActive: false)
                            }
                        }
                    }
                }
                
                // Interactive
                progressSection(title: "Interactive", description: "Tap to animate progress") {
                    VStack(spacing: 16) {
                        PDSProgressBar(progress: animatedProgress, variant: .accent, size: .large, showLabel: true)
                        
                        HStack(spacing: 12) {
                            Button("0%") { withAnimation { animatedProgress = 0 } }
                                .pdsButton(variant: .secondary, size: .small)
                            Button("50%") { withAnimation { animatedProgress = 0.5 } }
                                .pdsButton(variant: .secondary, size: .small)
                            Button("100%") { withAnimation { animatedProgress = 1.0 } }
                                .pdsButton(variant: .primary, size: .small)
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Progress")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) {
                animatedProgress = 0.72
            }
        }
    }
    
    private func progressSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
            content()
        }
    }
}

// MARK: - Charts Detail View

struct ChartsDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                // Stat Cards
                chartSection(title: "Stat Cards", description: "Key metric displays with trends") {
                    VStack(spacing: 16) {
                        HStack(spacing: 12) {
                            PDSStatCard(value: "1,234", label: "Steps")
                            PDSStatCard(value: "87%", label: "Complete", variant: .positive)
                        }
                        
                        HStack(spacing: 12) {
                            PDSStatCard(
                                value: "2,847",
                                label: "Followers",
                                trend: .up(0.12)
                            )
                            PDSStatCard(
                                value: "$1,450",
                                label: "Expenses",
                                trend: .down(0.08, isGood: true)
                            )
                        }
                        
                        PDSStatCard(
                            value: "4.2K",
                            label: "Weekly views",
                            sparklineData: [10, 25, 18, 32, 28, 45, 38],
                            variant: .accent
                        )
                    }
                }
                
                // Sparklines
                chartSection(title: "Sparklines", description: "Inline trend indicators") {
                    VStack(spacing: 16) {
                        HStack(spacing: 8) {
                            Text("Revenue")
                                .typography(Typography.body3)
                                .foregroundColor(Colors.textSecondary)
                                .frame(width: 70, alignment: .leading)
                            PDSSparkline(data: [10, 25, 18, 32, 28, 45, 38], variant: .positive)
                                .frame(height: 32)
                        }
                        
                        HStack(spacing: 8) {
                            Text("Churn")
                                .typography(Typography.body3)
                                .foregroundColor(Colors.textSecondary)
                                .frame(width: 70, alignment: .leading)
                            PDSSparkline(data: [38, 32, 35, 28, 30, 22, 18], variant: .negative)
                                .frame(height: 32)
                        }
                        
                        HStack(spacing: 8) {
                            Text("Users")
                                .typography(Typography.body3)
                                .foregroundColor(Colors.textSecondary)
                                .frame(width: 70, alignment: .leading)
                            PDSSparkline(data: [10, 15, 25, 35, 40, 42, 48], variant: .accent)
                                .frame(height: 32)
                        }
                    }
                }
                
                // Bar Chart
                chartSection(title: "Bar Chart", description: "Vertical and horizontal comparisons") {
                    VStack(spacing: 32) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Daily Activity")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            
                            PDSBarChart(data: [
                                PDSBarChartData(label: "Mon", value: 120),
                                PDSBarChartData(label: "Tue", value: 180),
                                PDSBarChartData(label: "Wed", value: 95),
                                PDSBarChartData(label: "Thu", value: 210),
                                PDSBarChartData(label: "Fri", value: 165),
                                PDSBarChartData(label: "Sat", value: 85),
                                PDSBarChartData(label: "Sun", value: 140)
                            ])
                            .frame(height: 180)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Skills")
                                .typography(Typography.meta3)
                                .foregroundColor(Colors.textSecondary)
                            
                            PDSBarChart(data: [
                                PDSBarChartData(label: "React", value: 4500, color: Colors.persistentAccent),
                                PDSBarChartData(label: "Swift", value: 3200, color: Colors.persistentWarning),
                                PDSBarChartData(label: "Python", value: 2800, color: Colors.persistentPositive),
                                PDSBarChartData(label: "Go", value: 1900, color: Colors.blue400)
                            ], orientation: .horizontal)
                            .frame(height: 140)
                        }
                    }
                }
                
                // Line Chart
                chartSection(title: "Line Chart", description: "Trends over time") {
                    PDSLineChart(data: [
                        PDSLineChartData(label: "Mon", value: 120),
                        PDSLineChartData(label: "Tue", value: 180),
                        PDSLineChartData(label: "Wed", value: 145),
                        PDSLineChartData(label: "Thu", value: 210),
                        PDSLineChartData(label: "Fri", value: 195),
                        PDSLineChartData(label: "Sat", value: 165),
                        PDSLineChartData(label: "Sun", value: 230)
                    ])
                    .frame(height: 200)
                }
                
                // Donut Chart
                chartSection(title: "Donut Chart", description: "Proportional breakdowns") {
                    VStack(spacing: 16) {
                        PDSDonutChart(
                            data: [
                                PDSDonutChartData(label: "Food", value: 450, color: Colors.persistentAccent),
                                PDSDonutChartData(label: "Transport", value: 280, color: Colors.persistentPositive),
                                PDSDonutChartData(label: "Shopping", value: 320, color: Colors.persistentWarning),
                                PDSDonutChartData(label: "Other", value: 150, color: Colors.gray400)
                            ],
                            centerLabel: "Total",
                            centerValue: "$1.2K"
                        )
                        
                        VStack(spacing: 8) {
                            legendRow(color: Colors.persistentAccent, label: "Food", value: "$450")
                            legendRow(color: Colors.persistentPositive, label: "Transport", value: "$280")
                            legendRow(color: Colors.persistentWarning, label: "Shopping", value: "$320")
                            legendRow(color: Colors.gray400, label: "Other", value: "$150")
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Charts")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func legendRow(color: Color, label: String, value: String) -> some View {
        HStack(spacing: 8) {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            
            Text(label)
                .typography(Typography.body4)
                .foregroundColor(Colors.textSecondary)
                .lineLimit(1)
            
            Spacer()
            
            Text(value)
                .typography(Typography.body4)
                .foregroundColor(Colors.textPrimary)
                .lineLimit(1)
        }
    }
    
    private func chartSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text(title)
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
                
                Text(description)
                    .typography(PDSTextScale.content.body)
                    .foregroundColor(Colors.textSecondary)
            }
            
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

