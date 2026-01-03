//
//  PDSActor.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A profile photo/avatar component supporting multiple sizes,
//  image sources, status badges, and group stacking.
//

import SwiftUI

// MARK: - Actor Size

/// Standard sizes for PDSActor
enum PDSActorSize: CGFloat {
    case xsmall = 24   // Inline mentions, compact lists
    case small = 32    // List cells, comments
    case medium = 40   // Standard list cells, cards
    case large = 56    // Profile headers, chat
    case xlarge = 80   // Profile pages, settings
    
    /// Icon size relative to actor size
    var iconSize: CGFloat {
        rawValue * 0.45
    }
    
    /// Font size for initials
    var initialsFont: Font {
        switch self {
        case .xsmall: return .system(size: 10, weight: .semibold)
        case .small: return .system(size: 12, weight: .semibold)
        case .medium: return .system(size: 14, weight: .semibold)
        case .large: return .system(size: 20, weight: .semibold)
        case .xlarge: return .system(size: 28, weight: .semibold)
        }
    }
    
    /// Badge size relative to actor size
    var badgeSize: CGFloat {
        switch self {
        case .xsmall: return 8
        case .small: return 10
        case .medium: return 12
        case .large: return 16
        case .xlarge: return 20
        }
    }
    
    /// Badge offset from edge
    var badgeOffset: CGFloat {
        switch self {
        case .xsmall: return 1
        case .small: return 1
        case .medium: return 2
        case .large: return 2
        case .xlarge: return 3
        }
    }
}

// MARK: - Actor Badge Type

/// Badge types for status indicators
enum PDSActorBadgeType {
    case online                    // Green dot
    case offline                   // Gray dot
    case away                      // Yellow dot
    case count(Int)                // Notification count
    case icon(String)              // Custom SF Symbol
    
    var color: Color {
        switch self {
        case .online: return Colors.actorOnlineIndicator
        case .offline: return Colors.actorOfflineIndicator
        case .away: return Colors.persistentWarning
        case .count: return Colors.persistentNegative
        case .icon: return Colors.persistentAccent
        }
    }
}

// MARK: - Actor Source

/// Image source for PDSActor
///
/// Usage:
/// ```swift
/// PDSActor(source: .url(profileURL, fallback: "JD"))
/// PDSActor(source: .asset("profile_photo"))
/// PDSActor(source: .initials("JD"))
/// ```
enum PDSActorSource {
    /// Remote URL with optional initials fallback
    case url(URL?, fallback: String? = nil)
    
    /// Local asset image
    case asset(String)
    
    /// SF Symbol icon
    case systemImage(String)
    
    /// Text initials (2 characters max displayed)
    case initials(String)
    
    /// Default placeholder icon
    case placeholder
}

// MARK: - PDSActor View

/// A profile photo/avatar component
///
/// Usage:
/// ```swift
/// // With source enum (recommended)
/// PDSActor(source: .url(profileURL, fallback: "JD"), size: .medium)
/// PDSActor(source: .initials("JD"), size: .large, badge: .online)
///
/// // Convenience initializers
/// PDSActor(url: profileURL, size: .medium)
/// PDSActor(initials: "JD", size: .large)
/// PDSActor(size: .medium)  // Placeholder
///
/// // Custom pixel size
/// PDSActor(source: .initials("JD"), size: 36)
/// ```
struct PDSActor: View {
    // MARK: - Properties
    
    private let source: PDSActorSource
    private let sizeValue: CGFloat
    private let sizeEnum: PDSActorSize?
    private let badge: PDSActorBadgeType?
    
    // MARK: - Primary Initializer
    
    /// Creates an actor with a source, size, and optional badge
    /// - Parameters:
    ///   - source: Image source (url, asset, initials, etc.)
    ///   - size: Standard size enum
    ///   - badge: Optional status badge
    init(source: PDSActorSource, size: PDSActorSize = .medium, badge: PDSActorBadgeType? = nil) {
        self.source = source
        self.sizeValue = size.rawValue
        self.sizeEnum = size
        self.badge = badge
    }
    
