//
//  PDSMapCallout.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  A compact callout bubble for map annotations: title, optional
//  subtitle, and a pointer. Use inside a MapKit Annotation.
//
//  Usage:
//  ```swift
//  Annotation("", coordinate: coordinate) {
//      PDSMapCallout(title: "Ferry Building", subtitle: "0.4 mi", onTap: { })
//  }
//  ```
//

import SwiftUI

struct PDSMapCallout: View {
    let title: String
    let subtitle: String?
    let onTap: (() -> Void)?

    init(title: String, subtitle: String? = nil, onTap: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.onTap = onTap
    }

    var body: some View {
        Button(action: { onTap?() }) {
            VStack(spacing: 0) {
                VStack(spacing: 1) {
                    Text(title)
                        .typography(Typography.headline4)
                        .foregroundColor(Colors.textPrimary)
                        .lineLimit(1)

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .typography(Typography.caption2)
                            .foregroundColor(Colors.textSecondary)
                            .lineLimit(1)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Colors.backgroundPopover)
                .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))

                Triangle()
                    .fill(Colors.backgroundPopover)
                    .frame(width: 14, height: 7)
            }
            .shadow(Shadows.uiEmphasis)
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Pointer

private struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 24) {
        PDSMapCallout(title: "Ferry Building", subtitle: "0.4 mi away", onTap: { })
        PDSMapCallout(title: "Coit Tower")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Colors.backgroundCanvas)
}
