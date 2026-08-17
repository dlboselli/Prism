//
//  PDSPostCard.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A full feed post: composes PDSPostHeader, body text, PDSMedia,
//  and PDSReactionBar, with a like/comment/share action row.
//
//  Usage:
//  ```swift
//  PDSPostCard(post: samplePosts[0], onLike: { }, onComment: { }, onShare: { })
//  ```
//

import SwiftUI

struct PDSPostCard: View {
    let authorName: String
    let authorInitials: String?
    let isVerified: Bool
    let timestamp: String
    let content: String
    let mediaImage: String?
    let reactionSummary: PDSReactionSummary
    let commentCount: Int
    let shareCount: Int
    let isLiked: Bool
    let onAuthorTap: (() -> Void)?
    let onLike: (() -> Void)?
    let onComment: (() -> Void)?
    let onShare: (() -> Void)?

    init(
        authorName: String,
        authorInitials: String? = nil,
        isVerified: Bool = false,
        timestamp: String,
        content: String,
        mediaImage: String? = nil,
        reactionSummary: PDSReactionSummary = PDSReactionSummary(reactions: [:]),
        commentCount: Int = 0,
        shareCount: Int = 0,
        isLiked: Bool = false,
        onAuthorTap: (() -> Void)? = nil,
        onLike: (() -> Void)? = nil,
        onComment: (() -> Void)? = nil,
        onShare: (() -> Void)? = nil
    ) {
        self.authorName = authorName
        self.authorInitials = authorInitials
        self.isVerified = isVerified
        self.timestamp = timestamp
        self.content = content
        self.mediaImage = mediaImage
        self.reactionSummary = reactionSummary
        self.commentCount = commentCount
        self.shareCount = shareCount
        self.isLiked = isLiked
        self.onAuthorTap = onAuthorTap
        self.onLike = onLike
        self.onComment = onComment
        self.onShare = onShare
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PDSPostHeader(
                authorName: authorName,
                authorInitials: authorInitials,
                timestamp: timestamp,
                privacy: .friends,
                isVerified: isVerified,
                onAuthorTap: onAuthorTap
            )

            Text(content)
                .typography(Typography.body3)
                .foregroundColor(Colors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 16)
                .padding(.bottom, 12)

            if let mediaImage = mediaImage {
                PDSMedia(ratio: .ratio3x2, cornerRadius: CornerRadius.square) {
                    Image(mediaImage)
                        .resizable()
                }
            }

            PDSReactionBar(
                summary: reactionSummary,
                commentCount: commentCount,
                shareCount: shareCount,
                userReaction: isLiked ? .like : nil
            )

            Divider()
                .overlay(Colors.backgroundDivider)
                .padding(.horizontal, 16)

            actionRow
        }
        .background(Colors.backgroundCard)
        .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
        .shadow(Shadows.uiEmphasis)
    }

    // MARK: - Action Row

    private var actionRow: some View {
        HStack(spacing: 0) {
            actionButton(
                icon: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup",
                title: "Like",
                tint: isLiked ? Colors.fixedAccent : Colors.iconSecondary,
                action: onLike
            )
            actionButton(icon: "bubble.left", title: "Comment", tint: Colors.iconSecondary, action: onComment)
            actionButton(icon: "arrowshape.turn.up.right", title: "Share", tint: Colors.iconSecondary, action: onShare)
        }
        .padding(.vertical, 4)
    }

    private func actionButton(icon: String, title: String, tint: Color, action: (() -> Void)?) -> some View {
        Button(action: { action?() }) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .medium))

                Text(title)
                    .typography(Typography.button3)
            }
            .foregroundColor(tint)
            .frame(maxWidth: .infinity, minHeight: 40)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
    }
}

// MARK: - PostData Convenience

extension PDSPostCard {
    init(
        post: PostData,
        onAuthorTap: (() -> Void)? = nil,
        onLike: (() -> Void)? = nil,
        onComment: (() -> Void)? = nil,
        onShare: (() -> Void)? = nil
    ) {
        self.init(
            authorName: post.author.name,
            authorInitials: Self.initials(for: post.author.name),
            isVerified: post.author.isVerified,
            timestamp: relativeTimeString(from: post.timestamp),
            content: post.content,
            mediaImage: post.mediaImages.first,
            reactionSummary: Self.summary(from: post.reactions),
            commentCount: post.commentCount,
            shareCount: post.shareCount,
            isLiked: post.isLiked,
            onAuthorTap: onAuthorTap,
            onLike: onLike,
            onComment: onComment,
            onShare: onShare
        )
    }

    private static func initials(for name: String) -> String {
        name.split(separator: " ").prefix(2).compactMap(\.first).map(String.init).joined()
    }

    /// Maps emoji reaction data onto the reaction bar's typed summary
    private static func summary(from reactions: [ReactionData]) -> PDSReactionSummary {
        var counts: [PDSReactionType: Int] = [:]
        for reaction in reactions {
            let type: PDSReactionType
            switch reaction.emoji {
            case "👍", "💪", "🙏": type = .like
            case "❤️", "😍", "🥰": type = .love
            case "😆", "😂", "🤣": type = .haha
            case "😮", "🤯", "💡": type = .wow
            case "😢", "😭": type = .sad
            case "😡", "🤬": type = .angry
            default: type = .care
            }
            counts[type, default: 0] += reaction.count
        }
        return PDSReactionSummary(reactions: counts)
    }
}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: 12) {
            PDSPostCard(post: samplePosts[0])
            PDSPostCard(post: samplePosts[2])
        }
        .padding(.vertical, 12)
    }
    .background(Colors.backgroundCanvas)
}
