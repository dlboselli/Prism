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
