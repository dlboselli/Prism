//
//  PDSEmptyState.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A centered empty-state layout with icon, title, message,
//  and an optional call-to-action button.
//
//  Usage:
//  ```swift
//  PDSEmptyState(
//      icon: "bell",
//      title: "No activity yet",
//      message: "When people interact with you, it shows up here.",
//      actionTitle: "Find friends",
//      action: { }
//  )
//  ```
//

import SwiftUI

struct PDSEmptyState: View {
    let icon: String
    let title: String
    let message: String?
    let actionTitle: String?
    let action: (() -> Void)?

    init(
        icon: String,
        title: String,
        message: String? = nil,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.actionTitle = actionTitle
        self.action = action
    }

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 48, weight: .light))
                .foregroundStyle(Colors.iconSecondary)
                .frame(width: 64, height: 64)
                .accessibilityHidden(true)

            VStack(spacing: 4) {
                Text(title)
                    .typography(Typography.headline2Emphasized)
                    .foregroundColor(Colors.textPrimary)

                if let message = message {
                    Text(message)
                        .typography(Typography.body3)
                        .foregroundColor(Colors.textSecondary)
                        .multilineTextAlignment(.center)
                }
            }
            .accessibilityElement(children: .combine)

            if let actionTitle = actionTitle {
                Button(actionTitle) { action?() }
                    .pdsButton(variant: .primaryDeemphasized, size: .medium)
                    .padding(.top, 4)
            }
        }
        .padding(.horizontal, 32)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 48) {
        PDSEmptyState(
            icon: "bell",
            title: "No activity yet",
            message: "When people interact with you, it shows up here.",
            actionTitle: "Find friends",
            action: { }
        )

        PDSEmptyState(
            icon: "magnifyingglass",
            title: "No results"
        )
    }
    .frame(maxHeight: .infinity)
    .background(Colors.backgroundSurface)
}
