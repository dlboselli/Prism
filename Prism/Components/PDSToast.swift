//
//  PDSToast.swift
//  Prism
//
//  Part of the Prism Design System (PDS)
//
//  Transient feedback toasts. Present with the .pdsToast modifier;
//  the toast auto-dismisses and honors Reduce Motion.
//
//  Usage:
//  ```swift
//  @State private var showToast = false
//
//  content
//      .pdsToast(isPresented: $showToast, variant: .positive, message: "Request sent")
//  ```
//

import SwiftUI

// MARK: - Toast Variant

enum PDSToastVariant {
    case neutral
    case positive
    case negative
    case warning

    var icon: String {
        switch self {
        case .neutral: return "info.circle.fill"
        case .positive: return "checkmark.circle.fill"
        case .negative: return "exclamationmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        }
    }

    var iconColor: Color {
        switch self {
        case .neutral: return Colors.iconSecondary
        case .positive: return Colors.fixedPositive
        case .negative: return Colors.fixedNegative
        case .warning: return Colors.fixedWarning
        }
    }
}

// MARK: - PDSToast

struct PDSToast: View {
    let variant: PDSToastVariant
    let message: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: variant.icon)
                .font(.system(size: 16))
                .foregroundColor(variant.iconColor)

            Text(message)
                .typography(Typography.headline4)
                .foregroundColor(Colors.textPrimary)
                .lineLimit(2)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Colors.backgroundPopover)
        .clipShape(Capsule())
        .shadow(Shadows.uiEmphasis)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Presentation Modifier

struct PDSToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let variant: PDSToastVariant
    let message: String
    let duration: Double

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if isPresented {
                    PDSToast(variant: variant, message: message)
                        .padding(.bottom, 24)
                        .transition(
                            reduceMotion
                                ? .opacity
                                : .move(edge: .bottom).combined(with: .opacity)
                        )
                        .task {
                            try? await Task.sleep(for: .seconds(duration))
                            withAnimation(Motion.springGentle) {
                                isPresented = false
                            }
                        }
                }
            }
            .animation(reduceMotion ? Motion.quick : Motion.springGentle, value: isPresented)
    }
}

extension View {
    func pdsToast(
        isPresented: Binding<Bool>,
        variant: PDSToastVariant = .neutral,
        message: String,
        duration: Double = 2.5
    ) -> some View {
        modifier(PDSToastModifier(
            isPresented: isPresented,
            variant: variant,
            message: message,
            duration: duration
        ))
    }
}

// MARK: - Preview

#Preview {
    struct ToastPreview: View {
        @State private var showToast = true

        var body: some View {
            VStack {
                Button("Show toast") { showToast = true }
                    .pdsButton(variant: .primary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.backgroundSurface)
            .pdsToast(isPresented: $showToast, variant: .positive, message: "Friend request sent")
        }
    }

    return ToastPreview()
}
