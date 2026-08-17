import SwiftUI

// MARK: - PDSTextArea

/// Styled multi-line text input using native TextEditor
struct PDSTextArea: View {
    let label: String?
    let placeholder: String
    @Binding var text: String
    let helpText: String?
    let errorText: String?
    let maxLength: Int?
    let minHeight: CGFloat
    
    @FocusState private var isFocused: Bool
    
    private var hasError: Bool { errorText != nil }
    private var characterCount: Int { text.count }
    private var isOverLimit: Bool {
        guard let max = maxLength else { return false }
        return characterCount > max
    }
    
    init(
        label: String? = nil,
        placeholder: String = "",
        text: Binding<String>,
        helpText: String? = nil,
        errorText: String? = nil,
        maxLength: Int? = nil,
        minHeight: CGFloat = 100
    ) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.helpText = helpText
        self.errorText = errorText
        self.maxLength = maxLength
        self.minHeight = minHeight
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Label with character count
            if label != nil || maxLength != nil {
                HStack {
                    if let label = label {
                        Text(label)
                            .typography(Typography.body3)
                            .foregroundColor(hasError || isOverLimit ? Colors.fixedNegative : Colors.textPrimary)
                    }
                    
                    Spacer()
                    
                    if let max = maxLength {
                        Text("\(characterCount)/\(max)")
                            .typography(Typography.caption1)
                            .foregroundColor(isOverLimit ? Colors.fixedNegative : Colors.textSecondary)
                    }
                }
            }
            
            // Text editor with placeholder
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .typography(Typography.body2)
                        .foregroundColor(Colors.textPlaceholder)
                        .padding(.horizontal, 4)
                        .padding(.top, 8)
                }
                
                TextEditor(text: $text)
                    .typography(Typography.body2)
                    .foregroundColor(Colors.textPrimary)
                    .focused($isFocused)
                    .scrollContentBackground(.hidden)
                    .frame(minHeight: minHeight)
            }
            .padding(8)
            .background(Colors.backgroundCard)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.small)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.small))
            
            // Help/Error text
            if let error = errorText {
                Label(error, systemImage: "exclamationmark.circle.fill")
                    .typography(Typography.caption1)
                    .foregroundColor(Colors.fixedNegative)
            } else if let help = helpText {
                Text(help)
                    .typography(Typography.caption1)
                    .foregroundColor(Colors.textSecondary)
            }
        }
    }
    
    private var borderColor: Color {
        if hasError || isOverLimit { return Colors.fixedNegative }
        if isFocused { return Colors.textInputActiveInnerBorder }
        return Colors.textInputInactiveInnerBorder
    }
}

// MARK: - PDSCommentInput

/// Simple inline comment input
struct PDSCommentInput: View {
    let placeholder: String
    @Binding var text: String
    let avatarInitials: String?
    let onSubmit: (() -> Void)?
    
    init(
        placeholder: String = "Write a comment...",
        text: Binding<String>,
        avatarInitials: String? = nil,
        onSubmit: (() -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.avatarInitials = avatarInitials
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            if let initials = avatarInitials {
                PDSAvatar(initials: initials, size: 36)
            }
            
            HStack(spacing: 8) {
                TextField(placeholder, text: $text, axis: .vertical)
                    .font(Typography.Fonts.body3)
                    .foregroundColor(Colors.textPrimary)
                    .lineLimit(1...5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onSubmit {
                        onSubmit?()
                    }
                
                if !text.isEmpty {
                    Button {
                        onSubmit?()
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.white, Colors.fixedAccent)
                    }
                    .accessibilityLabel("Send")
                }
            }
            .padding(.leading, 12)
            .padding(.trailing, 8)
            .frame(minHeight: 36)
            .background(Colors.textInputBarBackground)
            .clipShape(Capsule())
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
    }
}

// MARK: - PDSMessageInput

/// Chat-style message input
struct PDSMessageInput: View {
    @Binding var text: String
    let placeholder: String
    let onSend: () -> Void
    let leadingActions: [PDSInputAction]
    let trailingActions: [PDSInputAction]
    
    struct PDSInputAction: Identifiable {
        let id = UUID()
        let icon: String
        var label: String? = nil
        let action: () -> Void
    }
    
