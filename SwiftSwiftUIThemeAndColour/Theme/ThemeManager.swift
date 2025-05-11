//
//  ThemeManager.swift
//  SwiftSwiftUIThemeAndColour
//
//  Created by Shahinur Rahman on 11/5/25.
//

import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @Published var currentTheme: AppTheme
    @Published var themeType: ThemeType {
        didSet {
            UserDefaults.standard.set(themeType.rawValue, forKey: "selectedTheme")
            updateTheme()
        }
    }
    
    init() {
        // Load saved theme preference
        let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme") ?? ThemeType.system.rawValue
        self.themeType = ThemeType(rawValue: savedTheme) ?? .system
        self.currentTheme = AppTheme.light
        
        updateTheme()
    }
    
    func updateTheme() {
        switch themeType {
        case .light:
            currentTheme = AppTheme.light
        case .dark:
            currentTheme = AppTheme.dark
        case .system:
            // Use system setting
            let isDark = UITraitCollection.current.userInterfaceStyle == .dark
            currentTheme = isDark ? AppTheme.dark : AppTheme.light
        case .custom:
            currentTheme = AppTheme.custom
        }
    }
}
