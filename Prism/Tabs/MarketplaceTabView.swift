//
//  MarketplaceTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct MarketplaceTabView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Marketplace")
                        .typography(Typography.headline1Emphasized)
                        .foregroundColor(Colors.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
            }
            .background(Colors.surfaceBackground)
            .navigationTitle("Marketplace")
        }
    }
}

#Preview {
    MarketplaceTabView()
}
