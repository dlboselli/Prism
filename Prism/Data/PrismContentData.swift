//
//  PrismContentData.swift
//  Prism
//
//  Sample data for the Prism prototype
//

import Foundation

// MARK: - Data Models

/// General-purpose content data
struct PrismData: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String?
    let description: String?
    let imageURL: String?
    let timestamp: Date
    let metadata: [String: String]
    
    init(
        id: String = UUID().uuidString,
        title: String,
        subtitle: String? = nil,
        description: String? = nil,
        imageURL: String? = nil,
        timestamp: Date = Date(),
        metadata: [String: String] = [:]
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.imageURL = imageURL
        self.timestamp = timestamp
        self.metadata = metadata
    }
}

/// Profile data for users
struct ProfileData: Identifiable, Hashable {
    let id: String
    let name: String
    let username: String
    let avatarImage: String?
    let bio: String?
    let isOnline: Bool
    let isVerified: Bool
    let followerCount: Int
    let followingCount: Int
    
    init(
        id: String = UUID().uuidString,
        name: String,
        username: String,
        avatarImage: String? = nil,
        bio: String? = nil,
        isOnline: Bool = false,
        isVerified: Bool = false,
        followerCount: Int = 0,
        followingCount: Int = 0
    ) {
        self.id = id
        self.name = name
        self.username = username
        self.avatarImage = avatarImage
        self.bio = bio
        self.isOnline = isOnline
        self.isVerified = isVerified
        self.followerCount = followerCount
        self.followingCount = followingCount
    }
}

/// Post/content data
struct PostData: Identifiable, Hashable {
    let id: String
    let author: ProfileData
    let content: String
    let mediaImages: [String]
    let timestamp: Date
    let reactions: [ReactionData]
    let commentCount: Int
    let shareCount: Int
    let isLiked: Bool
    let isSaved: Bool
    
    init(
        id: String = UUID().uuidString,
        author: ProfileData,
        content: String,
        mediaImages: [String] = [],
        timestamp: Date = Date(),
        reactions: [ReactionData] = [],
        commentCount: Int = 0,
        shareCount: Int = 0,
        isLiked: Bool = false,
        isSaved: Bool = false
    ) {
        self.id = id
        self.author = author
        self.content = content
        self.mediaImages = mediaImages
        self.timestamp = timestamp
        self.reactions = reactions
        self.commentCount = commentCount
        self.shareCount = shareCount
        self.isLiked = isLiked
        self.isSaved = isSaved
    }
}

/// Reaction data
struct ReactionData: Identifiable, Hashable {
    let id: String
    let emoji: String
    let count: Int
    let isSelected: Bool
    
    init(
        id: String = UUID().uuidString,
        emoji: String,
        count: Int,
        isSelected: Bool = false
    ) {
        self.id = id
        self.emoji = emoji
        self.count = count
        self.isSelected = isSelected
    }
}

/// Comment data
struct CommentData: Identifiable, Hashable {
    let id: String
    let author: ProfileData
    let content: String
    let timestamp: Date
    let likeCount: Int
    let isLiked: Bool
    let replies: [CommentData]
    
    init(
        id: String = UUID().uuidString,
        author: ProfileData,
        content: String,
        timestamp: Date = Date(),
        likeCount: Int = 0,
        isLiked: Bool = false,
        replies: [CommentData] = []
    ) {
        self.id = id
        self.author = author
        self.content = content
        self.timestamp = timestamp
        self.likeCount = likeCount
        self.isLiked = isLiked
        self.replies = replies
    }
}

/// Notification data
struct NotificationData: Identifiable, Hashable {
    let id: String
    let type: NotificationType
    let actor: ProfileData
    let message: String
    let timestamp: Date
    let isRead: Bool
    let actionURL: String?
    
    init(
        id: String = UUID().uuidString,
        type: NotificationType,
        actor: ProfileData,
        message: String,
        timestamp: Date = Date(),
        isRead: Bool = false,
        actionURL: String? = nil
    ) {
        self.id = id
        self.type = type
        self.actor = actor
        self.message = message
        self.timestamp = timestamp
        self.isRead = isRead
        self.actionURL = actionURL
    }
}

enum NotificationType: String, Hashable {
    case like
    case comment
    case follow
    case mention
    case share
    case friendRequest
    case groupInvite
    case birthday
    case memory
}

/// Story data
struct StoryData: Identifiable, Hashable {
    let id: String
    let author: ProfileData
    let mediaImage: String
    let timestamp: Date
    let isViewed: Bool
    let viewerCount: Int
    
    init(
        id: String = UUID().uuidString,
        author: ProfileData,
        mediaImage: String,
        timestamp: Date = Date(),
        isViewed: Bool = false,
        viewerCount: Int = 0
    ) {
        self.id = id
        self.author = author
        self.mediaImage = mediaImage
        self.timestamp = timestamp
        self.isViewed = isViewed
        self.viewerCount = viewerCount
    }
}

