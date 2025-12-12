import SwiftUI

// MARK: - Sub Navigation Item

/// Represents an item in the sub navigation bar
struct PDSSubNavItem: Identifiable, Equatable {
    let id: String
    let title: String
    var icon: String? = nil
    var badge: Int? = nil
    
    init(id: String = UUID().uuidString, title: String, icon: String? = nil, badge: Int? = nil) {
        self.id = id
        self.title = title
        self.icon = icon
        self.badge = badge
    }
}

/// Context for sub navigation appearance
enum PDSSubNavContext {
    case surface        // Standard surface background
    case onMedia        // On images/videos
}

// MARK: - Sub Navigation Bar

/// A horizontal sub-navigation bar with selectable items
struct PDSSubNavigationBar: View {
    let items: [PDSSubNavItem]
    @Binding var selectedId: String
    var context: PDSSubNavContext = .surface
    var onItemSelected: ((PDSSubNavItem) -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(items) { item in
                    subNavButton(for: item)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
    
    @ViewBuilder
    private func subNavButton(for item: PDSSubNavItem) -> some View {
        let isSelected = selectedId == item.id
        
        Button {
            selectedId = item.id
            onItemSelected?(item)
        } label: {
            standardItemLabel(item: item, isSelected: isSelected)
        }
        .buttonStyle(.plain)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
    
    // MARK: - Standard Style
    
    @ViewBuilder
    private func standardItemLabel(item: PDSSubNavItem, isSelected: Bool) -> some View {
        HStack(spacing: 6) {
            if let icon = item.icon {
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .medium))
            }
            
            Text(item.title)
                .typography(Typography.button3)
            
            if let badge = item.badge, badge > 0 {
                Text("\(badge)")
                    .typography(Typography.meta4)
                    .foregroundColor(badgeTextColor(isSelected: isSelected))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(
                        Capsule()
                            .fill(badgeBackgroundColor(isSelected: isSelected))
                    )
            }
        }
        .foregroundColor(standardForegroundColor(isSelected: isSelected))
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(standardBackgroundColor(isSelected: isSelected))
        )
    }
    
    private func standardForegroundColor(isSelected: Bool) -> Color {
        switch context {
        case .surface:
            return isSelected ? Colors.persistentAccent : Colors.textPrimary
        case .onMedia:
            // On media: active uses black text on white bg, inactive uses white text
            return isSelected ? Colors.gray950 : Colors.textPrimaryOnMedia
        }
    }
    
    private func standardBackgroundColor(isSelected: Bool) -> Color {
        switch context {
        case .surface:
            // Surface: primary deemphasized bg for active, transparent for inactive
            return isSelected ? Colors.primaryDeemphasizedButtonBackground : Color.clear
        case .onMedia:
            // On media: white for active, transparent for inactive
            return isSelected ? Colors.white : Color.clear
        }
    }
    
    private func badgeTextColor(isSelected: Bool) -> Color {
        switch context {
        case .surface:
            return isSelected ? Colors.persistentAccent : Colors.textPrimary
        case .onMedia:
            // On media: active uses black text on white bg, inactive uses white text
            return isSelected ? Colors.gray950 : Colors.textPrimaryOnMedia
        }
    }
    
    private func badgeBackgroundColor(isSelected: Bool) -> Color {
        switch context {
        case .surface:
            return isSelected ? Colors.persistentAccentDeemphasized : Colors.backgroundCard
        case .onMedia:
            // On media: active uses light gray on white bg, inactive uses translucent white
            return isSelected ? Colors.gray200 : Colors.white.opacity(0.1)
        }
    }
}

// MARK: - Convenience Initializers

extension PDSSubNavigationBar {
    /// Creates a sub navigation bar with string items
    init(
        items: [String],
        selectedIndex: Binding<Int>,
        context: PDSSubNavContext = .surface,
        onItemSelected: ((Int) -> Void)? = nil
    ) {
        let navItems = items.enumerated().map { PDSSubNavItem(id: "\($0.offset)", title: $0.element) }
        self.items = navItems
        self._selectedId = Binding(
            get: { "\(selectedIndex.wrappedValue)" },
            set: { newValue in
                if let index = Int(newValue) {
                    selectedIndex.wrappedValue = index
                }
            }
        )
        self.context = context
        self.onItemSelected = onItemSelected != nil ? { item in
            if let index = Int(item.id) {
                onItemSelected?(index)
            }
        } : nil
    }
}

// MARK: - Preview

#Preview("Sub Navigation Bar") {
    struct PreviewContainer: View {
        @State private var selectedStandard = "all"
        @State private var selectedCallback = "posts"
        @State private var selectedScrollable = "item1"
        @State private var selectedOnMedia = "photos"
        @State private var callbackMessage = ""
        
        var body: some View {
            ScrollView {
                VStack(spacing: 32) {
                    // Standard Navigation
                    sectionView(title: "Standard") {
                        PDSSubNavigationBar(
                            items: [
                                PDSSubNavItem(id: "all", title: "All"),
                                PDSSubNavItem(id: "posts", title: "Posts"),
                                PDSSubNavItem(id: "videos", title: "Videos"),
                                PDSSubNavItem(id: "tagged", title: "Tagged")
                            ],
                            selectedId: $selectedStandard
                        )
                        .background(Colors.backgroundSurface)
                    }
                    
                    Divider()
                    
                    // With Callback Action
                    sectionView(title: "With Callback") {
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
                            .background(Colors.backgroundSurface)
                            
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
                    sectionView(title: "Scrollable") {
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
                        .background(Colors.backgroundSurface)
                    }
                    
                    Divider()
                    
                    // On Media
                    sectionView(title: "On Media") {
                        ZStack {
                            RoundedRectangle(cornerRadius: CornerRadius.card)
                                .fill(
                                    LinearGradient(
                                        colors: [Colors.gray700, Colors.gray500],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                            
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
                        .frame(height: 80)
                    }
                    
                    Spacer().frame(height: 40)
                }
                .padding(.vertical, 24)
            }
            .background(Colors.backgroundSurface)
        }
        
        @ViewBuilder
        private func sectionView<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .typography(Typography.headline4Emphasized)
                    .foregroundColor(Colors.textPrimary)
                    .padding(.horizontal, 24)
                
                content()
            }
        }
    }
    
    return PreviewContainer()
}

#Preview("With Icons") {
    struct IconPreviewContainer: View {
        @State private var selected = "home"
        
        var body: some View {
            VStack(spacing: 24) {
                PDSSubNavigationBar(
                    items: [
                        PDSSubNavItem(id: "home", title: "Home", icon: "house"),
                        PDSSubNavItem(id: "search", title: "Search", icon: "magnifyingglass"),
                        PDSSubNavItem(id: "create", title: "Create", icon: "plus"),
                        PDSSubNavItem(id: "profile", title: "Profile", icon: "person")
                    ],
                    selectedId: $selected
                )
            }
            .padding(.vertical, 24)
            .background(Colors.backgroundSurface)
        }
    }
    
    return IconPreviewContainer()
}