    /// Creates an actor with a source and custom pixel size
    /// - Parameters:
    ///   - source: Image source (url, asset, initials, etc.)
    ///   - size: Custom size in points
    ///   - badge: Optional status badge
    init(source: PDSActorSource, size: CGFloat, badge: PDSActorBadgeType? = nil) {
        self.source = source
        self.sizeValue = size
        self.sizeEnum = nil
        self.badge = badge
    }
    
    // MARK: - Convenience Initializers
    
    /// Creates an actor with a remote URL
    init(url: URL?, size: PDSActorSize = .medium, badge: PDSActorBadgeType? = nil) {
        self.init(source: .url(url), size: size, badge: badge)
    }
    
    /// Creates an actor with a remote URL (custom size)
    init(url: URL?, size: CGFloat, badge: PDSActorBadgeType? = nil) {
        self.init(source: .url(url), size: size, badge: badge)
    }
    
    /// Creates an actor with URL and initials fallback
    init(url: URL?, fallbackInitials: String?, size: PDSActorSize = .medium, badge: PDSActorBadgeType? = nil) {
        self.init(source: .url(url, fallback: fallbackInitials), size: size, badge: badge)
    }
    
    /// Creates an actor with URL and initials fallback (custom size)
    init(url: URL?, fallbackInitials: String?, size: CGFloat, badge: PDSActorBadgeType? = nil) {
        self.init(source: .url(url, fallback: fallbackInitials), size: size, badge: badge)
    }
    
    /// Creates an actor with an asset image
    init(image: String, size: PDSActorSize = .medium, badge: PDSActorBadgeType? = nil) {
        self.init(source: .asset(image), size: size, badge: badge)
    }
    
    /// Creates an actor with an asset image (custom size)
    init(image: String, size: CGFloat, badge: PDSActorBadgeType? = nil) {
        self.init(source: .asset(image), size: size, badge: badge)
    }
    
    /// Creates an actor with initials
    init(initials: String, size: PDSActorSize = .medium, badge: PDSActorBadgeType? = nil) {
        self.init(source: .initials(initials), size: size, badge: badge)
    }
    
    /// Creates an actor with initials (custom size)
    init(initials: String, size: CGFloat, badge: PDSActorBadgeType? = nil) {
        self.init(source: .initials(initials), size: size, badge: badge)
    }
    
    /// Creates an actor with an SF Symbol
    init(systemImage: String, size: PDSActorSize = .medium, badge: PDSActorBadgeType? = nil) {
        self.init(source: .systemImage(systemImage), size: size, badge: badge)
    }
    
    /// Creates an actor with an SF Symbol (custom size)
    init(systemImage: String, size: CGFloat, badge: PDSActorBadgeType? = nil) {
        self.init(source: .systemImage(systemImage), size: size, badge: badge)
    }
    
    /// Creates an actor with default placeholder
    init(size: PDSActorSize = .medium, badge: PDSActorBadgeType? = nil) {
        self.init(source: .placeholder, size: size, badge: badge)
    }
    
    // MARK: - Computed Properties
    
    private var iconSize: CGFloat {
        sizeEnum?.iconSize ?? (sizeValue * 0.45)
    }
    
    private var badgeSize: CGFloat {
        sizeEnum?.badgeSize ?? (sizeValue * 0.3)
    }
    
    private var badgeOffset: CGFloat {
        sizeEnum?.badgeOffset ?? (sizeValue * 0.05)
    }
    
