//
//  NewComponentDetailViews.swift
//  Prism
//
//  Gallery detail views for the components added in the library
//  expansion. Each shows the component's variants and states.
//

import SwiftUI

// MARK: - Shared Section

private func componentSection<Content: View>(
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

private struct DetailScroll<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                content()

                Spacer().frame(height: 20)
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Post Card

struct PostCardDetailView: View {
    var body: some View {
        DetailScroll(title: "Post Card") {
            componentSection(title: "With Media", description: "Header, body, media, reactions, and actions composed from existing PDS components") {
                PDSPostCard(post: samplePosts[0])
            }

            componentSection(title: "Text Only", description: "Media section collapses when the post has no images") {
                PDSPostCard(post: samplePosts[2])
            }
        }
    }
}

// MARK: - Empty State

struct EmptyStateDetailView: View {
    var body: some View {
        DetailScroll(title: "Empty State") {
            componentSection(title: "With Action", description: "Icon, title, message, and call to action") {
                PDSEmptyState(
                    icon: "bell",
                    title: "No activity yet",
                    message: "When people interact with you, it shows up here.",
                    actionTitle: "Find friends",
                    action: { }
                )
                .padding(.vertical, 24)
            }

            componentSection(title: "Minimal", description: "Icon and title only") {
                PDSEmptyState(icon: "magnifyingglass", title: "No results")
                    .padding(.vertical, 24)
            }
        }
    }
}

// MARK: - Skeleton

struct SkeletonDetailView: View {
    var body: some View {
        DetailScroll(title: "Skeleton") {
            componentSection(title: "Shapes", description: "Circle and rect glimmers using the glimmer radius tokens; the pulse honors Reduce Motion") {
                HStack(spacing: 12) {
                    PDSSkeleton(.circle)
                        .frame(width: 40, height: 40)

                    PDSSkeletonTextLines(lines: 2)
                }
            }

            componentSection(title: "Post Placeholder", description: "Composed loading state for a feed post") {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 12) {
                        PDSSkeleton(.circle)
                            .frame(width: 40, height: 40)

                        PDSSkeletonTextLines(lines: 2)
                            .frame(maxWidth: 180)
                    }

                    PDSSkeleton(.rect(CornerRadius.glimmerLarge))
                        .frame(height: 180)

                    PDSSkeletonTextLines(lines: 3)
                }
            }
        }
    }
}

// MARK: - Place Card

struct PlaceCardDetailView: View {
    var body: some View {
        DetailScroll(title: "Place Card") {
            componentSection(title: "Full", description: "Static map thumbnail, name, subtitle, and distance") {
                PDSPlaceCard(place: samplePlaces[0], subtitle: "Marketplace", distance: "1.2 mi", onTap: { })
            }

            componentSection(title: "Minimal", description: "Name only") {
                PDSPlaceCard(place: samplePlaces[1], onTap: { })
            }
        }
    }
}

// MARK: - Map Callout

struct MapCalloutDetailView: View {
    var body: some View {
        DetailScroll(title: "Map Callout") {
            componentSection(title: "Variants", description: "Annotation bubble with pointer, for use inside MapKit annotations") {
                HStack(spacing: 24) {
                    PDSMapCallout(title: "Ferry Building", subtitle: "0.4 mi", onTap: { })
                    PDSMapCallout(title: "Coit Tower")
                }
            }

            componentSection(title: "On Map", description: "Callout in context over a static map") {
                PDSMap(
                    latitude: samplePlaces[0].latitude,
                    longitude: samplePlaces[0].longitude,
                    span: 0.01,
                    interactionModes: []
                )
                .frame(height: 200)
                .overlay(
                    PDSMapCallout(title: samplePlaces[0].name, subtitle: "0.4 mi")
                        .allowsHitTesting(false)
                )
            }
        }
    }
}

// MARK: - Stat Tile

struct StatTileDetailView: View {
    var body: some View {
        DetailScroll(title: "Stat Tile") {
            componentSection(title: "Plain", description: "Value and label pairs for profile stat rows") {
                HStack(spacing: 32) {
                    PDSStatTile(value: "48", label: "Posts")
                    PDSStatTile(value: "12.5K", label: "Followers")
                    PDSStatTile(value: "892", label: "Following")
                }
                .frame(maxWidth: .infinity)
            }

            componentSection(title: "Card", description: "Framed tiles for metric grids") {
                HStack(spacing: 12) {
                    PDSStatTile(value: "1.2M", label: "Impressions", style: .card)
                    PDSStatTile(value: "+18%", label: "Engagement", style: .card)
                }
            }
        }
    }
}

// MARK: - Profile Header

struct ProfileHeaderDetailView: View {
    var body: some View {
        DetailScroll(title: "Profile Header") {
            componentSection(title: "Full", description: "Avatar, stats, bio, and actions composed from Actor and Stat Tile") {
                PDSProfileHeader(profile: sampleProfiles[0], postCount: 48)
                    .background(Colors.backgroundCardFlat)
                    .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
            }

            componentSection(title: "Own Profile", description: "Single edit action instead of follow and message") {
                PDSProfileHeader(
                    profile: sampleProfiles[2],
                    postCount: 112,
                    primaryActionTitle: "Edit profile",
                    secondaryActionTitle: nil
                )
                .background(Colors.backgroundCardFlat)
                .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
            }
        }
    }
}

// MARK: - Story Ring

