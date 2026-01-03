//
//  PDSReactionBar.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Reaction components for displaying and selecting post reactions,
//  including reaction summaries, emoji pickers, action buttons,
//  and reactor avatar stacks.
//
//  Usage:
//  ```swift
//  // Reaction summary bar
//  PDSReactionBar(
//      reactions: [(.like, 12), (.love, 5)],
//      commentCount: 8,
//      shareCount: 3,
//      onReactionsTap: { },
//      onCommentsTap: { }
//  )
//
//  // Emoji picker
//  PDSReactionPicker(
//      onSelect: { reaction in },
//      onCustomEmoji: { emoji in }
//  )
//
//  // Post actions (like, comment, share)
//  PDSPostActions(
//      isLiked: false,
//      onLike: { },
//      onComment: { },
//      onShare: { }
//  )
//  ```
//

import SwiftUI

// MARK: - Reaction Type

enum PDSReactionType: String, CaseIterable {
    case like = "👍"
    case love = "❤️"
    case haha = "😂"
    case wow = "😮"
    case sad = "😢"
    case angry = "😡"
    case care = "🥰"
    
    var icon: String {
        return self.rawValue
    }
    
    var name: String {
        switch self {
        case .like: return "Like"
        case .love: return "Love"
        case .haha: return "Haha"
        case .wow: return "Wow"
        case .sad: return "Sad"
        case .angry: return "Angry"
        case .care: return "Care"
        }
    }
}

// MARK: - Reaction Summary

struct PDSReactionSummary {
    let reactions: [PDSReactionType: Int]
    let totalCount: Int
    let topReactors: [PDSReactorInfo]
    
    init(reactions: [PDSReactionType: Int], topReactors: [PDSReactorInfo] = []) {
        self.reactions = reactions
        self.totalCount = reactions.values.reduce(0, +)
        self.topReactors = topReactors
    }
    
    var sortedReactions: [(type: PDSReactionType, count: Int)] {
        reactions
            .filter { $0.value > 0 }
            .sorted { $0.value > $1.value }
            .map { (type: $0.key, count: $0.value) }
    }
    
    var topThreeReactions: [PDSReactionType] {
        Array(sortedReactions.prefix(3).map { $0.type })
    }
}

struct PDSReactorInfo {
    let name: String
    let url: URL?
    let initials: String?
}

// MARK: - PDSReactionBar

/// A reaction bar showing reaction icons, count, and who reacted
struct PDSReactionBar: View {
    let summary: PDSReactionSummary
    let commentCount: Int
    let shareCount: Int
    let userReaction: PDSReactionType?
    let onReactionsTap: (() -> Void)?
    let onCommentsTap: (() -> Void)?
    let onSharesTap: (() -> Void)?
    
    init(
        summary: PDSReactionSummary,
        commentCount: Int = 0,
        shareCount: Int = 0,
        userReaction: PDSReactionType? = nil,
        onReactionsTap: (() -> Void)? = nil,
        onCommentsTap: (() -> Void)? = nil,
        onSharesTap: (() -> Void)? = nil
    ) {
        self.summary = summary
        self.commentCount = commentCount
        self.shareCount = shareCount
        self.userReaction = userReaction
        self.onReactionsTap = onReactionsTap
        self.onCommentsTap = onCommentsTap
        self.onSharesTap = onSharesTap
    }
    
