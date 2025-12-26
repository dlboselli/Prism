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
    let onTrailingTap: (() -> Void)?
    
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
        onTrailingTap: (() -> Void)? = nil
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
        self.onTrailingTap = onTrailingTap
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

// MARK: - PDSSearchField

/// Search input with clear button
struct PDSSearchField: View {
    let placeholder: String
    @Binding var text: String
    let onSubmit: (() -> Void)?
    
    init(
        placeholder: String = "Search",
        text: Binding<String>,
        onSubmit: (() -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16))
                .foregroundColor(Colors.iconSecondary)
            
            TextField(placeholder, text: $text)
                .typography(Typography.body2)
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
            
            PDSTextField(
                label: "Password",
                placeholder: "Enter password",
                text: .constant(""),
                helpText: "Must be at least 8 characters",
                trailingIcon: "eye.slash.fill",
                isSecure: true,
                onTrailingTap: {}
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
