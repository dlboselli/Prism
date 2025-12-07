//
//  MoreTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct MoreTabView: View {
    @State private var toggleState1 = true
    @State private var toggleState3 = true
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        ColorsShowcaseView()
                    } label: {
                        Text("Colors")
                    }
                    
                    NavigationLink {
                        TypographyShowcaseView()
                    } label: {
                        Text("Typography")
                    }
                    
                    NavigationLink {
                        ShadowsShowcaseView()
                    } label: {
                        Text("Shadows")
                    }
                } header: {
                    Text("Design System")
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
            .navigationTitle("More")
        }
    }
}

// MARK: - Colors Showcase

struct ColorsShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Semantic Colors
                semanticColorsSection
                
                // Gray Scale
                colorPaletteSection(
                    title: "Gray",
                    colors: [
                        ("00", Colors.gray00),
                        ("05", Colors.gray05),
                        ("10", Colors.gray10),
                        ("15", Colors.gray15),
                        ("20", Colors.gray20),
                        ("25", Colors.gray25),
                        ("30", Colors.gray30),
                        ("35", Colors.gray35),
                        ("40", Colors.gray40),
                        ("45", Colors.gray45),
                        ("50", Colors.gray50),
                        ("55", Colors.gray55),
                        ("60", Colors.gray60),
                        ("65", Colors.gray65),
                        ("70", Colors.gray70),
                        ("75", Colors.gray75),
                        ("80", Colors.gray80),
                        ("85", Colors.gray85),
                        ("90", Colors.gray90),
                        ("95", Colors.gray95),
                        ("100", Colors.gray100),
                    ]
                )
                
                // Blue Scale
                colorPaletteSection(
                    title: "Blue",
                    colors: [
                        ("00", Colors.blue00),
                        ("05", Colors.blue05),
                        ("10", Colors.blue10),
                        ("15", Colors.blue15),
                        ("20", Colors.blue20),
                        ("25", Colors.blue25),
                        ("30", Colors.blue30),
                        ("35", Colors.blue35),
                        ("40", Colors.blue40),
                        ("45", Colors.blue45),
                        ("50", Colors.blue50),
                        ("55", Colors.blue55),
                        ("60", Colors.blue60),
                        ("65", Colors.blue65),
                        ("70", Colors.blue70),
                        ("75", Colors.blue75),
                        ("80", Colors.blue80),
                        ("85", Colors.blue85),
                        ("90", Colors.blue90),
                        ("95", Colors.blue95),
                        ("100", Colors.blue100),
                    ]
                )
                
                // Green Scale
                colorPaletteSection(
                    title: "Green",
                    colors: [
                        ("05", Colors.green05),
                        ("10", Colors.green10),
                        ("15", Colors.green15),
                        ("20", Colors.green20),
                        ("25", Colors.green25),
                        ("30", Colors.green30),
                        ("35", Colors.green35),
                        ("40", Colors.green40),
                        ("45", Colors.green45),
                        ("50", Colors.green50),
                        ("55", Colors.green55),
                        ("60", Colors.green60),
                        ("65", Colors.green65),
                        ("70", Colors.green70),
                        ("75", Colors.green75),
                        ("80", Colors.green80),
                        ("85", Colors.green85),
                        ("90", Colors.green90),
                        ("95", Colors.green95),
                        ("100", Colors.green100),
                    ]
                )
                
                // Cyan Scale
                colorPaletteSection(
                    title: "Cyan",
                    colors: [
                        ("00", Colors.cyan00),
                        ("05", Colors.cyan05),
                        ("10", Colors.cyan10),
                        ("15", Colors.cyan15),
                        ("20", Colors.cyan20),
                        ("25", Colors.cyan25),
                        ("30", Colors.cyan30),
                        ("35", Colors.cyan35),
                        ("40", Colors.cyan40),
                        ("45", Colors.cyan45),
                        ("50", Colors.cyan50),
                        ("55", Colors.cyan55),
                        ("60", Colors.cyan60),
                        ("65", Colors.cyan65),
                        ("70", Colors.cyan70),
                        ("75", Colors.cyan75),
                        ("80", Colors.cyan80),
                        ("85", Colors.cyan85),
                        ("90", Colors.cyan90),
                        ("95", Colors.cyan95),
                        ("100", Colors.cyan100),
                    ]
                )
                
                // Orange Scale
                colorPaletteSection(
                    title: "Orange",
                    colors: [
                        ("00", Colors.orange00),
                        ("05", Colors.orange05),
                        ("10", Colors.orange10),
                        ("15", Colors.orange15),
                        ("20", Colors.orange20),
                        ("25", Colors.orange25),
                        ("30", Colors.orange30),
                        ("35", Colors.orange35),
                        ("40", Colors.orange40),
                        ("45", Colors.orange45),
                        ("50", Colors.orange50),
                        ("55", Colors.orange55),
                        ("60", Colors.orange60),
                        ("66", Colors.orange66),
                        ("70", Colors.orange70),
                    ]
                )
                
                // Red Scale
                colorPaletteSection(
                    title: "Red",
                    colors: [
                        ("00", Colors.red00),
                        ("05", Colors.red05),
                        ("10", Colors.red10),
                        ("15", Colors.red15),
                        ("20", Colors.red20),
                        ("25", Colors.red25),
                        ("30", Colors.red30),
                        ("35", Colors.red35),
                        ("40", Colors.red40),
                        ("45", Colors.red45),
                        ("50", Colors.red50),
                        ("55", Colors.red55),
                        ("60", Colors.red60),
                        ("65", Colors.red65),
                        ("70", Colors.red70),
                        ("75", Colors.red75),
                        ("80", Colors.red80),
                        ("85", Colors.red85),
                        ("90", Colors.red90),
                        ("95", Colors.red95),
                        ("100", Colors.red100),
                    ]
                )
                
                // Yellow Scale
                colorPaletteSection(
                    title: "Yellow",
                    colors: [
                        ("00", Colors.yellow00),
                        ("05", Colors.yellow05),
                        ("10", Colors.yellow10),
                        ("15", Colors.yellow15),
                        ("20", Colors.yellow20),
                        ("25", Colors.yellow25),
                        ("30", Colors.yellow30),
                        ("35", Colors.yellow35),
                        ("40", Colors.yellow40),
                        ("45", Colors.yellow45),
                        ("50", Colors.yellow50),
                        ("55", Colors.yellow55),
                        ("60", Colors.yellow60),
                        ("65", Colors.yellow65),
                        ("70", Colors.yellow70),
                        ("75", Colors.yellow75),
                        ("80", Colors.yellow80),
                        ("85", Colors.yellow85),
                        ("90", Colors.yellow90),
                        ("95", Colors.yellow95),
                        ("100", Colors.yellow100),
                    ]
                )
                
                // Pink Scale
                colorPaletteSection(
                    title: "Pink",
                    colors: [
                        ("00", Colors.pink00),
                        ("05", Colors.pink05),
                        ("10", Colors.pink10),
                        ("15", Colors.pink15),
                        ("20", Colors.pink20),
                        ("25", Colors.pink25),
                        ("30", Colors.pink30),
                        ("35", Colors.pink35),
                        ("40", Colors.pink40),
                        ("45", Colors.pink45),
                        ("50", Colors.pink50),
                        ("55", Colors.pink55),
                        ("60", Colors.pink60),
                        ("65", Colors.pink65),
                        ("70", Colors.pink70),
                        ("75", Colors.pink75),
                        ("80", Colors.pink80),
                        ("85", Colors.pink85),
                        ("90", Colors.pink90),
                        ("95", Colors.pink95),
                        ("100", Colors.pink100),
                    ]
                )
                
                // Purple Scale
                colorPaletteSection(
                    title: "Purple",
                    colors: [
                        ("00", Colors.purple00),
                        ("05", Colors.purple05),
                        ("10", Colors.purple10),
                        ("15", Colors.purple15),
                        ("20", Colors.purple20),
                        ("25", Colors.purple25),
                        ("30", Colors.purple30),
                        ("35", Colors.purple35),
                        ("40", Colors.purple40),
                        ("45", Colors.purple45),
                        ("50", Colors.purple50),
                        ("55", Colors.purple55),
                        ("60", Colors.purple60),
                        ("65", Colors.purple65),
                        ("70", Colors.purple70),
                        ("75", Colors.purple75),
                        ("80", Colors.purple80),
                        ("85", Colors.purple85),
                        ("90", Colors.purple90),
                        ("95", Colors.purple95),
                        ("100", Colors.purple100),
                    ]
                )
                
                // Teal Scale
                colorPaletteSection(
                    title: "Teal",
                    colors: [
                        ("00", Colors.teal00),
                        ("05", Colors.teal05),
                        ("10", Colors.teal10),
                        ("15", Colors.teal15),
                        ("20", Colors.teal20),
                        ("25", Colors.teal25),
                        ("30", Colors.teal30),
                        ("35", Colors.teal35),
                        ("40", Colors.teal40),
                        ("45", Colors.teal45),
                        ("50", Colors.teal50),
                        ("55", Colors.teal55),
                        ("60", Colors.teal60),
                        ("65", Colors.teal65),
                        ("70", Colors.teal70),
                        ("75", Colors.teal75),
                        ("80", Colors.teal80),
                        ("85", Colors.teal85),
                        ("90", Colors.teal90),
                        ("95", Colors.teal95),
                        ("100", Colors.teal100),
                    ]
                )
                
                // Chartreuse Scale
                colorPaletteSection(
                    title: "Chartreuse",
                    colors: [
                        ("00", Colors.chartreuse00),
                        ("05", Colors.chartreuse05),
                        ("10", Colors.chartreuse10),
                        ("15", Colors.chartreuse15),
                        ("20", Colors.chartreuse20),
                        ("25", Colors.chartreuse25),
                        ("30", Colors.chartreuse30),
                        ("35", Colors.chartreuse35),
                        ("40", Colors.chartreuse40),
                        ("45", Colors.chartreuse45),
                        ("50", Colors.chartreuse50),
                        ("55", Colors.chartreuse55),
                        ("60", Colors.chartreuse60),
                        ("65", Colors.chartreuse65),
                        ("70", Colors.chartreuse70),
                        ("75", Colors.chartreuse75),
                        ("80", Colors.chartreuse80),
                        ("85", Colors.chartreuse85),
                        ("90", Colors.chartreuse90),
                        ("95", Colors.chartreuse95),
                        ("100", Colors.chartreuse100),
                    ]
                )
                
                // Fuchsia Scale
                colorPaletteSection(
                    title: "Fuchsia",
                    colors: [
                        ("00", Colors.fuchsia00),
                        ("05", Colors.fuchsia05),
                        ("10", Colors.fuchsia10),
                        ("15", Colors.fuchsia15),
                        ("20", Colors.fuchsia20),
                        ("25", Colors.fuchsia25),
                        ("30", Colors.fuchsia30),
                        ("35", Colors.fuchsia35),
                        ("40", Colors.fuchsia40),
                        ("45", Colors.fuchsia45),
                        ("50", Colors.fuchsia50),
                        ("55", Colors.fuchsia55),
                        ("60", Colors.fuchsia60),
                        ("65", Colors.fuchsia65),
                        ("70", Colors.fuchsia70),
                        ("75", Colors.fuchsia75),
                        ("80", Colors.fuchsia80),
                        ("85", Colors.fuchsia85),
                        ("90", Colors.fuchsia90),
                        ("95", Colors.fuchsia95),
                        ("100", Colors.fuchsia100),
                    ]
                )
                
                // Magenta Scale
                colorPaletteSection(
                    title: "Magenta",
                    colors: [
                        ("00", Colors.magenta00),
                        ("05", Colors.magenta05),
                        ("10", Colors.magenta10),
                        ("15", Colors.magenta15),
                        ("20", Colors.magenta20),
                        ("25", Colors.magenta25),
                        ("30", Colors.magenta30),
                        ("35", Colors.magenta35),
                        ("40", Colors.magenta40),
                        ("45", Colors.magenta45),
                        ("50", Colors.magenta50),
                        ("55", Colors.magenta55),
                        ("60", Colors.magenta60),
                        ("65", Colors.magenta65),
                        ("70", Colors.magenta70),
                        ("75", Colors.magenta75),
                        ("80", Colors.magenta80),
                        ("85", Colors.magenta85),
                        ("90", Colors.magenta90),
                        ("95", Colors.magenta95),
                        ("100", Colors.magenta100),
                    ]
                )
                
                // Black & White
                colorPaletteSection(
                    title: "Black (Alpha)",
                    colors: [
                        ("100%", Colors.black),
                        ("80%", Colors.blackAlpha80),
                        ("65%", Colors.blackAlpha65),
                        ("60%", Colors.blackAlpha60),
                        ("50%", Colors.blackAlpha50),
                        ("40%", Colors.blackAlpha40),
                        ("35%", Colors.blackAlpha35),
                        ("30%", Colors.blackAlpha30),
                        ("20%", Colors.blackAlpha20),
                        ("15%", Colors.blackAlpha15),
                        ("10%", Colors.blackAlpha10),
                        ("05%", Colors.blackAlpha05),
                    ]
                )
                
                colorPaletteSection(
                    title: "White (Alpha)",
                    colors: [
                        ("100%", Colors.white),
                        ("90%", Colors.whiteAlpha90),
                        ("80%", Colors.whiteAlpha80),
                        ("60%", Colors.whiteAlpha60),
                        ("50%", Colors.whiteAlpha50),
                        ("40%", Colors.whiteAlpha40),
                        ("30%", Colors.whiteAlpha30),
                        ("20%", Colors.whiteAlpha20),
                        ("15%", Colors.whiteAlpha15),
                        ("10%", Colors.whiteAlpha10),
                        ("05%", Colors.whiteAlpha05),
                    ]
                )
            }
            .padding(20)
        }
        .background(Colors.surfaceBackground)
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.large)
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
    
    private func colorPaletteSection(title: String, colors: [(String, Color)]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .typography(Typography.headline2Emphasized)
                .foregroundColor(Colors.textPrimary)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 7), spacing: 4) {
                ForEach(colors, id: \.0) { (label, color) in
                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(color)
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Colors.elevationBorderEmphasis, lineWidth: 1)
                            )
                        
                        Text(label)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
        }
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
                        .padding(16)
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
                            PDSSubNavItem(id: "reels", title: "Reels"),
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
                            PDSSubNavItem(id: "item4", title: "Groups"),
                            PDSSubNavItem(id: "item5", title: "Pages"),
                            PDSSubNavItem(id: "item6", title: "Events"),
                            PDSSubNavItem(id: "item7", title: "Marketplace"),
                            PDSSubNavItem(id: "item8", title: "Gaming")
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
    MoreTabView()
}

