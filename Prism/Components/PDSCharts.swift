import SwiftUI

// MARK: - Stat Card

/// A card displaying a key metric with optional trend
struct PDSStatCard: View {
    let value: String
    let label: String
    var trend: PDSStatTrend? = nil
    var sparklineData: [Double]? = nil
    var variant: PDSStatVariant = .default
    var size: PDSStatSize = .medium
    
    var body: some View {
        VStack(alignment: .leading, spacing: size.spacing) {
            // Value
            Text(value)
                .typography(size.valueTypography)
                .foregroundColor(variant.valueColor)
            
            // Label
            Text(label)
                .typography(size.labelTypography)
                .foregroundColor(Colors.textSecondary)
            
            // Trend or Sparkline
            if let trend = trend {
                trendView(trend)
            } else if let data = sparklineData {
                PDSSparkline(data: data, variant: variant.sparklineVariant)
                    .frame(height: size.sparklineHeight)
            }
        }
        .padding(size.padding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.card)
                .fill(Colors.backgroundCard)
        )
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityDescription)
    }
    
    private var accessibilityDescription: String {
        var description = "\(label): \(value)"
        if let trend = trend {
            let direction = trend.isPositive ? "up" : "down"
            let outcome = trend.isGood ? "positive change" : "negative change"
            description += ", \(direction) \(trend.text), \(outcome)"
        }
        return description
    }
    
    private func trendView(_ trend: PDSStatTrend) -> some View {
        HStack(spacing: 4) {
            Image(systemName: trend.isPositive ? "arrow.up.right" : "arrow.down.right")
                .font(.system(size: 12, weight: .semibold))
            
            Text(trend.text)
                .typography(Typography.meta3)
        }
        .foregroundColor(trend.color)
    }
}

struct PDSStatTrend {
    let value: Double // e.g., 0.12 for 12%
    let isPositive: Bool
    let isGood: Bool // Sometimes down is good (e.g., expenses)
    
    var text: String {
        let percentage = abs(value * 100)
        return String(format: "%.0f%%", percentage)
    }
    
    var color: Color {
        if isGood {
            return Colors.persistentPositive
        } else {
            return Colors.persistentNegative
        }
    }
    
    static func up(_ value: Double, isGood: Bool = true) -> PDSStatTrend {
        PDSStatTrend(value: value, isPositive: true, isGood: isGood)
    }
    
    static func down(_ value: Double, isGood: Bool = false) -> PDSStatTrend {
        PDSStatTrend(value: value, isPositive: false, isGood: isGood)
    }
}

enum PDSStatVariant {
    case `default`
    case accent
    case positive
    case warning
    case negative
    
    var valueColor: Color {
        switch self {
        case .default: return Colors.textPrimary
        case .accent: return Colors.persistentAccent
        case .positive: return Colors.persistentPositive
        case .warning: return Colors.persistentWarning
        case .negative: return Colors.persistentNegative
        }
    }
    
    var sparklineVariant: PDSSparklineVariant {
        switch self {
        case .default: return .neutral
        case .accent: return .accent
        case .positive: return .positive
        case .warning: return .warning
        case .negative: return .negative
        }
    }
}

enum PDSStatSize {
    case small
    case medium
    case large
    
    var valueTypography: Typography.Style {
        switch self {
        case .small: return Typography.headline4Emphasized
        case .medium: return Typography.headline2Emphasized
        case .large: return Typography.headline1Emphasized
        }
    }
    
    var labelTypography: Typography.Style {
        switch self {
        case .small: return Typography.meta4
        case .medium: return Typography.meta3
        case .large: return Typography.body3
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .small: return 4
        case .medium: return 8
        case .large: return 12
        }
    }
    
    var padding: CGFloat {
        switch self {
        case .small: return 12
        case .medium: return 16
        case .large: return 20
        }
    }
    
    var sparklineHeight: CGFloat {
        switch self {
        case .small: return 20
        case .medium: return 32
        case .large: return 40
        }
    }
}

// MARK: - Sparkline

/// A minimal inline chart showing trend
struct PDSSparkline: View {
    let data: [Double]
    var variant: PDSSparklineVariant = .neutral
    var showGradient: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            let normalizedData = normalizeData(data)
            let path = createPath(data: normalizedData, in: geometry.size)
            