// MARK: - Sample Profiles

let sampleProfiles: [ProfileData] = [
    ProfileData(
        id: "user-1",
        name: "Sarah Chen",
        username: "sarahchen",
        avatarImage: "Profiles/sarah",
        bio: "Product designer at Prism. Coffee enthusiast ☕️",
        isOnline: true,
        isVerified: true,
        followerCount: 12500,
        followingCount: 892
    ),
    ProfileData(
        id: "user-2",
        name: "Marcus Johnson",
        username: "marcusj",
        avatarImage: "Profiles/marcus",
        bio: "Photographer | Traveler | Storyteller",
        isOnline: false,
        isVerified: false,
        followerCount: 8340,
        followingCount: 1205
    ),
    ProfileData(
        id: "user-3",
        name: "Emily Rodriguez",
        username: "emilyrod",
        avatarImage: "Profiles/emily",
        bio: "Software engineer building the future 🚀",
        isOnline: true,
        isVerified: true,
        followerCount: 25000,
        followingCount: 456
    ),
    ProfileData(
        id: "user-4",
        name: "David Park",
        username: "davidp",
        avatarImage: "Profiles/david",
        bio: "Music producer | Night owl 🌙",
        isOnline: false,
        isVerified: false,
        followerCount: 5600,
        followingCount: 890
    ),
    ProfileData(
        id: "user-5",
        name: "Aisha Patel",
        username: "aishap",
        avatarImage: "Profiles/aisha",
        bio: "UX researcher exploring human behavior",
        isOnline: true,
        isVerified: false,
        followerCount: 3200,
        followingCount: 678
    ),
    ProfileData(
        id: "user-6",
        name: "James Wilson",
        username: "jameswilson",
        avatarImage: "Profiles/james",
        bio: "Fitness coach | Healthy living advocate 💪",
        isOnline: false,
        isVerified: true,
        followerCount: 45000,
        followingCount: 234
    )
]

// MARK: - Sample Posts

let samplePosts: [PostData] = [
    PostData(
        id: "post-1",
        author: sampleProfiles[0],
        content: "Just finished a morning walk on the beach. Nothing beats watching the sunrise! 🌅",
        mediaImages: ["Posts/walking-sunrise-beach"],
        timestamp: Date().addingTimeInterval(-3600), // 1 hour ago
        reactions: [
            ReactionData(emoji: "👍", count: 42, isSelected: true),
            ReactionData(emoji: "❤️", count: 28),
            ReactionData(emoji: "😍", count: 15)
        ],
        commentCount: 12,
        shareCount: 3,
        isLiked: true
    ),
    PostData(
        id: "post-2",
        author: sampleProfiles[1],
        content: "City lights never get old. Shot this last night with my new lens. What do you think?",
        mediaImages: ["Posts/night-city-longexposure"],
        timestamp: Date().addingTimeInterval(-7200), // 2 hours ago
        reactions: [
            ReactionData(emoji: "😮", count: 156),
            ReactionData(emoji: "❤️", count: 89),
            ReactionData(emoji: "🔥", count: 45)
        ],
        commentCount: 34,
        shareCount: 12
    ),
    PostData(
        id: "post-3",
        author: sampleProfiles[2],
        content: "Shipped a major feature today! So proud of our team for making this happen. 🎉 Sometimes the best code is the code you don't have to write.",
        timestamp: Date().addingTimeInterval(-14400), // 4 hours ago
        reactions: [
            ReactionData(emoji: "🎉", count: 234),
            ReactionData(emoji: "👏", count: 189),
            ReactionData(emoji: "💪", count: 67)
        ],
        commentCount: 45,
        shareCount: 8,
        isLiked: true
    ),
    PostData(
        id: "post-4",
        author: sampleProfiles[3],
        content: "New track dropping next week! Been working on this one for months. Can't wait for you all to hear it. 🎵",
        timestamp: Date().addingTimeInterval(-28800), // 8 hours ago
        reactions: [
            ReactionData(emoji: "🔥", count: 312),
            ReactionData(emoji: "🎶", count: 145),
            ReactionData(emoji: "❤️", count: 98)
        ],
        commentCount: 67,
        shareCount: 23
    ),
    PostData(
        id: "post-5",
        author: sampleProfiles[4],
        content: "User research tip: Always ask 'why' five times. You'll be amazed at what you discover when you dig deeper into motivations.",
        timestamp: Date().addingTimeInterval(-43200), // 12 hours ago
        reactions: [
            ReactionData(emoji: "💡", count: 89),
            ReactionData(emoji: "👍", count: 56),
            ReactionData(emoji: "🙏", count: 34)
        ],
        commentCount: 23,
        shareCount: 15,
        isSaved: true
    )
]

