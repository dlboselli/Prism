import SwiftUI

// MARK: - PDSTextField

/// Styled text field using native TextField
struct PDSTextField: View {
    let label: String?
    let placeholder: String
    @Binding var text: String
    let helpText: String?
    let errorText: String?
    let leadingIcon: String?
    let trailingIcon: String?
    let isSecure: Bool
    let isDisabled: Bool
    let submitLabel: SubmitLabel
    let onTrailingTap: (() -> Void)?
    let onSubmit: (() -> Void)?
    
    @FocusState private var isFocused: Bool
    
    private var hasError: Bool { errorText != nil }
    
    init(
        label: String? = nil,
        placeholder: String = "",
        text: Binding<String>,
        helpText: String? = nil,
        errorText: String? = nil,
        leadingIcon: String? = nil,
        trailingIcon: String? = nil,
        isSecure: Bool = false,
        isDisabled: Bool = false,
        submitLabel: SubmitLabel = .done,
        onTrailingTap: (() -> Void)? = nil,
        onSubmit: (() -> Void)? = nil
    ) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.helpText = helpText
        self.errorText = errorText
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isSecure = isSecure
        self.isDisabled = isDisabled
        self.submitLabel = submitLabel
        self.onTrailingTap = onTrailingTap
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Label
            if let label = label {
                Text(label)
                    .typography(Typography.body3)
                    .foregroundColor(hasError ? Colors.persistentNegative : Colors.textPrimary)
            }
            
            // Input field
            HStack(spacing: 8) {
                if let icon = leadingIcon {
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(Colors.iconSecondary)
                }
                
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
                .typography(Typography.body2)
                .submitLabel(submitLabel)
                .onSubmit { onSubmit?() }
                .focused($isFocused)
                
                if let icon = trailingIcon {
                    Button(action: { onTrailingTap?() }) {
                        Image(systemName: icon)
                            .font(.system(size: 16))
                            .foregroundColor(hasError ? Colors.persistentNegative : Colors.iconSecondary)
                    }
                    .disabled(onTrailingTap == nil)
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 44)
            .background(isDisabled ? Colors.backgroundDeemphasized : Colors.backgroundCard)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.small)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.small))
            .disabled(isDisabled)
            
            // Help/Error text
            if let error = errorText {
                Label(error, systemImage: "exclamationmark.circle.fill")
                    .typography(Typography.meta3)
                    .foregroundColor(Colors.persistentNegative)
            } else if let help = helpText {
                Text(help)
                    .typography(Typography.meta3)
                    .foregroundColor(Colors.textSecondary)
            }
        }
        .opacity(isDisabled ? 0.6 : 1)
    }
    
    private var borderColor: Color {
        if hasError { return Colors.persistentNegative }
        if isFocused { return Colors.textInputActiveInnerBorder }
        return Colors.textInputInactiveInnerBorder
    }
}

// MARK: - PDSPasswordField

/// Password field with toggle visibility button
struct PDSPasswordField: View {
    let label: String?
    let placeholder: String
    @Binding var text: String
    let helpText: String?
    let errorText: String?
    let submitLabel: SubmitLabel
    let onSubmit: (() -> Void)?
    
    @State private var isSecure: Bool = true
    @FocusState private var isFocused: Bool
    
    private var hasError: Bool { errorText != nil }
    
    init(
        label: String? = nil,
        placeholder: String = "Enter password",
        text: Binding<String>,
        helpText: String? = nil,
        errorText: String? = nil,
        submitLabel: SubmitLabel = .done,
        onSubmit: (() -> Void)? = nil
    ) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.helpText = helpText
        self.errorText = errorText
        self.submitLabel = submitLabel
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Label
            if let label = label {
                Text(label)
                    .typography(Typography.body3)
                    .foregroundColor(hasError ? Colors.persistentNegative : Colors.textPrimary)
            }
            
            // Input field
            HStack(spacing: 8) {
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
                .typography(Typography.body2)
                .submitLabel(submitLabel)
                .onSubmit { onSubmit?() }
                .focused($isFocused)
                
                Button(action: { isSecure.toggle() }) {
                    Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Colors.iconSecondary)
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 44)
            .background(Colors.backgroundCard)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.small)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.small))
            
            // Help/Error text
            if let error = errorText {
                Label(error, systemImage: "exclamationmark.circle.fill")
                    .typography(Typography.meta3)
                    .foregroundColor(Colors.persistentNegative)
            } else if let help = helpText {
                Text(help)
                    .typography(Typography.meta3)
                    .foregroundColor(Colors.textSecondary)
            }
        }
    }
    
    private var borderColor: Color {
        if hasError { return Colors.persistentNegative }
        if isFocused { return Colors.textInputActiveInnerBorder }
        return Colors.textInputInactiveInnerBorder
    }
}

// MARK: - PDSSearchField

/// Search input with clear button
struct PDSSearchField: View {
    let placeholder: String
    @Binding var text: String
    let submitLabel: SubmitLabel
    let onSubmit: (() -> Void)?
    
    init(
        placeholder: String = "Search",
        text: Binding<String>,
        submitLabel: SubmitLabel = .search,
        onSubmit: (() -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.submitLabel = submitLabel
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16))
                .foregroundColor(Colors.iconSecondary)
            
            TextField(placeholder, text: $text)
                .typography(Typography.body2)
                .submitLabel(submitLabel)
                .onSubmit { onSubmit?() }
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Colors.iconSecondary)
                }
            }
        }
        .padding(.horizontal, 12)
        .frame(height: 40)
        .background(Colors.textInputBarBackground)
        .clipShape(Capsule())
    }
}

// MARK: - View Modifier for TextField Styling

struct PDSTextFieldStyle: ViewModifier {
    let hasError: Bool
    @FocusState.Binding var isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 12)
            .frame(height: 44)
            .background(Colors.backgroundCard)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.small)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.small))
    }
    
    private var borderColor: Color {
        if hasError { return Colors.persistentNegative }
        if isFocused { return Colors.textInputActiveInnerBorder }
        return Colors.textInputInactiveInnerBorder
    }
}

extension View {
    func pdsTextFieldStyle(hasError: Bool = false, isFocused: FocusState<Bool>.Binding) -> some View {
        modifier(PDSTextFieldStyle(hasError: hasError, isFocused: isFocused))
    }
}

// MARK: - Preview

#Preview("PDSTextField") {
    ScrollView {
        VStack(spacing: 24) {
            PDSTextField(
                label: "Email",
                placeholder: "you@example.com",
                text: .constant("")
            )
            
            PDSPasswordField(
                label: "Password",
                placeholder: "Enter password",
                text: .constant("secret123"),
                helpText: "Must be at least 8 characters"
            )
            
            PDSTextField(
                label: "Username",
                placeholder: "Enter username",
                text: .constant("john"),
                errorText: "Username is already taken"
            )
            
            PDSTextField(
                placeholder: "Search",
                text: .constant(""),
                leadingIcon: "magnifyingglass"
            )
            
            PDSTextField(
                label: "Disabled",
                placeholder: "Can't edit this",
                text: .constant("Disabled value"),
                isDisabled: true
            )
            
            PDSSearchField(text: .constant("SwiftUI"))
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}
