//
//  PrismApp.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

@main
struct PrismApp: App {
    @AppStorage("appearanceMode") private var appearanceMode: String = AppearanceMode.auto.rawValue

    init() {
        // Navigation titles use Inter to match the rest of the system
        let appearance = UINavigationBar.appearance()
        if let largeFont = UIFont(name: "Inter-Bold", size: 34) {
            appearance.largeTitleTextAttributes = [
                .font: UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: largeFont)
            ]
        }
        if let inlineFont = UIFont(name: "Inter-SemiBold", size: 17) {
            appearance.titleTextAttributes = [
                .font: UIFontMetrics(forTextStyle: .headline).scaledFont(for: inlineFont)
            ]
        }
    }

    private var colorScheme: ColorScheme? {
        (AppearanceMode(rawValue: appearanceMode) ?? .auto).colorScheme
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(colorScheme)
        }
    }
}
