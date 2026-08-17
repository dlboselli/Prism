//
//  PDSSkeleton.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Skeleton loading placeholders (glimmers). Shapes use the glimmer
//  radius tokens and pulse with a Motion token; the pulse is disabled
//  when Reduce Motion is on.
//
//  Usage:
//  ```swift
//  PDSSkeleton(.circle)
//      .frame(width: 40, height: 40)
//
//  PDSSkeleton(.rect(CornerRadius.glimmerMedium))
//      .frame(height: 180)
//
//  PDSSkeletonTextLines(lines: 3)
//  ```
//

import SwiftUI

// MARK: - Skeleton Shape

enum PDSSkeletonShape {
    case rect(CGFloat)
    case circle

    static let rect = PDSSkeletonShape.rect(CornerRadius.glimmerMedium)
}

// MARK: - PDSSkeleton

struct PDSSkeleton: View {
    let shape: PDSSkeletonShape

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var pulsing = false

    init(_ shape: PDSSkeletonShape = .rect) {
        self.shape = shape
    }

    var body: some View {
        fill
            .opacity(pulsing ? 0.45 : 1.0)
            .onAppear {
                guard !reduceMotion else { return }
                withAnimation(.easeInOut(duration: Motion.deliberateDuration).repeatForever(autoreverses: true)) {
                    pulsing = true
                }
            }
            .accessibilityLabel("Loading")
    }

    @ViewBuilder
    private var fill: some View {
        switch shape {
        case .rect(let radius):
            RoundedRectangle(cornerRadius: radius)
                .fill(Colors.backgroundDeemphasized)
        case .circle:
            Circle()
                .fill(Colors.backgroundDeemphasized)
        }
    }
}

// MARK: - Text Lines

/// A stack of text-shaped glimmer lines, the last one shortened
struct PDSSkeletonTextLines: View {
    let lines: Int

    init(lines: Int = 3) {
        self.lines = max(1, lines)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(0..<lines, id: \.self) { index in
                PDSSkeleton(.rect(CornerRadius.glimmerXSmall))
                    .frame(height: 12)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, index == lines - 1 ? 80 : 0)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Loading")
    }
}

// MARK: - Preview

#Preview {
    VStack(alignment: .leading, spacing: 24) {
        HStack(spacing: 12) {
            PDSSkeleton(.circle)
                .frame(width: 40, height: 40)

            PDSSkeletonTextLines(lines: 2)
        }

        PDSSkeleton(.rect(CornerRadius.glimmerLarge))
            .frame(height: 180)

        PDSSkeletonTextLines(lines: 3)
    }
    .padding(20)
    .background(Colors.backgroundSurface)
}