    init(
        text: Binding<String>,
        placeholder: String = "Message",
        onSend: @escaping () -> Void,
        leadingActions: [PDSInputAction] = [],
        trailingActions: [PDSInputAction] = []
    ) {
        self._text = text
        self.placeholder = placeholder
        self.onSend = onSend
        self.leadingActions = leadingActions
        self.trailingActions = trailingActions
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // Leading actions
            ForEach(leadingActions) { action in
                Button(action: action.action) {
                    Image(systemName: action.icon)
                        .font(.system(size: 28))
                        .foregroundStyle(.white, Colors.fixedAccent)
                }
                .accessibilityLabel(action.label ?? action.icon.split(separator: ".").first.map(String.init) ?? "Action")
            }
            
            // Input field
            HStack(alignment: .center, spacing: 8) {
                TextField(placeholder, text: $text, axis: .vertical)
                    .font(Typography.Fonts.body3)
                    .foregroundColor(Colors.textPrimary)
                    .lineLimit(1...5)
                
                // Trailing actions or send
                if text.isEmpty {
                    ForEach(trailingActions) { action in
                        Button(action: action.action) {
                            Image(systemName: action.icon)
                                .font(.system(size: 20))
                                .foregroundColor(Colors.iconSecondary)
                        }
                        .accessibilityLabel(action.label ?? action.icon.split(separator: ".").first.map(String.init) ?? "Action")
                    }
                } else {
                    Button(action: onSend) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.white, Colors.fixedAccent)
                    }
                    .accessibilityLabel("Send")
                }
            }
            .padding(.leading, 12)
            .padding(.trailing, 8)
            .frame(height: 36)
            .background(Colors.textInputBarBackground)
            .clipShape(Capsule())
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
    }
}

// MARK: - PDSComposeSheet

/// Full-screen compose sheet (use with .sheet modifier)
struct PDSComposeSheet: View {
    @Binding var text: String
    @Binding var isPresented: Bool
    let title: String
    let placeholder: String
    let authorName: String
    let avatarInitials: String?
    let submitLabel: String
    let onSubmit: () -> Void
    
    @FocusState private var isFocused: Bool
    
    init(
        text: Binding<String>,
        isPresented: Binding<Bool>,
        title: String = "New Post",
        placeholder: String = "What's on your mind?",
        authorName: String,
        avatarInitials: String? = nil,
        submitLabel: String = "Post",
        onSubmit: @escaping () -> Void
    ) {
        self._text = text
        self._isPresented = isPresented
        self.title = title
        self.placeholder = placeholder
        self.authorName = authorName
        self.avatarInitials = avatarInitials
        self.submitLabel = submitLabel
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    // Author
                    HStack(spacing: 12) {
                        PDSAvatar(initials: avatarInitials ?? String(authorName.prefix(2)), size: .medium)
                        
                        Text(authorName)
                            .typography(Typography.headline4Emphasized)
                            .foregroundColor(Colors.textPrimary)
                    }
                    
                    // Text input - use TextField with vertical axis for proper placeholder
                    TextField(placeholder, text: $text, axis: .vertical)
                        .font(Typography.Fonts.body1)
                        .lineSpacing(4)
                        .foregroundColor(Colors.textPrimary)
                        .focused($isFocused)
                        .frame(minHeight: 200, alignment: .topLeading)
                }
                .padding(16)
            }
            .background(Colors.backgroundSurface)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(submitLabel) {
                        onSubmit()
                        isPresented = false
                    }
                    .disabled(text.isEmpty)
                }
            }
            .onAppear { isFocused = true }
        }
    }
}

// MARK: - Preview

#Preview("Composers") {
    ScrollView {
        VStack(spacing: 32) {
            // Text Area
            VStack(alignment: .leading, spacing: 8) {
                Text("Text Area")
                    .typography(Typography.headline4Emphasized)
                
                PDSTextArea(
                    label: "Description",
                    placeholder: "Write something...",
                    text: .constant(""),
                    maxLength: 280
                )
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Comment Input
            VStack(alignment: .leading, spacing: 8) {
                Text("Comment Input")
                    .typography(Typography.headline4Emphasized)
                Text("Compact inline input with avatar")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                PDSCommentInput(
                    text: .constant(""),
                    avatarInitials: "JD"
                )
                .background(Colors.backgroundCard)
            }
            
            Rectangle()
                .fill(Colors.backgroundDivider)
                .frame(height: 1)
            
            // Message Input
            VStack(alignment: .leading, spacing: 8) {
                Text("Message Input")
                    .typography(Typography.headline4Emphasized)
                Text("Chat-style with action buttons")
                    .typography(Typography.body3)
                    .foregroundColor(Colors.textSecondary)
                
                PDSMessageInput(
                    text: .constant(""),
                    onSend: {},
                    leadingActions: [
                        .init(icon: "plus.circle.fill", action: {})
                    ],
                    trailingActions: [
                        .init(icon: "mic.fill", action: {})
                    ]
                )
                .background(Colors.backgroundCard)
            }
        }
        .padding(20)
    }
    .background(Colors.backgroundSurface)
}
