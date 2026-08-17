//
//  PrototypeSettingsView.swift
//  Prism
//
//  Toggles for customizing individual prototype views.
//
//  To add a toggle: define a key in PrototypeSettings, add a Toggle
//  here bound to @AppStorage(key), and read the same @AppStorage
//  wherever the view should react.
//

import SwiftUI

/// AppStorage keys for prototype toggles, namespaced by tab/view
enum PrototypeSettings {
    static let showActivityBadge = "proto.activity.showBadge"
}

struct PrototypeSettingsView: View {
    @AppStorage(PrototypeSettings.showActivityBadge) private var showActivityBadge = true

    var body: some View {
        List {
            Section {
                Toggle("Unread badge on tab icon", isOn: $showActivityBadge)
            } header: {
                Text("Activity")
            } footer: {
                Text("Toggles here customize specific prototype views. Each one is backed by AppStorage, so it persists across launches.")
            }
        }
        .navigationTitle("Prototype Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PrototypeSettingsView()
    }
}
