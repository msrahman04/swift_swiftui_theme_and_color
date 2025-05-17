//
//  Colors.swift
//  SwiftSwiftUIThemeAndColour
//
//  Created by Shahinur Rahman on 10/5/25.
//

import SwiftUI

extension Color {
    
    enum AppColors{
        // MARK: - Brand Colors
        static let richBlackBrandColor = Color("RichBlackBrandColor")
        
        // MARK: - Neutral Colors
        static let primaryBackgroundColor = Color("PrimaryBackgroundColor")
        static let primarySurfaceColor = Color("PrimarySurfaceColor")
        static let primaryBorderColor = Color("ColorPrimaryBorder")
        static let disabledColor = Color("DisabledColor")
        
        // MARK: - Text Colors
        static let textPrimaryColor = Color("TextPrimaryColor")
        static let textSecondaryColor = Color("TextSecondaryColor")
        static let textTertiaryColor = Color("TextTertiaryColor")
        static let textOnPrimaryColor = Color("TextOnPrimaryColor")
        
        // MARK: - Accent Colors
        static let accentBlueColor = Color("AccentBlueColor")
        static let accentBurgundyColor = Color("AccentBurgundyColor")
        
        // MARK: - Functional Colors
        static let successColor = Color("SuccessColor")
        static let warningColor = Color("WarningColor")
        static let errorColor = Color("ErrorColor")
        static let infoColor = Color("InfoColor")
    }
}
