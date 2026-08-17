//
//  PDSPostHeader.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Post header components for displaying author info, timestamps,
//  privacy settings, verification badges, and action menus.
//  Supports standard and compact variants.
//
//  Usage:
//  ```swift
//  // Standard header
//  PDSPostHeader(
//      authorName: "John Doe",
//      authorInitials: "JD",
//      subtitle: "San Francisco, CA",
//      timestamp: "2h ago",
//      privacy: .friends,
//      isVerified: true,
//      onAuthorTap: { },
//      onMoreTap: { }
//  )
//
//  // Compact header
//  PDSPostHeaderCompact(
//      authorName: "Jane Smith",
//      timestamp: "1d ago"
//  )
//  ```
//

import SwiftUI

// MARK: - Post Header Privacy

enum PDSPostPrivacy {
    case `public`
    case friends
    case friendsExcept
    case specificFriends
    case onlyMe
    case custom
    
    var icon: String {
        switch self {
        case .public: return "globe"
        case .friends: return "person.2.fill"
        case .friendsExcept: return "person.2.fill"
        case .specificFriends: return "person.fill"
        case .onlyMe: return "lock.fill"
        case .custom: return "gearshape.fill"
        }
    }
}

// MARK: - PDSPostHeader

/// A post header component displaying author avatar, name, timestamp, privacy, and actions
struct PDSPostHeader: View {
    let authorName: String
    let authorURL: URL?
    let authorInitials: String?
    let subtitle: String?
    let timestamp: String
    let privacy: PDSPostPrivacy?
    let isVerified: Bool
    let isSponsored: Bool
    let onAuthorTap: (() -> Void)?
    let onMoreTap: (() -> Void)?
    let onCloseTap: (() -> Void)?
    
    init(
        authorName: String,
        authorURL: URL? = nil,
        authorInitials: String? = nil,
        subtitle: String? = nil,
        timestamp: String,
        privacy: PDSPostPrivacy? = nil,
        isVerified: Bool = false,
        isSponsored: Bool = false,
        onAuthorTap: (() -> Void)? = nil,
        onMoreTap: (() -> Void)? = nil,
        onCloseTap: (() -> Void)? = nil
    ) {
        self.authorName = authorName
        self.authorURL = authorURL
        self.authorInitials = authorInitials
        self.subtitle = subtitle
        self.timestamp = timestamp
        self.privacy = privacy
        self.isVerified = isVerified
        self.isSponsored = isSponsored
        self.onAuthorTap = onAuthorTap
        self.onMoreTap = onMoreTap
        self.onCloseTap = onCloseTap
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // Author avatar
            Button(action: { onAuthorTap?() }) {
                PDSAvatar(
                    url: authorURL,
                    fallbackInitials: authorInitials ?? String(authorName.prefix(2)),
                    size: .medium
                )
            }
            .buttonStyle(.plain)
            
            // Author info
            VStack(alignment: .leading, spacing: 0) {
                // Name and verified badge
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Button(action: { onAuthorTap?() }) {
                        Text(authorName)
                            .typography(Typography.headline4)
                            .foregroundColor(Colors.textPrimary)
                    }
                    .buttonStyle(.plain)
                    
                    if isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 14))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, Colors.fixedAccent)
                    }
                }
                
                // Subtitle (e.g., "is with John Doe at Location")
                if let subtitle = subtitle {
                    Text(subtitle)
                        .typography(Typography.caption2)
                        .foregroundColor(Colors.textSecondary)
                        .lineLimit(1)
                }
                
                // Timestamp, privacy, and sponsored
                HStack(spacing: 4) {
                    Text(timestamp)
                        .typography(Typography.caption2)
                        .foregroundColor(Colors.textSecondary)
                    
                    if let privacy = privacy {
                        Text("·")
                            .foregroundColor(Colors.textSecondary)
                        
                        Image(systemName: privacy.icon)
                            .font(.system(size: 10))
                            .foregroundColor(Colors.iconSecondary)
                    }
                    
                    if isSponsored {
                        Text("·")
                            .foregroundColor(Colors.textSecondary)
                        
                        Text("Sponsored")
                            .typography(Typography.caption2)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
            
            Spacer()
            
            // Action buttons
            HStack(spacing: 4) {
                if onMoreTap != nil {
                    Button(action: { onMoreTap?() }) {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 18))
                            .foregroundColor(Colors.iconSecondary)
                            .frame(width: 36, height: 36)
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("More options")
                }

                if onCloseTap != nil {
                    Button(action: { onCloseTap?() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Colors.iconSecondary)
                            .frame(width: 36, height: 36)
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Hide post")
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

// MARK: - PDSPostHeaderCompact

/// A compact post header for feeds with limited space
struct PDSPostHeaderCompact: View {
    let authorName: String
    let authorURL: URL?
    let authorInitials: String?
    let timestamp: String
    let isVerified: Bool
    let onAuthorTap: (() -> Void)?
    
    init(
        authorName: String,
        authorURL: URL? = nil,
        authorInitials: String? = nil,
        timestamp: String,
        isVerified: Bool = false,
        onAuthorTap: (() -> Void)? = nil
    ) {
        self.authorName = authorName
        self.authorURL = authorURL
        self.authorInitials = authorInitials
        self.timestamp = timestamp
        self.isVerified = isVerified
        self.onAuthorTap = onAuthorTap
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Button(action: { onAuthorTap?() }) {
                PDSAvatar(
                    url: authorURL,
                    fallbackInitials: authorInitials ?? String(authorName.prefix(2)),
                    size: .small
                )
            }
            .buttonStyle(.plain)
            
            HStack(spacing: 4) {
                Button(action: { onAuthorTap?() }) {
                    Text(authorName)
                        .typography(Typography.button3)
                        .foregroundColor(Colors.textPrimary)
                }
                .buttonStyle(.plain)
                
                if isVerified {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 12))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, Colors.fixedAccent)
                }
                
                Text("·")
                    .foregroundColor(Colors.textSecondary)
                
                Text(timestamp)
                    .typography(Typography.caption2)
                    .foregroundColor(Colors.textSecondary)
            }
        }
    }
}

// MARK: - Preview

#Preview("PDSPostHeader") {
    VStack(spacing: 0) {
        PDSPostHeader(
            authorName: "John Doe",
            authorInitials: "JD",
            timestamp: "2h",
            privacy: .public,
            onMoreTap: {}
        )
        
        Rectangle()
            .fill(Colors.backgroundDivider)
            .frame(height: 1)
        
        PDSPostHeader(
            authorName: "Jane Smith",
            authorInitials: "JS",
            subtitle: "is at San Francisco, CA",
            timestamp: "5h",
            privacy: .friends,
            isVerified: true,
            onMoreTap: {},
            onCloseTap: {}
        )
        
        Rectangle()
            .fill(Colors.backgroundDivider)
            .frame(height: 1)
        
        PDSPostHeader(
            authorName: "Prism Tech",
            authorInitials: "PT",
            timestamp: "Sponsored",
            isVerified: true,
            isSponsored: true,
            onMoreTap: {},
            onCloseTap: {}
        )
        
        Rectangle()
            .fill(Colors.backgroundDivider)
            .frame(height: 1)
        
        // Compact variant
        VStack(alignment: .leading, spacing: 12) {
            Text("Compact Variant")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
                .padding(.horizontal, 16)
            
            PDSPostHeaderCompact(
                authorName: "John Doe",
                authorInitials: "JD",
                timestamp: "2h",
                isVerified: true
            )
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 12)
    }
    .background(Colors.backgroundSurface)
}