    private var initialsFont: Font {
        sizeEnum?.initialsFont ?? .system(size: sizeValue * 0.35, weight: .semibold)
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Main avatar
            actorContent
                .frame(width: sizeValue, height: sizeValue)
                .clipShape(Circle())
            
            // Badge overlay
            if let badge = badge {
                PDSActorBadge(type: badge, size: badgeSize)
                    .offset(x: badgeOffset, y: badgeOffset)
            }
        }
    }
    
    // MARK: - Actor Content
    
    @ViewBuilder
    private var actorContent: some View {
        switch source {
        case .url(let url, let fallback):
            if let url = url {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        fallbackView(fallback)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        fallbackView(fallback)
                    @unknown default:
                        fallbackView(fallback)
                    }
                }
            } else {
                fallbackView(fallback)
            }
            
        case .asset(let imageName):
            if let uiImage = UIImage(named: imageName) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                placeholderView
            }
            
        case .systemImage(let systemName):
            systemImageView(systemName)
            
        case .initials(let text):
            initialsView(text)
            
        case .placeholder:
            placeholderView
        }
    }
    
    @ViewBuilder
    private func fallbackView(_ initials: String?) -> some View {
        if let initials = initials, !initials.isEmpty {
            initialsView(initials)
        } else {
            placeholderView
        }
    }
    
    private var placeholderView: some View {
        ZStack {
            Circle()
                .fill(Colors.actorPlaceholderBackground)
            
            Image(systemName: "person.fill")
                .font(.system(size: iconSize))
                .foregroundColor(Colors.iconPlaceholder)
        }
    }
    
    private func systemImageView(_ systemName: String) -> some View {
        ZStack {
            Circle()
                .fill(Colors.actorPlaceholderBackground)
            
            Image(systemName: systemName)
                .font(.system(size: iconSize))
                .foregroundColor(Colors.iconPlaceholder)
        }
    }
    
    private func initialsView(_ text: String) -> some View {
        ZStack {
            Circle()
                .fill(Colors.actorInitialsBackground)
            
            Text(String(text.prefix(2)).uppercased())
                .font(initialsFont)
                .foregroundColor(Colors.textPrimaryOnColor)
        }
    }
}

// MARK: - PDSActorBadge

/// Badge component for status indicators
struct PDSActorBadge: View {
    let type: PDSActorBadgeType
    let size: CGFloat
    
