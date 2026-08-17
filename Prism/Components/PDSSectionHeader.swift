//
//  PDSSectionHeader.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A list section header with an optional trailing action,
//  for grouping feed and list content ("Today", "This week").
//
//  Usage:
//  ```swift
//  PDSSectionHeader("Today")
//  PDSSectionHeader("Suggested for you", actionTitle: "See all") { }
//  ```
//

import SwiftUI

struct PDSSectionHeader: View {
    let title: String
    let actionTitle: String?
    let action: (() -> Void)?

    init(_ title: String, actionTitle: String? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.actionTitle = actionTitle
        self.action = action
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
                .typography(Typography.headline4Emphasized)
                .foregroundColor(Colors.textPrimary)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            if let actionTitle = actionTitle {
                Button(actionTitle) { action?() }
                    .typography(Typography.meta3Link)
                    .foregroundColor(Colors.accentText)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 0) {
        PDSSectionHeader("Today")
        PDSSectionHeader("Suggested for you", actionTitle: "See all") { }
    }
    .background(Colors.backgroundSurface)
}
