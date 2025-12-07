//
//  ReelsTabView.swift
//  Prism
//
//  Created by David Boselli on 11/22/25.
//

import SwiftUI

struct ReelsTabView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Video")
                        .typography(Typography.headline1Emphasized)
                        .foregroundColor(Colors.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
            }
            .background(Colors.surfaceBackground)
            .navigationTitle("Video")
        }
    }
}

#Preview {
    ReelsTabView()
}
