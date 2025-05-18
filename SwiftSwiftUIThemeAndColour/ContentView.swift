//
//  ContentView.swift
//  SwiftSwiftUIThemeAndColour
//
//  Created by Shahinur Rahman on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.appTheme) var theme
    
    var body: some View {
        NavigationView {
            VStack(spacing: theme.spacing) {
                Text("Welcome")
                    .font(theme.titleFont)
                    .foregroundColor(theme.textPrimaryColor)
                
                Text("This is a themed app")
                    .font(theme.bodyFont)
                    .foregroundColor(theme.textSecondaryColor)
                
                Button("Primary Action") {
                    // Action
                }
                .themedPrimaryButton()
                
                Button("Secondary Action") {
                    // Action
                }
                .themedSecondaryButton()
                
                // Theme selector
                Picker("Theme", selection: $themeManager.themeType) {
                    ForEach(ThemeType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }
            .padding(theme.largeSpacing)
            .background(theme.mainBackground)
            .navigationTitle("PustiAI")
        }
    }
}

struct YourView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ThemeManager())
    }
}
