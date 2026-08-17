//
//  PDSPermissionPrompt.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A permission-priming card shown before triggering a system
//  permission dialog: icon, explanation, allow and defer actions.
//
//  Usage:
//  ```swift
//  PDSPermissionPrompt(
//      icon: "location.fill",
//      title: "See what's nearby",
//      message: "Prism uses your location to show places around you.",
//      allowTitle: "Allow location",
//      onAllow: { },
//      onDismiss: { }
//  )
//  ```
//

import SwiftUI

struct PDSPermissionPrompt: View {
    let icon: String
    let title: String
    let message: String
    let allowTitle: String
    let dismissTitle: String
    let onAllow: (() -> Void)?
    let onDismiss: (() -> Void)?

    init(
        icon: String,
        title: String,
        message: String,
        allowTitle: String = "Allow",
        dismissTitle: String = "Not now",
        onAllow: (() -> Void)? = nil,
        onDismiss: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.allowTitle = allowTitle
        self.dismissTitle = dismissTitle
        self.onAllow = onAllow
        self.onDismiss = onDismiss
    }

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Colors.fixedAccentDeemphasized)
                    .frame(width: 56, height: 56)

                Image(systemName: icon)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Colors.fixedAccent)
            }
            .accessibilityHidden(true)

            VStack(spacing: 4) {
                Text(title)
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.textPrimary)
                    .multilineTextAlignment(.center)

                Text(message)
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .accessibilityElement(children: .combine)

            VStack(spacing: 8) {
                Button(allowTitle) { onAllow?() }
                    .pdsButton(variant: .primary, width: .fullWidth)

                Button(dismissTitle) { onDismiss?() }
                    .pdsButton(variant: .secondary, width: .fullWidth)
            }
        }
        .padding(24)
        .background(Colors.backgroundCard)
        .clipShape(RoundedRectangle(cornerRadius: CornerRadius.cardLarge))
        .shadow(Shadows.responsiveUI)
    }
}

// MARK: - Preview

#Preview {
    PDSPermissionPrompt(
        icon: "location.fill",
        title: "See what's nearby",
        message: "Prism uses your location to show places and friends around you. You can change this anytime in Settings.",
        allowTitle: "Allow location",
        onAllow: { },
        onDismiss: { }
    )
    .padding(24)
    .frame(maxHeight: .infinity)
    .background(Colors.backgroundCanvas)
}
