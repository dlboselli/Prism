//
//  PDSBottomSheet.swift
//  Prism
//
//  Created by David Boselli on 12/31/24.
//

import SwiftUI

// MARK: - Bottom Sheet Detent

/// Available detent sizes for bottom sheets
enum PDSBottomSheetDetent: Hashable {
    case small
    case medium
    case large
    case fraction(CGFloat)
    case height(CGFloat)
    
    @available(iOS 16.0, *)
    var presentationDetent: PresentationDetent {
        switch self {
        case .small:
            return .fraction(0.25)
        case .medium:
            return .medium
        case .large:
            return .large
        case .fraction(let value):
            return .fraction(value)
        case .height(let value):
            return .height(value)
        }
    }
}

// MARK: - Bottom Sheet Modifier

/// PDS Bottom Sheet - Native iOS sheet with Prism styling
///
/// Usage:
/// ```swift
/// .pdsBottomSheet(isPresented: $showSheet) {
///     MySheetContent()
/// }
///
/// // With custom detents
/// .pdsBottomSheet(
///     isPresented: $showSheet,
///     detents: [.medium, .large],
///     showDragIndicator: true
/// ) {
///     MySheetContent()
/// }
/// ```
struct PDSBottomSheetModifier<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let detents: [PDSBottomSheetDetent]
    let showDragIndicator: Bool
    let showCloseButton: Bool
    let title: String?
    let onDismiss: (() -> Void)?
    @ViewBuilder let sheetContent: () -> SheetContent
    
    init(
        isPresented: Binding<Bool>,
        detents: [PDSBottomSheetDetent] = [.medium, .large],
        showDragIndicator: Bool = true,
        showCloseButton: Bool = false,
        title: String? = nil,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder sheetContent: @escaping () -> SheetContent
    ) {
        self._isPresented = isPresented
        self.detents = detents
        self.showDragIndicator = showDragIndicator
        self.showCloseButton = showCloseButton
        self.title = title
        self.onDismiss = onDismiss
        self.sheetContent = sheetContent
    }
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented, onDismiss: onDismiss) {
                sheetContentView
                    .presentationDetents(Set(detents.map { $0.presentationDetent }))
                    .presentationDragIndicator(showDragIndicator ? .visible : .hidden)
                    .presentationCornerRadius(CornerRadius.sheet)
                    .presentationBackground(Colors.backgroundBottomSheet)
            }
    }
    
    @ViewBuilder
    private var sheetContentView: some View {
        if showCloseButton || title != nil {
            VStack(spacing: 0) {
                // Header
                HStack {
                    if let title = title {
                        Text(title)
                            .typography(Typography.headline2)
                            .foregroundColor(Colors.textPrimary)
                    }
                    
                    Spacer()
                    
                    if showCloseButton {
                        Button {
                            isPresented = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Colors.iconSecondary)
                                .frame(width: 32, height: 32)
                                .background(Colors.backgroundDeemphasized)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal, Spacing.lg)
                .padding(.top, Spacing.lg)
                .padding(.bottom, Spacing.md)
                
                sheetContent()
            }
        } else {
            sheetContent()
        }
    }
}

// MARK: - View Extension

extension View {
    /// Presents a PDS-styled bottom sheet
    /// - Parameters:
    ///   - isPresented: Binding to control sheet visibility
    ///   - detents: Array of detent sizes (default: [.medium, .large])
    ///   - showDragIndicator: Whether to show the drag handle (default: true)
    ///   - showCloseButton: Whether to show a close button (default: false)
    ///   - title: Optional title for the sheet header
    ///   - onDismiss: Callback when sheet is dismissed
    ///   - content: The sheet content
    func pdsBottomSheet<Content: View>(
        isPresented: Binding<Bool>,
        detents: [PDSBottomSheetDetent] = [.medium, .large],
        showDragIndicator: Bool = true,
        showCloseButton: Bool = false,
        title: String? = nil,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        modifier(PDSBottomSheetModifier(
            isPresented: isPresented,
            detents: detents,
            showDragIndicator: showDragIndicator,
            showCloseButton: showCloseButton,
            title: title,
            onDismiss: onDismiss,
            sheetContent: content
        ))
    }
}

// MARK: - Corner Radius Extension

extension CornerRadius {
    /// Corner radius for bottom sheets (28pt)
    static let sheet: CGFloat = 28
}

// MARK: - Preview

#Preview("Bottom Sheet") {
    BottomSheetPreviewContainer()
}

private struct BottomSheetPreviewContainer: View {
    @State private var showBasicSheet = false
    @State private var showTitledSheet = false
    @State private var showSmallSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Button("Show Basic Sheet") {
                        showBasicSheet = true
                    }
                    .pdsButton(variant: .primary, size: .medium)
                    
                    Button("Show Sheet with Title") {
                        showTitledSheet = true
                    }
                    .pdsButton(variant: .secondary, size: .medium)
                    
                    Button("Show Small Sheet") {
                        showSmallSheet = true
                    }
                    .pdsButton(variant: .secondary, size: .medium)
                }
                .padding(20)
            }
            .background(Colors.backgroundSurface)
            .navigationTitle("Bottom Sheet")
        }
        .pdsBottomSheet(isPresented: $showBasicSheet) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Basic Bottom Sheet")
                    .typography(Typography.headline2)
                    .foregroundColor(Colors.textPrimary)
                
                Text("This is a simple bottom sheet with default medium and large detents. Drag to resize.")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                Spacer()
            }
            .padding(20)
        }
        .pdsBottomSheet(
            isPresented: $showTitledSheet,
            showCloseButton: true,
            title: "Sheet Title"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("This sheet has a header with title and close button.")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                PDSCellGroup {
                    PDSCell("Option 1") {
                        PDSCellChevron()
                    }
                    PDSCell("Option 2") {
                        PDSCellChevron()
                    }
                    PDSCell("Option 3") {
                        PDSCellChevron()
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .pdsBottomSheet(
            isPresented: $showSmallSheet,
            detents: [.small],
            showDragIndicator: true
        ) {
            VStack(spacing: 12) {
                Text("Quick Actions")
                    .typography(Typography.headline3)
                    .foregroundColor(Colors.textPrimary)
                
                HStack(spacing: 12) {
                    Button("Cancel") {
                        showSmallSheet = false
                    }
                    .pdsButton(variant: .secondary, size: .medium, width: .fullWidth)
                    
                    Button("Confirm") {
                        showSmallSheet = false
                    }
                    .pdsButton(variant: .primary, size: .medium, width: .fullWidth)
                }
            }
            .padding(20)
        }
    }
}

