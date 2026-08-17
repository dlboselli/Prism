//
//  PDSProfileHeader.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A profile page header: avatar, name with verification, username,
//  bio, stat row, and optional primary/secondary actions.
//
//  Usage:
//  ```swift
//  PDSProfileHeader(profile: sampleProfiles[0], postCount: 48, onPrimaryAction: { })
//  ```
//

import SwiftUI

struct PDSProfileHeader: View {
    let name: String
    let username: String
    let initials: String?
    let image: String?
    let bio: String?
    let isVerified: Bool
    let stats: [(value: String, label: String)]
    let primaryActionTitle: String?
    let secondaryActionTitle: String?
    let onPrimaryAction: (() -> Void)?
    let onSecondaryAction: (() -> Void)?

    init(
        name: String,
        username: String,
        initials: String? = nil,
        image: String? = nil,
        bio: String? = nil,
        isVerified: Bool = false,
        stats: [(value: String, label: String)] = [],
        primaryActionTitle: String? = nil,
        secondaryActionTitle: String? = nil,
        onPrimaryAction: (() -> Void)? = nil,
        onSecondaryAction: (() -> Void)? = nil
    ) {
        self.name = name
        self.username = username
        self.initials = initials
        self.image = image
        self.bio = bio
        self.isVerified = isVerified
        self.stats = stats
        self.primaryActionTitle = primaryActionTitle
        self.secondaryActionTitle = secondaryActionTitle
        self.onPrimaryAction = onPrimaryAction
        self.onSecondaryAction = onSecondaryAction
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .center, spacing: 20) {
                avatar

                HStack(spacing: 0) {
                    ForEach(0..<stats.count, id: \.self) { index in
                        PDSStatTile(value: stats[index].value, label: stats[index].label)
                            .frame(maxWidth: .infinity)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    Text(name)
                        .typography(Typography.headline3Emphasized)
                        .foregroundColor(Colors.textPrimary)

                    if isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 14))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, Colors.fixedAccent)
                            .accessibilityLabel("Verified")
                    }
                }

                Text("@\(username)")
                    .typography(Typography.caption1)
                    .foregroundColor(Colors.textSecondary)

                if let bio = bio {
                    Text(bio)
                        .typography(Typography.body3)
                        .foregroundColor(Colors.textPrimary)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 6)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if primaryActionTitle != nil || secondaryActionTitle != nil {
                HStack(spacing: 8) {
                    if let primaryActionTitle = primaryActionTitle {
                        Button(primaryActionTitle) { onPrimaryAction?() }
                            .pdsButton(variant: .primary, size: .small, width: .fullWidth)
                    }

                    if let secondaryActionTitle = secondaryActionTitle {
                        Button(secondaryActionTitle) { onSecondaryAction?() }
                            .pdsButton(variant: .secondary, size: .small, width: .fullWidth)
                    }
                }
            }
        }
        .padding(16)
    }

    @ViewBuilder
    private var avatar: some View {
        if let image = image {
            PDSAvatar(image: image, size: .xLarge)
        } else {
            PDSAvatar(initials: initials ?? String(name.prefix(2)), size: .xLarge)
        }
    }
}

// MARK: - ProfileData Convenience

extension PDSProfileHeader {
    init(
        profile: ProfileData,
        postCount: Int = 0,
        primaryActionTitle: String? = "Follow",
        secondaryActionTitle: String? = "Message",
        onPrimaryAction: (() -> Void)? = nil,
        onSecondaryAction: (() -> Void)? = nil
    ) {
        self.init(
            name: profile.name,
            username: profile.username,
            initials: profile.name.split(separator: " ").prefix(2).compactMap(\.first).map(String.init).joined(),
            bio: profile.bio,
            isVerified: profile.isVerified,
            stats: [
                (value: "\(postCount)", label: "Posts"),
                (value: Self.abbreviated(profile.followerCount), label: "Followers"),
                (value: Self.abbreviated(profile.followingCount), label: "Following")
            ],
            primaryActionTitle: primaryActionTitle,
            secondaryActionTitle: secondaryActionTitle,
            onPrimaryAction: onPrimaryAction,
            onSecondaryAction: onSecondaryAction
        )
    }

    private static func abbreviated(_ count: Int) -> String {
        switch count {
        case 1_000_000...: return String(format: "%.1fM", Double(count) / 1_000_000)
        case 10_000...: return String(format: "%.1fK", Double(count) / 1_000)
        default: return "\(count)"
        }
    }
}

// MARK: - Preview

#Preview {
    VStack {
        PDSProfileHeader(profile: sampleProfiles[0], postCount: 48)
        Spacer()
    }
    .background(Colors.backgroundSurface)
}
