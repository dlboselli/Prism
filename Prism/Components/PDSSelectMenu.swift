import SwiftUI

// MARK: - PDSSelectMenu

/// A styled wrapper around native SwiftUI Menu
struct PDSSelectMenu<Content: View>: View {
    let label: String?
    let content: () -> Content
    let displayValue: String
    let helpText: String?
    let errorText: String?
    let isDisabled: Bool
    
    private var hasError: Bool { errorText != nil }
    
    /// Initialize a select menu (action-based via Menu buttons)
    init(
        label: String? = nil,
        displayValue: String,
        helpText: String? = nil,
        errorText: String? = nil,
        isDisabled: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.label = label
        self.displayValue = displayValue
        self.helpText = helpText
        self.errorText = errorText
        self.isDisabled = isDisabled
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Label
            if let label = label {
                Text(label)
                    .typography(Typography.body3)
                    .foregroundColor(hasError ? Colors.persistentNegative : Colors.textPrimary)
            }
            
            // Native Menu
            Menu {
                content()
            } label: {
                HStack {
                    Text(displayValue)
                        .typography(Typography.body2)
                        .foregroundColor(displayValue.isEmpty ? Colors.textPlaceholder : Colors.textPrimary)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Colors.iconSecondary)
                }
                .padding(.horizontal, 12)
                .frame(height: 44)
                .background(Colors.backgroundCard)
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.small)
                        .stroke(hasError ? Colors.persistentNegative : Colors.textInputInactiveInnerBorder, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: CornerRadius.small))
            }
            .disabled(isDisabled)
            
            // Help/Error text
            if let error = errorText {
                HStack(spacing: 4) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 12))
                    Text(error)
                        .typography(Typography.meta3)
                }
                .foregroundColor(Colors.persistentNegative)
            } else if let help = helpText {
                Text(help)
                    .typography(Typography.meta3)
                    .foregroundColor(Colors.textSecondary)
            }
        }
        .opacity(isDisabled ? 0.5 : 1)
    }
}


// MARK: - PDSPicker

/// A styled wrapper around native SwiftUI Picker
struct PDSPicker<SelectionValue: Hashable, Content: View>: View {
    let label: String?
    @Binding var selection: SelectionValue
    let content: () -> Content
    let style: PickerDisplayStyle
    
    enum PickerDisplayStyle {
        case menu       // Dropdown menu
        case segmented  // Segmented control
        case wheel      // Wheel picker
        case inline     // Inline list
    }
    
    init(
        label: String? = nil,
        selection: Binding<SelectionValue>,
        style: PickerDisplayStyle = .menu,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.label = label
        self._selection = selection
        self.style = style
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let label = label {
                Text(label)
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textPrimary)
            }
            
            styledPicker
        }
    }
    
    @ViewBuilder
    private var styledPicker: some View {
        switch style {
        case .menu:
            Picker(label ?? "", selection: $selection) {
                content()
            }
            .pickerStyle(.menu)
            .tint(Colors.persistentAccent)
        case .segmented:
            Picker(label ?? "", selection: $selection) {
                content()
            }
            .pickerStyle(.segmented)
            .tint(Colors.persistentAccent)
        case .wheel:
            Picker(label ?? "", selection: $selection) {
                content()
            }
            .pickerStyle(.wheel)
            .tint(Colors.persistentAccent)
        case .inline:
            Picker(label ?? "", selection: $selection) {
                content()
            }
            .pickerStyle(.inline)
            .tint(Colors.persistentAccent)
        }
    }
}

// MARK: - PDSActionSheet

/// Helper to present a styled action sheet for selection
struct PDSActionSheetSelection<T: Identifiable & Hashable>: ViewModifier {
    let title: String
    let options: [T]
    @Binding var selection: T?
    @Binding var isPresented: Bool
    let optionLabel: (T) -> String
    
    func body(content: Content) -> some View {
        content
            .confirmationDialog(title, isPresented: $isPresented, titleVisibility: .visible) {
                ForEach(options, id: \.id) { option in
                    Button(optionLabel(option)) {
                        selection = option
                    }
                }
                Button("Cancel", role: .cancel) {}
            }
    }
}

extension View {
    func pdsActionSheetSelection<T: Identifiable & Hashable>(
        title: String,
        options: [T],
        selection: Binding<T?>,
        isPresented: Binding<Bool>,
        optionLabel: @escaping (T) -> String
    ) -> some View {
        modifier(PDSActionSheetSelection(
            title: title,
            options: options,
            selection: selection,
            isPresented: isPresented,
            optionLabel: optionLabel
        ))
    }
}