struct StoryRingDetailView: View {
    var body: some View {
        DetailScroll(title: "Story Ring") {
            componentSection(title: "States", description: "Accent ring for new stories, muted once viewed") {
                HStack(spacing: 16) {
                    PDSStoryRing(image: "sampleProfile", name: "Sarah", isViewed: false)
                    PDSStoryRing(initials: "MJ", name: "Marcus", isViewed: false)
                    PDSStoryRing(initials: "ER", name: "Emily", isViewed: true)
                }
            }

            componentSection(title: "Stories Rail", description: "Horizontal scroll composition from sample data") {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(sampleStories) { story in
                            PDSStoryRing(
                                initials: story.author.name.split(separator: " ").prefix(2).compactMap(\.first).map(String.init).joined(),
                                name: story.author.name.split(separator: " ").first.map(String.init),
                                isViewed: story.isViewed
                            )
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Filter Bar

struct FilterBarDetailView: View {
    @State private var basicSelection = "all"
    @State private var iconSelection = "places"

    var body: some View {
        DetailScroll(title: "Filter Bar") {
            componentSection(title: "Text Chips", description: "Single-select filter chips built on the action chip styles") {
                PDSFilterBar(
                    items: [
                        PDSFilterItem(id: "all", title: "All"),
                        PDSFilterItem(id: "friends", title: "Friends"),
                        PDSFilterItem(id: "groups", title: "Groups"),
                        PDSFilterItem(id: "events", title: "Events")
                    ],
                    selection: $basicSelection
                )
                .padding(.horizontal, -20)
            }

            componentSection(title: "With Icons", description: "Chips carry SF Symbols") {
                PDSFilterBar(
                    items: [
                        PDSFilterItem(id: "places", title: "Places", icon: "mappin"),
                        PDSFilterItem(id: "people", title: "People", icon: "person"),
                        PDSFilterItem(id: "photos", title: "Photos", icon: "photo"),
                        PDSFilterItem(id: "videos", title: "Videos", icon: "video")
                    ],
                    selection: $iconSelection
                )
                .padding(.horizontal, -20)
            }
        }
    }
}

// MARK: - Toast

struct ToastDetailView: View {
    @State private var showNeutral = false
    @State private var showPositive = false
    @State private var showNegative = false

    var body: some View {
        DetailScroll(title: "Toast") {
            componentSection(title: "Variants", description: "Static appearance of each variant") {
                VStack(spacing: 12) {
                    PDSToast(variant: .neutral, message: "Draft saved")
                    PDSToast(variant: .positive, message: "Friend request sent")
                    PDSToast(variant: .negative, message: "Couldn't load feed")
                    PDSToast(variant: .warning, message: "Connection is slow")
                }
                .frame(maxWidth: .infinity)
            }

            componentSection(title: "Presentation", description: "Auto-dismissing overlay via the pdsToast modifier; honors Reduce Motion") {
                VStack(spacing: 12) {
                    Button("Show neutral toast") { showNeutral = true }
                        .pdsButton(variant: .secondary, width: .fullWidth)

                    Button("Show positive toast") { showPositive = true }
                        .pdsButton(variant: .secondary, width: .fullWidth)

                    Button("Show negative toast") { showNegative = true }
                        .pdsButton(variant: .secondary, width: .fullWidth)
                }
            }
        }
        .pdsToast(isPresented: $showNeutral, variant: .neutral, message: "Draft saved")
        .pdsToast(isPresented: $showPositive, variant: .positive, message: "Friend request sent")
        .pdsToast(isPresented: $showNegative, variant: .negative, message: "Couldn't load feed")
    }
}

// MARK: - Section Header

struct SectionHeaderDetailView: View {
    var body: some View {
        DetailScroll(title: "Section Header") {
            componentSection(title: "Variants", description: "Plain, and with a trailing action") {
                VStack(spacing: 8) {
                    PDSSectionHeader("Today")
                    PDSSectionHeader("Suggested for you", actionTitle: "See all") { }
                }
                .padding(.horizontal, -16)
            }

            componentSection(title: "In Context", description: "Grouping notification cells") {
                VStack(spacing: 0) {
                    PDSSectionHeader("Today")

                    PDSNotificationCell(
                        type: .like,
                        actorName: sampleProfiles[1].name,
                        actorInitials: "MJ",
                        message: "liked your photo",
                        timestamp: "5 min. ago",
                        isRead: false
                    )

                    PDSSectionHeader("This week")

                    PDSNotificationCell(
                        type: .follow,
                        actorName: sampleProfiles[3].name,
                        actorInitials: "DP",
                        message: "started following you",
                        timestamp: "3 days ago",
                        isRead: true
                    )
                }
                .padding(.horizontal, -16)
            }
        }
    }
}

// MARK: - Permission Prompt

struct PermissionPromptDetailView: View {
    var body: some View {
        DetailScroll(title: "Permission Prompt") {
            componentSection(title: "Location Priming", description: "Shown before triggering the system permission dialog") {
                PDSPermissionPrompt(
                    icon: "location.fill",
                    title: "See what's nearby",
                    message: "Prism uses your location to show places and friends around you. You can change this anytime in Settings.",
                    allowTitle: "Allow location",
                    onAllow: { },
                    onDismiss: { }
                )
            }

            componentSection(title: "Notifications", description: "Same pattern for other permissions") {
                PDSPermissionPrompt(
                    icon: "bell.badge.fill",
                    title: "Don't miss a thing",
                    message: "Turn on notifications to know when friends react, comment, or send requests.",
                    allowTitle: "Turn on notifications"
                )
            }
        }
    }
}
