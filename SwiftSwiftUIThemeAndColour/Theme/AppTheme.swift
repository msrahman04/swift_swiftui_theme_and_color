//
//  AppTheme.swift
//  SwiftSwiftUIThemeAndColour
//
//  Created by Shahinur Rahman on 11/5/25.
//

import SwiftUI

// Define available themes
enum ThemeType: String, CaseIterable {
    case light, dark, system, custom
}

// Theme storage structure
struct AppTheme {
    // MARK: - Colors
    let background: Color
    let secondaryBackground: Color
    let accent: Color
    let secondaryAccent: Color
    let primaryText: Color
    let secondaryText: Color
    
    // MARK: - Typography
    let titleFont: Font
    let headingFont: Font
    let bodyFont: Font
    let captionFont: Font
    
    // MARK: - Spacing
    let standardPadding: CGFloat
    let smallPadding: CGFloat
    let largePadding: CGFloat
    
    // MARK: - Corner Radius
    let cornerRadius: CGFloat
    let buttonCornerRadius: CGFloat
    
    // MARK: - Predefined Themes
    static let light = AppTheme(
        background: .primaryBackground,
        secondaryBackground: .secondaryBackground,
        accent: .accentPrimary,
        secondaryAccent: .accentSecondary,
        primaryText: .textPrimary,
        secondaryText: .textSecondary,
        
        titleFont: .system(.largeTitle, design: .rounded, weight: .bold),
        headingFont: .system(.title, design: .rounded, weight: .semibold),
        bodyFont: .system(.body),
        captionFont: .system(.caption),
        
        standardPadding: 16,
        smallPadding: 8,
        largePadding: 24,
        
        cornerRadius: 12,
        buttonCornerRadius: 8
    )
    
    // You can define other themes similarly
    static let dark = AppTheme(/* dark theme values */)
    static let custom = AppTheme(/* custom theme values */)
}
