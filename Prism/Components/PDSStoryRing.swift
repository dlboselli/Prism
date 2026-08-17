//
//  PDSStoryRing.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A story avatar with an accent ring for unviewed stories and a
//  muted ring once viewed, with an optional name label below.
//
//  Usage:
//  ```swift
//  PDSStoryRing(initials: "SC", name: "Sarah", isViewed: false, onTap: { })
//  ```
//

import SwiftUI

struct PDSStoryRing: View {
    let initials: String?
    let image: String?
    let name: String?
    let isViewed: Bool
    let size: PDSActorSize
    let onTap: (() -> Void)?

    init(
        initials: String? = nil,
        image: String? = nil,
        name: String? = nil,
        isViewed: Bool = false,
        size: PDSActorSize = .large,
        onTap: (() -> Void)? = nil
    ) {
        self.initials = initials
        self.image = image
        self.name = name
        self.isViewed = isViewed
        self.size = size
        self.onTap = onTap
    }

    private var ringColor: Color {
        isViewed ? Colors.backgroundDivider : Colors.persistentAccent
    }

    var body: some View {
        Button(action: { onTap?() }) {
            VStack(spacing: 6) {
                avatar
                    .padding(3)
                    .overlay(
                        Circle()
                            .strokeBorder(ringColor, lineWidth: 2)
                    )

                if let name = name {
                    Text(name)
                        .typography(Typography.meta4)
                        .foregroundColor(Colors.textPrimary)
                        .lineLimit(1)
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(name ?? "Story"), \(isViewed ? "viewed" : "new") story")
        .accessibilityAddTraits(.isButton)
    }

    @ViewBuilder
    private var avatar: some View {
        if let image = image {
            PDSActor(image: image, size: size)
        } else {
            PDSActor(initials: initials ?? "?", size: size)
        }
    }
}

// MARK: - Preview

#Preview {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 16) {
            PDSStoryRing(image: "sampleProfile", name: "Sarah", isViewed: false)
            PDSStoryRing(initials: "MJ", name: "Marcus", isViewed: false)
            PDSStoryRing(initials: "ER", name: "Emily", isViewed: true)
            PDSStoryRing(initials: "DP", name: "David", isViewed: true)
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}
