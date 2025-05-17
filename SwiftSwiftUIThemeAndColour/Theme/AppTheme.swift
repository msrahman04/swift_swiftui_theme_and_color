//
//  AppTheme.swift
//  PustiAI
//
//  Created by Shahinur Rahman on 17/5/25.
//
import SwiftUI

// Define available themes
enum ThemeType: String, CaseIterable {
    case light, dark, system
}

// Theme storage structure
struct AppTheme {
    // MARK: - Colors
    
    // Base colors
    let mainBackground: Color
    let surfaceBackground: Color
    let borderColor: Color
    let disabledColor: Color
    
    // Text colors
    let textPrimaryColor: Color
    let textSecondaryColor: Color
    let textTertiaryColor: Color
    let textOnPrimaryColor: Color
    
    // Brand colors
    let brandColor: Color
    
    // Accent colors
    let primaryAccentColor: Color
    let secondaryAccentColor: Color
    
    // Functional colors
    let successColor: Color
    let warningColor: Color
    let errorColor: Color
    let infoColor: Color
    
    // MARK: - Typography
    let titleFont: Font
    let headingFont: Font
    let subheadingFont: Font
    let bodyFont: Font
    let captionFont: Font
    
    // MARK: - Spacing
    let spacing: CGFloat
    let smallSpacing: CGFloat
    let mediumSpacing: CGFloat
    let largeSpacing: CGFloat
    
    // MARK: - Corner Radius
    let cornerRadiusSmall: CGFloat
    let cornerRadiusMedium: CGFloat
    let cornerRadiusLarge: CGFloat
    
    // MARK: - Shadows
    let shadowRadius: CGFloat
    let shadowOpacity: Double
    let shadowOffset: CGSize
    let shadowColor: Color
    
    // MARK: - Predefined Themes
    static let light = AppTheme(
        
        //MARK: I we use want to use without color extention the whe have to create an color Asset with name "PrimaryBackgroundColor"
        //and if we call it like this  "Color.primaryBackground" its working fine but we want to handle using extension
        // Base colors
        mainBackground: Color.primaryBackground,
        surfaceBackground: Color.AppColors.primarySurfaceColor,
        borderColor: Color.AppColors.primaryBorderColor,
        disabledColor: Color.AppColors.disabledColor,
        
        // Text colors
        textPrimaryColor: Color.AppColors.textPrimaryColor,
        textSecondaryColor: Color.AppColors.textSecondaryColor,
        textTertiaryColor: Color.AppColors.textTertiaryColor,
        textOnPrimaryColor: Color.AppColors.textOnPrimaryColor,
        
        // Brand colors
        brandColor: Color.AppColors.richBlackBrandColor,
        
        // Accent colors
        primaryAccentColor: Color.AppColors.accentBlueColor,
        secondaryAccentColor: Color.AppColors.accentBurgundyColor,
        
        // Functional colors
        successColor: Color.AppColors.successColor,
        warningColor: Color.AppColors.warningColor,
        errorColor: Color.AppColors.errorColor,
        infoColor: Color.AppColors.infoColor,
        
        // Typography
        titleFont: .system(.largeTitle, design: .default, weight: .bold),
        headingFont: .system(.title, design: .default, weight: .semibold),
        subheadingFont: .system(.headline, design: .default, weight: .medium),
        bodyFont: .system(.body),
        captionFont: .system(.caption),
        
        // Spacing
        spacing: 8,
        smallSpacing: 4,
        mediumSpacing: 16,
        largeSpacing: 24,
        
        // Corner Radius
        cornerRadiusSmall: 4,
        cornerRadiusMedium: 8,
        cornerRadiusLarge: 12,
        
        // Shadows
        shadowRadius: 4,
        shadowOpacity: 0.1,
        shadowOffset: CGSize(width: 0, height: 2),
        shadowColor: Color.black.opacity(0.2)
    )
    