// MARK: - Sample Notifications

let sampleNotifications: [NotificationData] = [
    NotificationData(
        type: .like,
        actor: sampleProfiles[1],
        message: "liked your photo",
        timestamp: Date().addingTimeInterval(-300)
    ),
    NotificationData(
        type: .comment,
        actor: sampleProfiles[2],
        message: "commented: \"This is amazing!\"",
        timestamp: Date().addingTimeInterval(-1800)
    ),
    NotificationData(
        type: .follow,
        actor: sampleProfiles[3],
        message: "started following you",
        timestamp: Date().addingTimeInterval(-3600)
    ),
    NotificationData(
        type: .mention,
        actor: sampleProfiles[4],
        message: "mentioned you in a comment",
        timestamp: Date().addingTimeInterval(-7200),
        isRead: true
    ),
    NotificationData(
        type: .birthday,
        actor: sampleProfiles[5],
        message: "has a birthday today! 🎂",
        timestamp: Date().addingTimeInterval(-14400),
        isRead: true
    ),
    NotificationData(
        type: .friendRequest,
        actor: sampleProfiles[0],
        message: "sent you a friend request",
        timestamp: Date().addingTimeInterval(-28800)
    )
]

// MARK: - Sample Stories

let sampleStories: [StoryData] = [
    StoryData(
        author: sampleProfiles[0],
        mediaImage: "Posts/walking-sunrise-beach",
        timestamp: Date().addingTimeInterval(-1800),
        viewerCount: 156
    ),
    StoryData(
        author: sampleProfiles[1],
        mediaImage: "Posts/night-city-longexposure",
        timestamp: Date().addingTimeInterval(-3600),
        isViewed: true,
        viewerCount: 89
    ),
    StoryData(
        author: sampleProfiles[2],
        mediaImage: "Posts/SampleMedia",
        timestamp: Date().addingTimeInterval(-7200),
        viewerCount: 234
    ),
    StoryData(
        author: sampleProfiles[3],
        mediaImage: "Posts/SampleMedia",
        timestamp: Date().addingTimeInterval(-10800),
        isViewed: true,
        viewerCount: 67
    )
]

// MARK: - Sample Comments

let sampleComments: [CommentData] = [
    CommentData(
        author: sampleProfiles[1],
        content: "This is absolutely stunning! Where was this taken?",
        timestamp: Date().addingTimeInterval(-1800),
        likeCount: 12,
        isLiked: true
    ),
    CommentData(
        author: sampleProfiles[2],
        content: "Great shot! The colors are amazing 🎨",
        timestamp: Date().addingTimeInterval(-3600),
        likeCount: 8
    ),
    CommentData(
        author: sampleProfiles[3],
        content: "I need to visit this place!",
        timestamp: Date().addingTimeInterval(-7200),
        likeCount: 5,
        replies: [
            CommentData(
                author: sampleProfiles[0],
                content: "You should! It's in Malibu.",
                timestamp: Date().addingTimeInterval(-6900),
                likeCount: 3
            )
        ]
    )
]

// MARK: - Data Maps

/// Map of all profiles by ID
let profileDataMap: [String: ProfileData] = Dictionary(
    uniqueKeysWithValues: sampleProfiles.map { ($0.id, $0) }
)

/// Map of all posts by ID
let postDataMap: [String: PostData] = Dictionary(
    uniqueKeysWithValues: samplePosts.map { ($0.id, $0) }
)

/// General prism data map for miscellaneous content
let prismDataMap: [String: PrismData] = [
    "welcome": PrismData(
        id: "welcome",
        title: "Welcome to Prism",
        subtitle: "Your design system prototype",
        description: "Explore the components and patterns that make up the Prism Design System."
    ),
    "settings": PrismData(
        id: "settings",
        title: "Settings",
        subtitle: "Customize your experience",
        description: "Manage your account, privacy, and notification preferences."
    ),
    "about": PrismData(
        id: "about",
        title: "About Prism",
        subtitle: "Version 1.0.0",
        description: "Prism is a comprehensive design system built for scalability and consistency."
    )
]

// MARK: - Helper Functions

/// Get a random sample profile
func randomProfile() -> ProfileData {
    sampleProfiles.randomElement() ?? sampleProfiles[0]
}

/// Get a random sample post
func randomPost() -> PostData {
    samplePosts.randomElement() ?? samplePosts[0]
}

/// Format a date relative to now
func relativeTimeString(from date: Date) -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .short
    return formatter.localizedString(for: date, relativeTo: Date())
}

/// Get unread notification count
var unreadNotificationCount: Int {
    sampleNotifications.filter { !$0.isRead }.count
}

