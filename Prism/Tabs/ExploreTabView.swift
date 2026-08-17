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