    static let dark = AppTheme(
        // Base colors - using same color extensions, but these would be configured
        // with different colors in Assets.xcassets for dark mode
        mainBackground: Color.primaryBackground,
        surfaceBackground: Color.AppColors.primarySurfaceColor,
        borderColor: Color.AppColors.primaryBorderColor,
        disabledColor: Color.AppColors.disabledColor,
        
        // Text colors
        textPrimaryColor: Color.AppColors.textPrimaryColor,
        textSecondaryColor: Color.AppColors.textSecondaryColor,
        textTertiaryColor: Color.AppColors.textTertiaryColor,
        textOnPrimaryColor: Color.AppColors.textOnPrimaryColor,
        
        // Brand colors
        brandColor: Color.AppColors.richBlackBrandColor,
        
        // Accent colors
        primaryAccentColor: Color.AppColors.accentBlueColor,
        secondaryAccentColor: Color.AppColors.accentBurgundyColor,
        
        // Functional colors
        successColor: Color.AppColors.successColor,
        warningColor: Color.AppColors.warningColor,
        errorColor: Color.AppColors.errorColor,
        infoColor: Color.AppColors.infoColor,
        
       
        
        // Typography - may want different fonts for dark mode
        titleFont: .system(.largeTitle, design: .default, weight: .bold),
        headingFont: .system(.title, design: .default, weight: .semibold),
        subheadingFont: .system(.headline, design: .default, weight: .medium),
        bodyFont: .system(.body),
        captionFont: .system(.caption),
        
        // Spacing - typically same in dark mode
        spacing: 8,
        smallSpacing: 4,
        mediumSpacing: 16,
        largeSpacing: 24,
        
        // Corner Radius - typically same in dark mode
        cornerRadiusSmall: 4,
        cornerRadiusMedium: 8,
        cornerRadiusLarge: 12,
        
        // Shadows - often more pronounced in dark mode
        shadowRadius: 4,
        shadowOpacity: 0.15,
        shadowOffset: CGSize(width: 0, height: 2),
        shadowColor: Color.black.opacity(0.3)
    )
}

// MARK: - Theme Environment Key
struct ThemeKey: EnvironmentKey {
    static let defaultValue: AppTheme = .light
}

// Add theme to the environment values
extension EnvironmentValues {
    var appTheme: AppTheme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

// Add convenience modifiers
extension View {
    func appTheme(_ theme: AppTheme) -> some View {
        environment(\.appTheme, theme)
    }
}



// MARK: - View Style Extensions

// Button Style
struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.appTheme) var theme
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, theme.spacing)
            .padding(.horizontal, theme.mediumSpacing)
            .background(isEnabled ? theme.primaryAccentColor : theme.disabledColor)
            .foregroundColor(theme.textOnPrimaryColor)
            .cornerRadius(theme.cornerRadiusMedium)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.appTheme) var theme
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, theme.spacing)
            .padding(.horizontal, theme.mediumSpacing)
            .background(theme.surfaceBackground)
            .foregroundColor(isEnabled ? theme.primaryAccentColor : theme.disabledColor)
            .overlay(
                RoundedRectangle(cornerRadius: theme.cornerRadiusMedium)
                    .stroke(isEnabled ? theme.primaryAccentColor : theme.disabledColor, lineWidth: 1)
            )
            .cornerRadius(theme.cornerRadiusMedium)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// Text Field Style
struct ThemedTextFieldStyle: TextFieldStyle {
    @Environment(\.appTheme) var theme
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(theme.mediumSpacing)
            .background(theme.surfaceBackground)
            .cornerRadius(theme.cornerRadiusMedium)
            .foregroundColor(theme.textPrimaryColor)
            .overlay(
                RoundedRectangle(cornerRadius: theme.cornerRadiusMedium)
                    .stroke(theme.borderColor, lineWidth: 1)
            )
    }
}

// Extension for using these styles
extension View {
    func themedPrimaryButton() -> some View {
        buttonStyle(PrimaryButtonStyle())
    }
    
    func themedSecondaryButton() -> some View {
        buttonStyle(SecondaryButtonStyle())
    }
    
    func themedTextField() -> some View {
        textFieldStyle(ThemedTextFieldStyle())
    }
    
    // Shadow modifier for cards
    func themedCardShadow() -> some View {
        modifier(CardShadowModifier())
    }
}

// Card Shadow Modifier
struct CardShadowModifier: ViewModifier {
    @Environment(\.appTheme) var theme
    
    func body(content: Content) -> some View {
        content
            .background(theme.surfaceBackground)
            .cornerRadius(theme.cornerRadiusMedium)
            .shadow(
                color: theme.shadowColor,
                radius: theme.shadowRadius,
                x: theme.shadowOffset.width,
                y: theme.shadowOffset.height
            )
    }
}
