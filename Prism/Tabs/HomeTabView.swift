//
//  HomeTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Welcome to Prism")
                        .typography(Typography.headline1Emphasized)
                        .foregroundColor(Colors.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Your design system is ready to use.")
                        .typography(Typography.body2)
                        .foregroundColor(Colors.secondaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
            }
            .background(Colors.surfaceBackground)
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeTabView()
}
