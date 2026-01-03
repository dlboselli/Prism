//
//  PDSMedia.swift
//  Prism
//
//  Prism Design System - Media Component
//

import SwiftUI

// MARK: - PDSMediaRatio

/// Predefined aspect ratios for media content
enum PDSMediaRatio: CaseIterable, Identifiable {
    case ratio16x9   // Widescreen video
    case ratio3x2    // Classic photography
    case ratio4x3    // Standard monitor
    case ratio5x4    // Large format
    case ratio1x1    // Square
    case ratio4x5    // Portrait photo
    case ratio3x5    // Tall portrait
    case ratio9x16   // Vertical video/stories
    case custom(width: CGFloat, height: CGFloat)
    
    var id: String { label }
    
    var aspectRatio: CGFloat {
        switch self {
        case .ratio16x9: return 16 / 9
        case .ratio3x2: return 3 / 2
        case .ratio4x3: return 4 / 3
        case .ratio5x4: return 5 / 4
        case .ratio1x1: return 1
        case .ratio4x5: return 4 / 5
        case .ratio3x5: return 3 / 5
        case .ratio9x16: return 9 / 16
        case .custom(let width, let height): return width / height
        }
    }
    
    var label: String {
        switch self {
        case .ratio16x9: return "16:9"
        case .ratio3x2: return "3:2"
        case .ratio4x3: return "4:3"
        case .ratio5x4: return "5:4"
        case .ratio1x1: return "1:1"
        case .ratio4x5: return "4:5"
        case .ratio3x5: return "3:5"
        case .ratio9x16: return "9:16"
        case .custom(let width, let height): return "\(Int(width)):\(Int(height))"
        }
    }
    
    // CaseIterable conformance for standard cases only
    static var allCases: [PDSMediaRatio] {
        [.ratio16x9, .ratio3x2, .ratio4x3, .ratio5x4, .ratio1x1, .ratio4x5, .ratio3x5, .ratio9x16]
    }
}

// MARK: - PDSMediaContentMode

/// Content mode for media display
enum PDSMediaContentMode {
    case fill       // Scales to fill, may crop
    case fit        // Scales to fit, may letterbox
}

// MARK: - PDSMedia

/// A media container component with configurable aspect ratios
struct PDSMedia<Content: View>: View {
    let ratio: PDSMediaRatio
    let cornerRadius: CGFloat
    let contentMode: PDSMediaContentMode
    let content: () -> Content
    
    init(
        ratio: PDSMediaRatio = .ratio16x9,
        cornerRadius: CGFloat = CornerRadius.media,
        contentMode: PDSMediaContentMode = .fill,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.ratio = ratio
        self.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.content = content
    }
    
    var body: some View {
        Color.clear
            .aspectRatio(ratio.aspectRatio, contentMode: .fit)
            .overlay {
                content()
                    .scaledToFill()
            }
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}

// MARK: - PDSMediaImage

/// A media component specifically for images
struct PDSMediaImage: View {
    let image: Image
    let ratio: PDSMediaRatio
    let cornerRadius: CGFloat
    
    init(
        _ image: Image,
        ratio: PDSMediaRatio = .ratio16x9,
        cornerRadius: CGFloat = CornerRadius.media
    ) {
        self.image = image
        self.ratio = ratio
        self.cornerRadius = cornerRadius
    }
    
    init(
        systemName: String,
        ratio: PDSMediaRatio = .ratio16x9,
        cornerRadius: CGFloat = CornerRadius.media
    ) {
        self.image = Image(systemName: systemName)
        self.ratio = ratio
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        PDSMedia(ratio: ratio, cornerRadius: cornerRadius) {
            image
                .resizable()
        }
    }
}

// MARK: - PDSAsyncMedia

/// A media component for loading remote images
struct PDSAsyncMedia: View {
    let url: URL?
    let ratio: PDSMediaRatio
    let cornerRadius: CGFloat
    
