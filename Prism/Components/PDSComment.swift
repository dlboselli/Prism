//
//  PDSComment.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Comment components for displaying user comments with author info,
//  text content, timestamps, likes, and reply functionality.
//  Supports threaded comments with PDSCommentThread.
//
//  Usage:
//  ```swift
//  // Single comment
//  PDSComment(
//      authorName: "John Doe",
//      authorInitials: "JD",
//      text: "Great post!",
//      timestamp: "2h ago",
//      likeCount: 5,
//      onLike: { },
//      onReply: { }
//  )
//
//  // Threaded comments
//  PDSCommentThread(
//      comments: comments,
//      onLike: { comment in },
//      onReply: { comment in }
//  )
//  ```
//

import SwiftUI

// MARK: - PDSComment

/// A comment component displaying author avatar, name, text, and metadata
struct PDSComment: View {
    let authorName: String
    let authorURL: URL?
    let authorInitials: String?
    let text: String
    let image: Image?
    let timestamp: String
    let isVerified: Bool
    let likeCount: Int
    let isLiked: Bool
    let onLike: (() -> Void)?
    let onReply: (() -> Void)?
    let onAuthorTap: (() -> Void)?
    
    init(
        authorName: String,
        authorURL: URL? = nil,
        authorInitials: String? = nil,
        text: String,
        image: Image? = nil,
        timestamp: String,
        isVerified: Bool = false,
        likeCount: Int = 0,
        isLiked: Bool = false,
        onLike: (() -> Void)? = nil,
        onReply: (() -> Void)? = nil,
        onAuthorTap: (() -> Void)? = nil
    ) {
        self.authorName = authorName
        self.authorURL = authorURL
        self.authorInitials = authorInitials
        self.text = text
        self.image = image
        self.timestamp = timestamp
        self.isVerified = isVerified
        self.likeCount = likeCount
        self.isLiked = isLiked
        self.onLike = onLike
        self.onReply = onReply
        self.onAuthorTap = onAuthorTap
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Author avatar
            Button(action: { onAuthorTap?() }) {
                PDSActor(
                    url: authorURL,
                    fallbackInitials: authorInitials ?? String(authorName.prefix(2)),
                    size: .small
                )
            }
            .buttonStyle(.plain)
            
            VStack(alignment: .leading, spacing: PDSTextScale.compact.lineSpacing) {
                // Author name and verified badge
                HStack(spacing: 4) {
                    Button(action: { onAuthorTap?() }) {
                        Text(authorName)
                            .typography(Typography.body4Link)
                            .foregroundColor(Colors.textPrimary)
                    }
                    .buttonStyle(.plain)
                    
                    if isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 12))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, Colors.persistentAccent)
                    }
                    
                    Text("·")
                        .foregroundColor(Colors.textSecondary)
                    
                    Text(timestamp)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textSecondary)
                }
                
                // Comment text
                if !text.isEmpty {
                    Text(text)
                        .typography(Typography.body4)
                        .foregroundColor(Colors.textPrimary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                // Image attachment
                if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.top, 4)
                }
                
                // Actions
                HStack(spacing: 16) {
                    // Like button
                    Button(action: { onLike?() }) {
                        HStack(spacing: 4) {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .font(.system(size: 14))
                                .foregroundColor(isLiked ? Colors.persistentNegative : Colors.iconSecondary)
                            
                            if likeCount > 0 {
                                Text("\(likeCount)")
                                    .typography(Typography.meta4)
                                    .foregroundColor(Colors.textSecondary)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    
                    // Reply button
                    Button(action: { onReply?() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "arrowshape.turn.up.left")
                                .font(.system(size: 14))
                                .foregroundColor(Colors.iconSecondary)
                            
                            Text("Reply")
                                .typography(Typography.meta4)
                                .foregroundColor(Colors.textSecondary)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                }
                .padding(.top, 4)
            }
        }
        .pdsTextPadding(.compact)
    }
}

// MARK: - PDSCommentThread

/// A threaded comment with replies
struct PDSCommentThread: View {
    let comment: PDSComment
    let replies: [PDSComment]
    let showReplies: Bool
    let onToggleReplies: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            comment
            
            if !replies.isEmpty {
                Button(action: { onToggleReplies?() }) {
                    Text(showReplies ? "Hide replies" : "View \(replies.count) \(replies.count == 1 ? "reply" : "replies")")
                        .typography(Typography.meta4Link)
                        .foregroundColor(Colors.textBlueLink)
                }
                .buttonStyle(.plain)
                .padding(.leading, 44)
                
                if showReplies {
                    VStack(spacing: 0) {
                        ForEach(0..<replies.count, id: \.self) { index in
                            replies[index]
                                .padding(.leading, 44)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Preview

#Preview("PDSComment") {
    ScrollView {
        VStack(spacing: 0) {
            PDSComment(
                authorName: "John Doe",
                authorInitials: "JD",
                text: "This is a great post! Love the design.",
                timestamp: "2h",
                likeCount: 12,
                isLiked: true
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSComment(
                authorName: "Jane Smith",
                authorInitials: "JS",
                text: "Totally agree with this. The attention to detail is impressive.",
                timestamp: "1h",
                isVerified: true,
                likeCount: 5
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSComment(
                authorName: "David Kim",
                authorInitials: "DK",
                text: "Check out this view from my hike today!",
                image: Image("Posts/SampleMedia"),
                timestamp: "45m",
                likeCount: 24,
                isLiked: true
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSComment(
                authorName: "Alex Chen",
                authorInitials: "AC",
                text: "I have a question about the implementation. How did you handle the edge cases for the animation timing?",
                timestamp: "30m"
            )
        }
        .padding()
    }
    .background(Colors.backgroundSurface)
}

