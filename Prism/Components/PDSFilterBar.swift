//
//  PDSFilterBar.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A horizontally scrolling bar of selectable filter chips,
//  built on the action chip styles. Single selection.
//
//  Usage:
//  ```swift
//  @State private var filter = "all"
//
//  PDSFilterBar(
//      items: [
//          PDSFilterItem(id: "all", title: "All"),
//          PDSFilterItem(id: "places", title: "Places", icon: "mappin"),
//          PDSFilterItem(id: "people", title: "People", icon: "person")
//      ],
//      selection: $filter
//  )
//  ```
//

import SwiftUI

// MARK: - Filter Item

struct PDSFilterItem: Identifiable {
    let id: String
    let title: String
    let icon: String?

    init(id: String, title: String, icon: String? = nil) {
        self.id = id
        self.title = title
        self.icon = icon
    }
}

// MARK: - PDSFilterBar

struct PDSFilterBar: View {
    let items: [PDSFilterItem]
    @Binding var selection: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(items) { item in
                    Button(item.title) {
                        withAnimation(Motion.springSnappy) {
                            selection = item.id
                        }
                    }
                    .pdsActionChip(isSelected: selection == item.id, icon: item.icon)
                    .accessibilityAddTraits(selection == item.id ? [.isSelected] : [])
                }
            }
            .padding(.horizontal, 16)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Filters")
    }
}

// MARK: - Preview

#Preview {
    struct FilterBarPreview: View {
        @State private var selection = "all"

        var body: some View {
            PDSFilterBar(
                items: [
                    PDSFilterItem(id: "all", title: "All"),
                    PDSFilterItem(id: "places", title: "Places", icon: "mappin"),
                    PDSFilterItem(id: "people", title: "People", icon: "person"),
                    PDSFilterItem(id: "photos", title: "Photos", icon: "photo"),
                    PDSFilterItem(id: "videos", title: "Videos", icon: "video")
                ],
                selection: $selection
            )
            .padding(.vertical, 20)
            .background(Colors.backgroundSurface)
        }
    }

    return FilterBarPreview()
}