    var body: some View {
        Group {
            switch type {
            case .online, .offline, .away:
                Circle()
                    .fill(type.color)
                    .frame(width: size, height: size)
                    .overlay(
                        Circle()
                            .stroke(Colors.backgroundSurface, lineWidth: size * 0.15)
                    )
                
            case .count(let count):
                let displayCount = count > 99 ? "99+" : "\(count)"
                Text(displayCount)
                    .font(.system(size: size * 0.6, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, size * 0.3)
                    .frame(minWidth: size, minHeight: size)
                    .background(
                        Capsule()
                            .fill(type.color)
                    )
                    .overlay(
                        Capsule()
                            .stroke(Colors.backgroundSurface, lineWidth: size * 0.12)
                    )
                
            case .icon(let systemName):
                Image(systemName: systemName)
                    .font(.system(size: size * 0.6, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: size, height: size)
                    .background(
                        Circle()
                            .fill(type.color)
                    )
                    .overlay(
                        Circle()
                            .stroke(Colors.backgroundSurface, lineWidth: size * 0.12)
                    )
            }
        }
    }
}

// MARK: - PDSActorStack

/// A stack of overlapping actors for group displays
///
/// Usage:
/// ```swift
/// PDSActorStack(urls: [url1, url2, url3], size: .small, maxVisible: 3)
/// PDSActorStack(sources: [.initials("JD"), .initials("AB")], size: .medium)
/// // With custom border color to match background
/// PDSActorStack(urls: urls, borderColor: Colors.backgroundSurface)
/// ```
struct PDSActorStack: View {
    let sources: [PDSActorSource]
    let size: PDSActorSize
    let maxVisible: Int
    let borderColor: Color
    
    private var overlapOffset: CGFloat {
        size.rawValue * 0.24
    }
    
    private var visibleSources: [PDSActorSource] {
        Array(sources.prefix(maxVisible))
    }
    
    private var overflowCount: Int {
        max(0, sources.count - maxVisible)
    }
    
    /// Creates a stack with source enums
    init(sources: [PDSActorSource], size: PDSActorSize = .small, maxVisible: Int = 3, borderColor: Color = Colors.backgroundSurface) {
        self.sources = sources
        self.size = size
        self.maxVisible = maxVisible
        self.borderColor = borderColor
    }
    
    /// Creates a stack with URLs
    init(urls: [URL?], size: PDSActorSize = .small, maxVisible: Int = 3, borderColor: Color = Colors.backgroundSurface) {
        self.sources = urls.map { PDSActorSource.url($0) }
        self.size = size
        self.maxVisible = maxVisible
        self.borderColor = borderColor
    }
    
    /// Creates a stack with initials
    init(initials: [String], size: PDSActorSize = .small, maxVisible: Int = 3, borderColor: Color = Colors.backgroundSurface) {
        self.sources = initials.map { PDSActorSource.initials($0) }
        self.size = size
        self.maxVisible = maxVisible
        self.borderColor = borderColor
    }
    
    var body: some View {
        HStack(spacing: -overlapOffset) {
            ForEach(Array(visibleSources.enumerated()), id: \.offset) { index, source in
                PDSActor(source: source, size: size)
                    .overlay(
                        Circle()
                            .stroke(borderColor, lineWidth: 2)
                    )
                    .zIndex(Double(visibleSources.count - index))
            }
            
            if overflowCount > 0 {
                overflowBadge
                    .zIndex(0)
            }
        }
    }
    
    private var overflowBadge: some View {
        ZStack {
            Circle()
                .fill(Colors.actorPlaceholderBackground)
            
            Image(systemName: "person.fill")
                .font(.system(size: size.rawValue * 0.45))
                .foregroundColor(Colors.iconPlaceholder)
            
            Circle()
                .fill(Color.black.opacity(0.4))
            
            Image(systemName: "ellipsis")
                .font(.system(size: size.rawValue * 0.35, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: size.rawValue, height: size.rawValue)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(borderColor, lineWidth: 2)
        )
    }
}

// MARK: - Preview

#Preview("Actor Sizes") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            Text("Actor Sizes")
                .typography(Typography.headline2Emphasized)
                .foregroundColor(Colors.textPrimary)
            
            HStack(spacing: 16) {
                VStack {
                    PDSActor(size: .xsmall)
                    Text("24")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(size: .small)
                    Text("32")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(size: .medium)
                    Text("40")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(size: .large)
                    Text("56")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(size: .xlarge)
                    Text("80")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            Text("Source Types")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            HStack(spacing: 16) {
                VStack {
                    PDSActor(source: .placeholder, size: .large)
                    Text("Placeholder")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(source: .systemImage("star.fill"), size: .large)
                    Text("SF Symbol")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(source: .initials("JD"), size: .large)
                    Text("Initials")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(source: .url(nil, fallback: "AB"), size: .large)
                    Text("URL + Fallback")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            Text("Badge Types")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            HStack(spacing: 16) {
                VStack {
                    PDSActor(initials: "AB", size: .large, badge: .online)
                    Text("Online")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(initials: "CD", size: .large, badge: .offline)
                    Text("Offline")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(initials: "EF", size: .large, badge: .away)
                    Text("Away")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(initials: "GH", size: .large, badge: .count(5))
                    Text("Count")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                VStack {
                    PDSActor(initials: "IJ", size: .large, badge: .icon("checkmark"))
                    Text("Icon")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            Text("Actor Stack")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    PDSActorStack(
                        sources: [.initials("AB"), .initials("CD"), .initials("EF")],
                        size: .medium,
                        maxVisible: 3
                    )
                    Spacer()
                    Text("3 actors")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
                
                HStack {
                    PDSActorStack(
                        initials: ["AB", "CD", "EF", "GH", "IJ"],
                        size: .medium,
                        maxVisible: 3
                    )
                    Spacer()
                    Text("5 actors, max 3")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
            }
        }
        .padding(24)
    }
    .background(Colors.backgroundSurface)
}
