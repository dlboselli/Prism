//
//  PDSPlaceCard.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A card for a map place: static map thumbnail (or image),
//  name, subtitle, and optional distance. Pairs with PDSMap.
//
//  Usage:
//  ```swift
//  PDSPlaceCard(place: samplePlaces[0], subtitle: "Landmark", distance: "1.2 mi", onTap: { })
//  ```
//

import SwiftUI

struct PDSPlaceCard: View {
    let name: String
    let subtitle: String?
    let distance: String?
    let latitude: Double
    let longitude: Double
    let onTap: (() -> Void)?

    init(
        name: String,
        subtitle: String? = nil,
        distance: String? = nil,
        latitude: Double,
        longitude: Double,
        onTap: (() -> Void)? = nil
    ) {
        self.name = name
        self.subtitle = subtitle
        self.distance = distance
        self.latitude = latitude
        self.longitude = longitude
        self.onTap = onTap
    }

    init(place: PlaceData, subtitle: String? = nil, distance: String? = nil, onTap: (() -> Void)? = nil) {
        self.init(
            name: place.name,
            subtitle: subtitle,
            distance: distance,
            latitude: place.latitude,
            longitude: place.longitude,
            onTap: onTap
        )
    }

    var body: some View {
        Button(action: { onTap?() }) {
            HStack(spacing: 12) {
                PDSMap(
                    latitude: latitude,
                    longitude: longitude,
                    span: 0.008,
                    interactionModes: [],
                    cornerRadius: CornerRadius.mediaSmall
                )
                .frame(width: 64, height: 64)
                .allowsHitTesting(false)

                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .typography(Typography.headline4)
                        .foregroundColor(Colors.textPrimary)
                        .lineLimit(1)

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .typography(Typography.caption1)
                            .foregroundColor(Colors.textSecondary)
                            .lineLimit(1)
                    }

                    if let distance = distance {
                        Text(distance)
                            .typography(Typography.caption2)
                            .foregroundColor(Colors.textSecondary)
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Colors.iconSecondary)
            }
            .padding(12)
            .background(Colors.backgroundCard)
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
            .shadow(Shadows.uiEmphasis)
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 12) {
        PDSPlaceCard(place: samplePlaces[0], subtitle: "Marketplace", distance: "1.2 mi", onTap: { })
        PDSPlaceCard(place: samplePlaces[1], subtitle: "Landmark", onTap: { })
    }
    .padding(20)
    .background(Colors.backgroundCanvas)
}
