//
//  PDSMap.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A map component wrapping MapKit's SwiftUI Map with PDS tokens.
//  Supports framed (card) and full-bleed presentations, optional
//  markers, and configurable interaction modes. Does not request
//  user location, so no location permission is required.
//
//  Usage:
//  ```swift
//  // Framed card map
//  PDSMap(markers: markers)
//      .frame(height: 260)
//
//  // Full-bleed screen map
//  PDSMap(span: 0.09, markers: markers, cornerRadius: CornerRadius.square)
//      .ignoresSafeArea()
//
//  // Static preview (no pan/zoom)
//  PDSMap(interactionModes: [])
//  ```
//

import SwiftUI
import MapKit

// MARK: - Map Marker

/// A point of interest displayed on a PDSMap
struct PDSMapMarker: Identifiable {
    let id: String
    let title: String
    let latitude: Double
    let longitude: Double

    init(
        id: String = UUID().uuidString,
        title: String,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

// MARK: - PDSMap

/// A map component with token-driven framing and accent-tinted markers
struct PDSMap: View {
    let markers: [PDSMapMarker]
    let interactionModes: MapInteractionModes
    let cornerRadius: CGFloat

    @State private var position: MapCameraPosition

    init(
        latitude: Double = 37.7749,
        longitude: Double = -122.4194,
        span: Double = 0.05,
        markers: [PDSMapMarker] = [],
        interactionModes: MapInteractionModes = .all,
        cornerRadius: CGFloat = CornerRadius.media
    ) {
        self.markers = markers
        self.interactionModes = interactionModes
        self.cornerRadius = cornerRadius
        _position = State(initialValue: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
            )
        ))
    }

    var body: some View {
        Map(position: $position, interactionModes: interactionModes) {
            ForEach(markers) { marker in
                Marker(marker.title, coordinate: marker.coordinate)
                    .tint(Colors.fixedAccent)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .accessibilityLabel("Map")
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        PDSMap(markers: samplePlaces.map(\.marker))
            .frame(height: 260)

        PDSMap(span: 0.02, interactionModes: [])
            .frame(height: 160)
    }
    .padding(20)
}
