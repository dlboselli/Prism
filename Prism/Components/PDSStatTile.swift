//
//  PDSStatTile.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Stat and metric displays: a plain value/label pair for profile
//  stat rows, and a card-framed tile for metric grids.
//
//  Usage:
//  ```swift
//  PDSStatTile(value: "12.5K", label: "Followers")
//  PDSStatTile(value: "48", label: "Posts", style: .card)
//  ```
//

import SwiftUI

// MARK: - Style

enum PDSStatTileStyle {
    case plain   // Profile header stat rows
    case card    // Metric grids and dashboards
}

// MARK: - PDSStatTile

struct PDSStatTile: View {
    let value: String
    let label: String
    let style: PDSStatTileStyle
    let onTap: (() -> Void)?

    init(
        value: String,
        label: String,
        style: PDSStatTileStyle = .plain,
        onTap: (() -> Void)? = nil
    ) {
        self.value = value
        self.label = label
        self.style = style
        self.onTap = onTap
    }

    var body: some View {
        Group {
            if let onTap = onTap {
                Button(action: onTap) { content }
                    .buttonStyle(.plain)
            } else {
                content
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(value) \(label)")
    }

    @ViewBuilder
    private var content: some View {
        switch style {
        case .plain:
            VStack(spacing: 2) {
                Text(value)
                    .typography(Typography.headline3Emphasized)
                    .foregroundColor(Colors.textPrimary)

                Text(label)
                    .typography(Typography.caption1)
                    .foregroundColor(Colors.textSecondary)
            }

        case .card:
            VStack(alignment: .leading, spacing: 4) {
                Text(value)
                    .typography(Typography.headline1Emphasized)
                    .foregroundColor(Colors.textPrimary)

                Text(label)
                    .typography(Typography.caption1)
                    .foregroundColor(Colors.textSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(Colors.backgroundCardFlat)
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
        }
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 32) {
        HStack(spacing: 32) {
            PDSStatTile(value: "48", label: "Posts")
            PDSStatTile(value: "12.5K", label: "Followers")
            PDSStatTile(value: "892", label: "Following")
        }

        HStack(spacing: 12) {
            PDSStatTile(value: "1.2M", label: "Impressions", style: .card)
            PDSStatTile(value: "+18%", label: "Engagement", style: .card)
        }
    }
    .padding(20)
    .background(Colors.backgroundSurface)
}