    var body: some View {
        HStack {
            // Reactions summary (left side)
            if summary.totalCount > 0 {
                Button(action: { onReactionsTap?() }) {
                    HStack(spacing: 4) {
                        // Reaction icons
                        reactionIcons
                        
                        // Count or names
                        reactionLabel
                    }
                }
                .buttonStyle(.plain)
            }
            
            Spacer()
            
            // Comments and shares (right side)
            HStack(spacing: 16) {
                if commentCount > 0 {
                    Button(action: { onCommentsTap?() }) {
                        Text("\(commentCount) \(commentCount == 1 ? "comment" : "comments")")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                    }
                    .buttonStyle(.plain)
                }
                
                if shareCount > 0 {
                    Button(action: { onSharesTap?() }) {
                        Text("\(shareCount) \(shareCount == 1 ? "share" : "shares")")
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
    
    private var reactionIcons: some View {
        HStack(spacing: 2) {
            ForEach(summary.topThreeReactions, id: \.self) { reaction in
                Text(reaction.icon)
                    .font(.system(size: 16))
            }
        }
    }
    
    @ViewBuilder
    private var reactionLabel: some View {
        if !summary.topReactors.isEmpty {
            // Show names
            let names = summary.topReactors.prefix(2).map { $0.name }
            let remaining = summary.totalCount - names.count
            
            if remaining > 0 {
                Text("\(names.joined(separator: ", ")) and \(remaining) \(remaining == 1 ? "other" : "others")")
                    .typography(Typography.meta3)
                    .foregroundColor(Colors.textSecondary)
            } else {
                Text(names.joined(separator: " and "))
                    .typography(Typography.meta3)
                    .foregroundColor(Colors.textSecondary)
            }
        } else {
            // Just show count
            Text("\(summary.totalCount)")
                .typography(Typography.meta3)
                .foregroundColor(Colors.textSecondary)
        }
    }
}

// MARK: - PDSReactionActors

/// Shows who reacted with their avatars
struct PDSReactionActors: View {
    let reactors: [PDSReactorInfo]
    let totalCount: Int
    let maxVisible: Int
    let borderColor: Color
    let onTap: (() -> Void)?
    
    init(
        reactors: [PDSReactorInfo],
        totalCount: Int,
        maxVisible: Int = 3,
        borderColor: Color = Colors.backgroundSurface,
        onTap: (() -> Void)? = nil
    ) {
        self.reactors = reactors
        self.totalCount = totalCount
        self.maxVisible = maxVisible
        self.borderColor = borderColor
        self.onTap = onTap
    }
    
    var body: some View {
        Button(action: { onTap?() }) {
            HStack(spacing: 4) {
                PDSActorStack(
                    urls: reactors.prefix(maxVisible).map { $0.url },
                    size: .xsmall,
                    maxVisible: maxVisible,
                    borderColor: borderColor
                )
                
                if totalCount > maxVisible {
                    Text("+\(totalCount - maxVisible)")
                        .typography(Typography.meta3)
                        .foregroundColor(Colors.textSecondary)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Emoji Keyboard TextField

/// UITextField that opens emoji keyboard by default
struct EmojiTextField: UIViewRepresentable {
    @Binding var text: String
    var onEmojiSelected: (String) -> Void
    
    func makeUIView(context: Context) -> EmojiUITextField {
        let textField = EmojiUITextField()
        textField.delegate = context.coordinator
        textField.tintColor = .clear
        textField.textColor = .clear
        textField.backgroundColor = .clear
        return textField
    }
    
    func updateUIView(_ uiView: EmojiUITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: EmojiTextField
        
        init(_ parent: EmojiTextField) {
            self.parent = parent
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if !string.isEmpty {
                // Check if it's an emoji
                if string.unicodeScalars.first?.properties.isEmoji == true {
                    parent.onEmojiSelected(string)
                    textField.text = ""
                    textField.resignFirstResponder()
                    return false
                }
            }
            return true
        }
    }
}

/// Custom UITextField that prefers emoji keyboard
class EmojiUITextField: UITextField {
    override var textInputMode: UITextInputMode? {
        // Try to find and return the emoji input mode
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return super.textInputMode
    }
    
    override var textInputContextIdentifier: String? {
        return "" // Return non-nil to enable keyboard switching
    }
}

// MARK: - PDSReactionPicker

/// Floating reaction picker for long-press selection
struct PDSReactionPicker: View {
    let onSelect: (PDSReactionType) -> Void
    let onCustomEmoji: ((String) -> Void)?
    @State private var hoveredReaction: PDSReactionType?
    @State private var isMoreHovered = false
    @State private var emojiText = ""
    @State private var showEmojiField = false
    
    init(onSelect: @escaping (PDSReactionType) -> Void, onCustomEmoji: ((String) -> Void)? = nil) {
        self.onSelect = onSelect
        self.onCustomEmoji = onCustomEmoji
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(PDSReactionType.allCases, id: \.self) { reaction in
                Button(action: { onSelect(reaction) }) {
                    Text(reaction.icon)
                        .font(.system(size: hoveredReaction == reaction ? 40 : 28))
                        .scaleEffect(hoveredReaction == reaction ? 1.2 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: hoveredReaction)
                }
                .buttonStyle(.plain)
                .onHover { isHovered in
                    hoveredReaction = isHovered ? reaction : nil
                }
            }
            
            // More emoji button
            if onCustomEmoji != nil {
                ZStack {
                    // Hidden emoji text field
                    EmojiTextField(text: $emojiText) { emoji in
                        onCustomEmoji?(emoji)
                        showEmojiField = false
                    }
                    .frame(width: 1, height: 1)
                    .opacity(0.01)
                    .id(showEmojiField) // Force recreation to trigger keyboard
                    
                    Button(action: {
                        showEmojiField = true
                        // Trigger the emoji keyboard after a brief delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                        }
                    }) {
                        Circle()
                            .fill(Colors.backgroundDeemphasized)
                            .frame(width: isMoreHovered ? 36 : 28, height: isMoreHovered ? 36 : 28)
                            .overlay(
                                Image(systemName: "plus")
                                    .font(.system(size: isMoreHovered ? 18 : 14, weight: .medium))
                                    .foregroundColor(Colors.iconSecondary)
                            )
                            .scaleEffect(isMoreHovered ? 1.2 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isMoreHovered)
                    }
                    .buttonStyle(.plain)
                    .onHover { isHovered in
                        isMoreHovered = isHovered
                    }
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(Colors.backgroundCard)
                .shadow(color: Colors.elevationCardShadowMedium, radius: 12, x: 0, y: 4)
        )
    }
}

// MARK: - PDSPostActions

/// Standard post action buttons (Like, Comment, Share)
struct PDSPostActions: View {
    let userReaction: PDSReactionType?
    let onLike: () -> Void
    let onComment: () -> Void
    let onShare: () -> Void
    let onLongPressLike: (() -> Void)?
    
    init(
        userReaction: PDSReactionType? = nil,
        onLike: @escaping () -> Void,
        onComment: @escaping () -> Void,
        onShare: @escaping () -> Void,
        onLongPressLike: (() -> Void)? = nil
    ) {
        self.userReaction = userReaction
        self.onLike = onLike
        self.onComment = onComment
        self.onShare = onShare
        self.onLongPressLike = onLongPressLike
    }
    
    var body: some View {
        HStack(spacing: 0) {
            // Like button
            actionButton(
                icon: userReaction != nil ? userReaction!.icon : "👍",
                label: userReaction?.name ?? "Like",
                isActive: userReaction != nil,
                action: onLike
            )
            .onLongPressGesture {
                onLongPressLike?()
            }
            
            // Comment button
            actionButton(
                systemIcon: "bubble.left",
                label: "Comment",
                action: onComment
            )
            
            // Share button
            actionButton(
                systemIcon: "arrowshape.turn.up.forward",
                label: "Share",
                action: onShare
            )
        }
        .padding(.horizontal, 16)
    }
    
    private func actionButton(
        icon: String? = nil,
        systemIcon: String? = nil,
        label: String,
        isActive: Bool = false,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if let icon = icon {
                    Text(icon)
                        .font(.system(size: 18))
                } else if let systemIcon = systemIcon {
                    Image(systemName: systemIcon)
                        .font(.system(size: 18))
                        .foregroundColor(Colors.iconSecondary)
                }
                
                Text(label)
                    .typography(Typography.button3)
                    .foregroundColor(isActive ? Colors.textBlueLink : Colors.textSecondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview

#Preview("PDSReactionBar") {
    VStack(spacing: 24) {
        // Reaction bar with counts
        VStack(alignment: .leading, spacing: 8) {
            Text("Reaction Bar")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
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
        }
        
        // Reaction bar with names
        VStack(alignment: .leading, spacing: 8) {
            Text("With Reactor Names")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
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
        
        // Post actions
        VStack(alignment: .leading, spacing: 8) {
            Text("Post Actions")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSPostActions(
                onLike: {},
                onComment: {},
                onShare: {}
            )
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            PDSPostActions(
                userReaction: .love,
                onLike: {},
                onComment: {},
                onShare: {}
            )
        }
        
        // Reaction picker
        VStack(alignment: .leading, spacing: 8) {
            Text("Reaction Picker")
                .typography(PDSTextScale.content.headline)
                .foregroundColor(Colors.textPrimary)
            
            PDSReactionPicker { reaction in
                print("Selected: \(reaction.name)")
            }
        }
    }
    .padding()
    .background(Colors.backgroundSurface)
}

