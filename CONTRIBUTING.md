# Contributing to Prism

Thanks for your interest. Prism is a design system prototype, so contributions are held to the same bar as the existing library.

## Building

Clone, open `Prism/Prism.xcodeproj` in Xcode 26 or later, select the Prism scheme, and run. There is no configuration step.

## The bar for components

Every component, new or changed, should ship with:

- **Tokens only.** Colors, type, spacing, radii, shadows, and motion come from `Prism/Resources`. No hardcoded values.
- **Both appearances.** Verify in light and dark. The gallery's appearance switcher makes this quick.
- **Dynamic Type.** Text uses `Typography` styles, which scale automatically. Check layouts at accessibility sizes.
- **VoiceOver.** Icon-only controls get labels, composite views combine into sensible elements, decorative visuals are hidden, selected states carry traits.
- **Reduce Motion.** Looping or decorative animation must honor the setting.
- **A gallery entry.** Add or update the component's detail view so every variant and state is visible in the app.

## Conventions

Match the existing code: one component per file named `PDS<Name>.swift`, a header comment with a usage example, MARK sections, and a `#Preview`. Sample content belongs in `Prism/Data`.

## Conduct

Be kind and constructive. Harassment or personal attacks are not welcome, and maintainers may close or remove contributions and contributors that cross that line.