            ZStack {
                // Gradient fill
                if showGradient {
                    path
                        .fill(
                            LinearGradient(
                                colors: [variant.color.opacity(0.3), variant.color.opacity(0.0)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
                
                // Line
                createLinePath(data: normalizedData, in: geometry.size)
                    .stroke(variant.color, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Sparkline trend: \(trendDescription)")
    }
    
    private var trendDescription: String {
        guard data.count >= 2 else { return "no data" }
        let first = data.first ?? 0
        let last = data.last ?? 0
        if last > first * 1.05 {
            return "trending up"
        } else if last < first * 0.95 {
            return "trending down"
        } else {
            return "stable"
        }
    }
    
    private func normalizeData(_ data: [Double]) -> [Double] {
        guard let min = data.min(), let max = data.max(), max > min else {
            return data.map { _ in 0.5 }
        }
        return data.map { ($0 - min) / (max - min) }
    }
    
    private func createPath(data: [Double], in size: CGSize) -> Path {
        var path = Path()
        guard data.count > 1 else { return path }
        
        let stepX = size.width / CGFloat(data.count - 1)
        
        path.move(to: CGPoint(x: 0, y: size.height))
        
        for (index, value) in data.enumerated() {
            let x = CGFloat(index) * stepX
            let y = size.height - (CGFloat(value) * size.height)
            
            if index == 0 {
                path.addLine(to: CGPoint(x: x, y: y))
            } else {
                let prevX = CGFloat(index - 1) * stepX
                let prevY = size.height - (CGFloat(data[index - 1]) * size.height)
                let midX = (prevX + x) / 2
                path.addCurve(
                    to: CGPoint(x: x, y: y),
                    control1: CGPoint(x: midX, y: prevY),
                    control2: CGPoint(x: midX, y: y)
                )
            }
        }
        
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.closeSubpath()
        
        return path
    }
    
    private func createLinePath(data: [Double], in size: CGSize) -> Path {
        var path = Path()
        guard data.count > 1 else { return path }
        
        let stepX = size.width / CGFloat(data.count - 1)
        
        for (index, value) in data.enumerated() {
            let x = CGFloat(index) * stepX
            let y = size.height - (CGFloat(value) * size.height)
            
            if index == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                let prevX = CGFloat(index - 1) * stepX
                let prevY = size.height - (CGFloat(data[index - 1]) * size.height)
                let midX = (prevX + x) / 2
                path.addCurve(
                    to: CGPoint(x: x, y: y),
                    control1: CGPoint(x: midX, y: prevY),
                    control2: CGPoint(x: midX, y: y)
                )
            }
        }
        
        return path
    }
}

enum PDSSparklineVariant {
    case neutral
    case accent
    case positive
    case warning
    case negative
    
    var color: Color {
        switch self {
        case .neutral: return Colors.gray500
        case .accent: return Colors.persistentAccent
        case .positive: return Colors.persistentPositive
        case .warning: return Colors.persistentWarning
        case .negative: return Colors.persistentNegative
        }
    }
}

// MARK: - Bar Chart

/// A simple bar chart
struct PDSBarChart: View {
    let data: [PDSBarChartData]
    var orientation: PDSBarOrientation = .vertical
    var showLabels: Bool = true
    var showValues: Bool = true
    var barSpacing: CGFloat = 8
    var cornerRadius: CGFloat = 4
    
    private var maxValue: Double {
        data.map { $0.value }.max() ?? 1
    }
    
    var body: some View {
        Group {
            switch orientation {
            case .vertical:
                verticalChart
            case .horizontal:
                horizontalChart
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(barChartAccessibilityLabel)
    }
    
    private var barChartAccessibilityLabel: String {
        guard !data.isEmpty else { return "Bar chart with no data" }
        let minItem = data.min(by: { $0.value < $1.value })
        let maxItem = data.max(by: { $0.value < $1.value })
        return "Bar chart with \(data.count) bars, ranging from \(minItem?.formattedValue ?? "0") to \(maxItem?.formattedValue ?? "0")"
    }
    
    private var verticalChart: some View {
        VStack(spacing: 8) {
            // Value labels row
            if showValues {
                HStack(spacing: barSpacing) {
                    ForEach(data) { item in
                        Text(item.formattedValue)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            
            // Bars - shared GeometryReader for consistent height
            GeometryReader { geometry in
                HStack(alignment: .bottom, spacing: barSpacing) {
                    ForEach(data) { item in
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(item.color ?? Colors.persistentAccent)
                            .frame(height: geometry.size.height * (item.value / maxValue))
                    }
                }
            }
            
            // Labels row
            if showLabels {
                HStack(spacing: barSpacing) {
                    ForEach(data) { item in
                        Text(item.label)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
    
    private var horizontalChart: some View {
        VStack(spacing: barSpacing) {
            ForEach(data) { item in
                HStack(spacing: 12) {
                    if showLabels {
                        Text(item.label)
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textSecondary)
                            .frame(width: 60, alignment: .trailing)
                    }
                    
                    GeometryReader { geometry in
                        HStack {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(item.color ?? Colors.persistentAccent)
                                .frame(width: geometry.size.width * (item.value / maxValue))
                            Spacer()
                        }
                    }
                    .frame(height: 24)
                    
                    if showValues {
                        Text(item.formattedValue)
                            .typography(Typography.meta3)
                            .foregroundColor(Colors.textPrimary)
                            .frame(width: 50, alignment: .trailing)
                    }
                }
            }
        }
    }
}

struct PDSBarChartData: Identifiable {
    let id = UUID()
    let label: String
    let value: Double
    var color: Color? = nil
    var formattedValue: String {
        if value >= 1000 {
            return String(format: "%.1fk", value / 1000)
        }
        return String(format: "%.0f", value)
    }
}

enum PDSBarOrientation {
    case vertical
    case horizontal
}

// MARK: - Line Chart

/// A line chart for trends over time
struct PDSLineChart: View {
    let data: [PDSLineChartData]
    var showPoints: Bool = true
    var showGrid: Bool = true
    var showLabels: Bool = true
    var lineWidth: CGFloat = 2
    var pointSize: CGFloat = 6
    var variant: PDSSparklineVariant = .accent
    
    private var allValues: [Double] {
        data.map { $0.value }
    }
    
    private var minValue: Double {
        allValues.min() ?? 0
    }
    
    private var maxValue: Double {
        allValues.max() ?? 1
    }
    
    var body: some View {
        VStack(spacing: 0) {
            chartArea
            xAxisLabels
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(lineChartAccessibilityLabel)
    }
    
    private var lineChartAccessibilityLabel: String {
        guard data.count >= 2 else { return "Line chart with insufficient data" }
        let first = data.first?.value ?? 0
        let last = data.last?.value ?? 0
        let trend: String
        if last > first * 1.05 {
            trend = "trending up"
        } else if last < first * 0.95 {
            trend = "trending down"
        } else {
            trend = "stable"
        }
        return "Line chart with \(data.count) points, \(trend) from \(String(format: "%.0f", first)) to \(String(format: "%.0f", last))"
    }
    
    private var chartArea: some View {
        GeometryReader { geometry in
            ZStack {
                if showGrid {
                    gridLines(in: geometry.size)
                }
                chartFill(in: geometry.size)
                chartLine(in: geometry.size)
                if showPoints {
                    chartPoints(in: geometry.size)
                }
            }
        }
    }
    
    @ViewBuilder
    private var xAxisLabels: some View {
        if showLabels && !data.isEmpty {
            HStack {
                ForEach(Array(data.enumerated()), id: \.offset) { index, item in
                    xAxisLabel(for: index, item: item)
                }
            }
            .padding(.top, 8)
        }
    }
    
    @ViewBuilder
    private func xAxisLabel(for index: Int, item: PDSLineChartData) -> some View {
        if index == 0 || index == data.count - 1 || index == data.count / 2 {
            Text(item.label)
                .typography(Typography.meta4)
                .foregroundColor(Colors.gray400)
        }
        if index < data.count - 1 {
            Spacer()
        }
    }
    
    private func gridLines(in size: CGSize) -> some View {
        VStack(spacing: 0) {
            ForEach(0..<4) { i in
                Rectangle()
                    .fill(Colors.backgroundDivider)
                    .frame(height: 1)
                if i < 3 {
                    Spacer()
                }
            }
        }
    }
    
    private func chartFill(in size: CGSize) -> some View {
        let path = createFilledPath(in: size)
        return path
            .fill(
                LinearGradient(
                    colors: [variant.color.opacity(0.3), variant.color.opacity(0.0)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
    
    private func chartLine(in size: CGSize) -> some View {
        let path = createLinePath(in: size)
        return path
            .stroke(variant.color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
    }
    
    private func chartPoints(in size: CGSize) -> some View {
        ForEach(Array(data.enumerated()), id: \.offset) { index, item in
            let point = pointPosition(for: index, in: size)
            Circle()
                .fill(variant.color)
                .frame(width: pointSize, height: pointSize)
                .position(point)
        }
    }
    
    private func pointPosition(for index: Int, in size: CGSize) -> CGPoint {
        let x = size.width * CGFloat(index) / CGFloat(max(data.count - 1, 1))
        let normalizedValue = (data[index].value - minValue) / max(maxValue - minValue, 1)
        let y = size.height - (size.height * normalizedValue)
        return CGPoint(x: x, y: y)
    }
    
    private func createLinePath(in size: CGSize) -> Path {
        var path = Path()
        guard data.count > 1 else { return path }
        
        for (index, _) in data.enumerated() {
            let point = pointPosition(for: index, in: size)
            
            if index == 0 {
                path.move(to: point)
            } else {
                let prevPoint = pointPosition(for: index - 1, in: size)
                let midX = (prevPoint.x + point.x) / 2
                path.addCurve(
                    to: point,
                    control1: CGPoint(x: midX, y: prevPoint.y),
                    control2: CGPoint(x: midX, y: point.y)
                )
            }
        }
        
        return path
    }
    
    private func createFilledPath(in size: CGSize) -> Path {
        var path = createLinePath(in: size)
        
        if !data.isEmpty {
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.closeSubpath()
        }
        
        return path
    }
}

struct PDSLineChartData: Identifiable {
    let id = UUID()
    let label: String
    let value: Double
}

// MARK: - Donut Chart

/// A donut/pie chart for proportions
struct PDSDonutChart: View {
    let data: [PDSDonutChartData]
    var size: CGFloat = 120
    var strokeWidth: CGFloat = 24
    var showCenter: Bool = true
    var centerLabel: String? = nil
    var centerValue: String? = nil
    
    private var total: Double {
        data.map { $0.value }.reduce(0, +)
    }
    
    var body: some View {
        ZStack {
            // Segments
            ForEach(Array(data.enumerated()), id: \.element.id) { index, item in
                let startAngle = startAngle(for: index)
                let endAngle = endAngle(for: index)
                
                Circle()
                    .trim(from: startAngle, to: endAngle)
                    .stroke(item.color, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
            }
            
            // Center label
            if showCenter {
                VStack(spacing: 2) {
                    if let value = centerValue {
                        Text(value)
                            .typography(Typography.headline3Emphasized)
                            .foregroundColor(Colors.textPrimary)
                    }
                    if let label = centerLabel {
                        Text(label)
                            .typography(Typography.meta4)
                            .foregroundColor(Colors.textSecondary)
                    }
                }
            }
        }
        .frame(width: size, height: size)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(donutChartAccessibilityLabel)
    }
    
    private var donutChartAccessibilityLabel: String {
        guard !data.isEmpty else { return "Donut chart with no data" }
        let segments = data.map { item -> String in
            let percentage = (item.value / total) * 100
            return "\(item.label) \(String(format: "%.0f", percentage)) percent"
        }.joined(separator: ", ")
        
        var label = "Donut chart: \(segments)"
        if let centerValue = centerValue, let centerLabel = centerLabel {
            label += ". Center shows \(centerValue) \(centerLabel)"
        } else if let centerValue = centerValue {
            label += ". Center shows \(centerValue)"
        }
        return label
    }
    
    private func startAngle(for index: Int) -> CGFloat {
        let preceding = data.prefix(index).map { $0.value }.reduce(0, +)
        return preceding / total
    }
    
    private func endAngle(for index: Int) -> CGFloat {
        let includingCurrent = data.prefix(index + 1).map { $0.value }.reduce(0, +)
        // Small gap between segments
        let gap: CGFloat = 0.01
        return (includingCurrent / total) - gap
    }
}

struct PDSDonutChartData: Identifiable {
    let id = UUID()
    let label: String
    let value: Double
    let color: Color
}

// MARK: - Previews

#Preview("Stat Card") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            // Basic
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Basic")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 12) {
                PDSStatCard(value: "1,234", label: "Steps")
                PDSStatCard(value: "87%", label: "Complete", variant: .positive)
            }
            
            // With Trend
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("With Trend")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 12) {
                PDSStatCard(
                    value: "2,847",
                    label: "Followers",
                    trend: .up(0.12)
                )
                PDSStatCard(
                    value: "$1,450",
                    label: "Expenses",
                    trend: .down(0.08, isGood: true)
                )
            }
            
            // With Sparkline
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("With Sparkline")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSStatCard(
                value: "4.2K",
                label: "Weekly views",
                sparklineData: [10, 25, 18, 32, 28, 45, 38],
                variant: .accent
            )
            
            // Sizes
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Sizes")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            HStack(spacing: 12) {
                PDSStatCard(value: "42", label: "Small", size: .small)
                PDSStatCard(value: "128", label: "Medium", size: .medium)
            }
            
            PDSStatCard(value: "1,234,567", label: "Large stat card", size: .large)
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Sparkline") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Variants")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            VStack(spacing: 16) {
                PDSSparkline(data: [10, 25, 18, 32, 28, 45, 38], variant: .neutral)
                    .frame(height: 40)
                PDSSparkline(data: [10, 25, 18, 32, 28, 45, 38], variant: .accent)
                    .frame(height: 40)
                PDSSparkline(data: [38, 32, 35, 28, 30, 22, 18], variant: .negative)
                    .frame(height: 40)
                PDSSparkline(data: [10, 15, 25, 35, 40, 42, 48], variant: .positive)
                    .frame(height: 40)
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Bar Chart") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            // Vertical
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Vertical")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSBarChart(data: [
                PDSBarChartData(label: "Mon", value: 120),
                PDSBarChartData(label: "Tue", value: 180),
                PDSBarChartData(label: "Wed", value: 95),
                PDSBarChartData(label: "Thu", value: 210),
                PDSBarChartData(label: "Fri", value: 165),
                PDSBarChartData(label: "Sat", value: 85),
                PDSBarChartData(label: "Sun", value: 140)
            ])
            .frame(height: 200)
            
            // Horizontal
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Horizontal")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSBarChart(data: [
                PDSBarChartData(label: "React", value: 4500, color: Colors.persistentAccent),
                PDSBarChartData(label: "Swift", value: 3200, color: Colors.persistentWarning),
                PDSBarChartData(label: "Python", value: 2800, color: Colors.persistentPositive),
                PDSBarChartData(label: "Go", value: 1900, color: Colors.blue400)
            ], orientation: .horizontal)
            .frame(height: 140)
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Line Chart") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Weekly Trend")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSLineChart(data: [
                PDSLineChartData(label: "Mon", value: 120),
                PDSLineChartData(label: "Tue", value: 180),
                PDSLineChartData(label: "Wed", value: 145),
                PDSLineChartData(label: "Thu", value: 210),
                PDSLineChartData(label: "Fri", value: 195),
                PDSLineChartData(label: "Sat", value: 165),
                PDSLineChartData(label: "Sun", value: 230)
            ])
            .frame(height: 200)
            
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Variants")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSLineChart(data: [
                PDSLineChartData(label: "W1", value: 80),
                PDSLineChartData(label: "W2", value: 95),
                PDSLineChartData(label: "W3", value: 88),
                PDSLineChartData(label: "W4", value: 110)
            ], variant: .positive)
            .frame(height: 150)
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

#Preview("Donut Chart") {
    ScrollView {
        VStack(alignment: .leading, spacing: 48) {
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Categories")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            VStack(spacing: 16) {
                PDSDonutChart(
                    data: [
                        PDSDonutChartData(label: "Food", value: 450, color: Colors.persistentAccent),
                        PDSDonutChartData(label: "Transport", value: 280, color: Colors.persistentPositive),
                        PDSDonutChartData(label: "Shopping", value: 320, color: Colors.persistentWarning),
                        PDSDonutChartData(label: "Other", value: 150, color: Colors.gray400)
                    ],
                    centerLabel: "Total",
                    centerValue: "$1.2K"
                )
                
                VStack(spacing: 8) {
                    legendItem(color: Colors.persistentAccent, label: "Food", value: "$450")
                    legendItem(color: Colors.persistentPositive, label: "Transport", value: "$280")
                    legendItem(color: Colors.persistentWarning, label: "Shopping", value: "$320")
                    legendItem(color: Colors.gray400, label: "Other", value: "$150")
                }
                .frame(maxWidth: .infinity)
            }
            
            VStack(alignment: .leading, spacing: PDSTextScale.content.lineSpacing) {
                Text("Progress Style")
                    .typography(PDSTextScale.content.headline)
                    .foregroundColor(Colors.textPrimary)
            }
            
            PDSDonutChart(
                data: [
                    PDSDonutChartData(label: "Complete", value: 72, color: Colors.persistentPositive),
                    PDSDonutChartData(label: "Remaining", value: 28, color: Colors.backgroundDeemphasized)
                ],
                size: 100,
                strokeWidth: 16,
                centerLabel: nil,
                centerValue: "72%"
            )
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}

private func legendItem(color: Color, label: String, value: String) -> some View {
    HStack(spacing: 8) {
        Circle()
            .fill(color)
            .frame(width: 10, height: 10)
        
        Text(label)
            .typography(Typography.body4)
            .foregroundColor(Colors.textSecondary)
            .lineLimit(1)
        
        Spacer()
        
        Text(value)
            .typography(Typography.body4)
            .foregroundColor(Colors.textPrimary)
            .lineLimit(1)
    }
}