    init(
        url: URL?,
        ratio: PDSMediaRatio = .ratio16x9,
        cornerRadius: CGFloat = CornerRadius.media
    ) {
        self.url = url
        self.ratio = ratio
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        PDSMedia(ratio: ratio, cornerRadius: cornerRadius) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                case .success(let image):
                    image
                        .resizable()
                case .failure:
                    errorView
                @unknown default:
                    placeholder
                }
            }
        }
    }
    
    private var placeholder: some View {
        Rectangle()
            .fill(Colors.backgroundDeemphasized)
            .overlay {
                ProgressView()
                    .tint(Colors.iconSecondary)
            }
    }
    
    private var errorView: some View {
        Rectangle()
            .fill(Colors.backgroundDeemphasized)
            .overlay {
                Image(systemName: "photo")
                    .font(.system(size: 32))
                    .foregroundColor(Colors.iconSecondary)
            }
    }
}

// MARK: - PDSMediaPlaceholder

/// A placeholder media component for empty states
struct PDSMediaPlaceholder: View {
    let ratio: PDSMediaRatio
    let cornerRadius: CGFloat
    let icon: String
    
    init(
        ratio: PDSMediaRatio = .ratio16x9,
        cornerRadius: CGFloat = CornerRadius.media,
        icon: String = "photo"
    ) {
        self.ratio = ratio
        self.cornerRadius = cornerRadius
        self.icon = icon
    }
    
    var body: some View {
        PDSMedia(ratio: ratio, cornerRadius: cornerRadius) {
            Rectangle()
                .fill(Colors.backgroundDeemphasized)
                .overlay {
                    Image(systemName: icon)
                        .font(.system(size: 32))
                        .foregroundColor(Colors.iconSecondary)
                }
        }
    }
}

// MARK: - Preview

#Preview("PDSMedia Ratios") {
    ScrollView {
        VStack(spacing: 24) {
            // Landscape ratios
            sectionHeader("Landscape Ratios")
            
            ForEach([PDSMediaRatio.ratio16x9, .ratio3x2, .ratio4x3, .ratio5x4], id: \.label) { ratio in
                VStack(alignment: .leading, spacing: 8) {
                    Text(ratio.label)
                        .typography(Typography.meta2)
                        .foregroundColor(Colors.textSecondary)
                    
                    PDSMediaPlaceholder(ratio: ratio)
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
                .padding(.vertical, 8)
            
            // Square
            sectionHeader("Square")
            
            VStack(alignment: .leading, spacing: 8) {
                Text("1:1")
                    .typography(Typography.meta2)
                    .foregroundColor(Colors.textSecondary)
                
                PDSMediaPlaceholder(ratio: .ratio1x1)
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
                .padding(.vertical, 8)
            
            // Portrait ratios
            sectionHeader("Portrait Ratios")
            
            HStack(alignment: .top, spacing: 16) {
                ForEach([PDSMediaRatio.ratio4x5, .ratio3x5, .ratio9x16], id: \.label) { ratio in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(ratio.label)
                            .typography(Typography.meta2)
                            .foregroundColor(Colors.textSecondary)
                        
                        PDSMediaPlaceholder(ratio: ratio)
                    }
                }
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
                .padding(.vertical, 8)
            
            // Custom ratio
            sectionHeader("Custom Ratio")
            
            VStack(alignment: .leading, spacing: 8) {
                Text("21:9 (Ultrawide)")
                    .typography(Typography.meta2)
                    .foregroundColor(Colors.textSecondary)
                
                PDSMediaPlaceholder(ratio: .custom(width: 21, height: 9))
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("PDSMedia with Images") {
    ScrollView {
        VStack(spacing: 24) {
            Text("With Async Image")
                .typography(Typography.headline4Emphasized)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            PDSAsyncMedia(
                url: URL(string: "https://picsum.photos/800/450"),
                ratio: .ratio16x9
            )
            
            PDSAsyncMedia(
                url: URL(string: "https://picsum.photos/400/400"),
                ratio: .ratio1x1
            )
            
            Text("Placeholder States")
                .typography(Typography.headline4Emphasized)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
            
            HStack(spacing: 16) {
                PDSMediaPlaceholder(ratio: .ratio1x1, icon: "photo")
                PDSMediaPlaceholder(ratio: .ratio1x1, icon: "video")
                PDSMediaPlaceholder(ratio: .ratio1x1, icon: "music.note")
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

// MARK: - Preview Helper

private func sectionHeader(_ title: String) -> some View {
    Text(title)
        .typography(Typography.headline4Emphasized)
        .foregroundColor(Colors.textPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
}

