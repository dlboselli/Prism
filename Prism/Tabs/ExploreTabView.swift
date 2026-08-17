//
//  ExploreTabView.swift
//  Prism
//
//  Full-bleed PDSMap with sample places.
//

import SwiftUI

struct ExploreTabView: View {
    var body: some View {
        PDSMap(
            latitude: 37.7902,
            longitude: -122.4124,
            span: 0.06,
            markers: samplePlaces.map(\.marker),
            cornerRadius: CornerRadius.square
        )
        .ignoresSafeArea()
        .overlay(alignment: .top) {
            // Legibility scrim behind the large title over busy map content
            LinearGradient(
                stops: [
                    .init(color: Colors.backgroundSurface.opacity(0.95), location: 0.0),
                    .init(color: Colors.backgroundSurface.opacity(0.8), location: 0.5),
                    .init(color: Colors.backgroundSurface.opacity(0.0), location: 1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 190)
            .ignoresSafeArea(edges: .top)
            .allowsHitTesting(false)
        }
    }
}

extension PlaceData {
    var marker: PDSMapMarker {
        PDSMapMarker(id: id, title: name, latitude: latitude, longitude: longitude)
    }
}

#Preview {
    ExploreTabView()
}