// MARK: - PDSMultiSelectList

/// Multi-selection using native List selection with circular checkboxes
struct PDSMultiSelectList<T: Identifiable & Hashable>: View where T.ID: Hashable {
    let options: [T]
    @Binding var selections: Set<T.ID>
    let optionLabel: (T) -> String
    let optionSubtitle: ((T) -> String)?
    
    init(
        options: [T],
        selections: Binding<Set<T.ID>>,
        optionLabel: @escaping (T) -> String,
        optionSubtitle: ((T) -> String)? = nil
    ) {
        self.options = options
        self._selections = selections
        self.optionLabel = optionLabel
        self.optionSubtitle = optionSubtitle
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.id) { option in
                let isSelected = selections.contains(option.id)
                
                Button {
                    if isSelected {
                        selections.remove(option.id)
                    } else {
                        selections.insert(option.id)
                    }
                } label: {
                    HStack(spacing: 12) {
                        // Checkbox
                        ZStack {
                            Circle()
                                .stroke(isSelected ? Colors.persistentAccent : Colors.textInputInactiveInnerBorder, lineWidth: 2)
                                .frame(width: 22, height: 22)
                            
                            if isSelected {
                                Circle()
                                    .fill(Colors.persistentAccent)
                                    .frame(width: 22, height: 22)
                                
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                        
                        // Label
                        VStack(alignment: .leading, spacing: 2) {
                            Text(optionLabel(option))
                                .typography(Typography.body2)
                                .foregroundColor(Colors.textPrimary)
                            
                            if let subtitle = optionSubtitle?(option) {
                                Text(subtitle)
                                    .typography(Typography.meta3)
                                    .foregroundColor(Colors.textSecondary)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(isSelected ? Colors.persistentAccentDeemphasized : Color.clear)
                }
                .buttonStyle(.plain)
                
                if option.id != options.last?.id {
                    Divider()
                        .padding(.leading, 50)
                }
            }
        }
        .background(Colors.backgroundCard)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Preview

#Preview("PDSSelectMenu") {
    NavigationStack {
        ScrollView {
            VStack(spacing: 24) {
                // Simple Menu
                SimpleMenuPreview()
                
                Divider()
                
                // Picker styles
                PickerPreview()
                
                Divider()
                
                // Multi-select
                MultiSelectPreview()
            }
            .padding(20)
        }
        .background(Colors.backgroundSurface)
        .navigationTitle("Select Menus")
    }
}

// Preview helpers
private struct SimpleMenuPreview: View {
    @State private var selected = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Native Menu")
                .typography(Typography.headline4Emphasized)
            
            PDSSelectMenu(
                label: "Select an option",
                displayValue: selected
            ) {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selected = option
                    }
                }
            }
        }
    }
}

private struct PickerPreview: View {
    @State private var selected = "USA"
    let countries = ["USA", "Canada", "Mexico", "UK"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Native Picker Styles")
                .typography(Typography.headline4Emphasized)
            
            PDSPicker(label: "Country (Menu)", selection: $selected, style: .menu) {
                ForEach(countries, id: \.self) { country in
                    Text(country).tag(country)
                }
            }
            
            PDSPicker(label: "Country (Segmented)", selection: $selected, style: .segmented) {
                ForEach(countries, id: \.self) { country in
                    Text(country).tag(country)
                }
            }
        }
    }
}

private struct MultiSelectPreview: View {
    struct Tag: Identifiable, Hashable {
        let id: String
        let name: String
    }
    
    @State private var selections: Set<String> = []
    let tags = [
        Tag(id: "1", name: "Design"),
        Tag(id: "2", name: "Development"),
        Tag(id: "3", name: "Marketing"),
        Tag(id: "4", name: "Product"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Multi-Select")
                .typography(Typography.headline4Emphasized)
            
            Text("List with multiple selection")
                .typography(Typography.meta3)
                .foregroundColor(Colors.textSecondary)
            
            PDSMultiSelectList(
                options: tags,
                selections: $selections,
                optionLabel: { $0.name }
            )
            .frame(height: 200)
            
            if !selections.isEmpty {
                Text("Selected: \(tags.filter { selections.contains($0.id) }.map { $0.name }.joined(separator: ", "))")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
            }
        }
    }
}
