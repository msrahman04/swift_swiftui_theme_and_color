# Color Assets Implementation Guide for iOS

This guide explains how to set up the Rich Black color theme in your iOS project using Asset Catalogs and Swift.

## Step 1: Create Color Assets in Asset Catalog

1. Open your Xcode project
2. Navigate to Assets.xcassets (or create a new catalog specifically for colors)
3. Right-click in the navigator area and select "New Color Set"
4. Create the following color sets with the specified values:

## Step 2: Configure Each Color Set for Light and Dark Mode

For each color set created above, do the following:

1. Select the color set in Assets.xcassets
2. In the Attributes Inspector (right panel), set "Appearances" to "Any, Dark"
3. This will split the color editor into two sections - one for light mode, one for dark mode
4. Set the appropriate values for each mode according to the table below:

| Color Set Name    | Light Mode (RGB)           | Dark Mode (RGB)            |
|-------------------|----------------------------|----------------------------|
| RichBlack         | #010101 (1, 1, 1)          | #010101 (1, 1, 1)          |
| NeutralBackground | #F8F8F8 (248, 248, 248)    | #121212 (18, 18, 18)       |
| NeutralSurface    | #FFFFFF (255, 255, 255)    | #1E1E1E (30, 30, 30)       |
| NeutralBorder     | #E0E0E0 (224, 224, 224)    | #333333 (51, 51, 51)       |
| NeutralDisabled   | #CCCCCC (204, 204, 204)    | #404040 (64, 64, 64)       |
| TextPrimary       | #1A1A1A (26, 26, 26)       | #F8F8F8 (248, 248, 248)    |
| TextSecondary     | #505050 (80, 80, 80)       | #BBBBBB (187, 187, 187)    |
| TextTertiary      | #909090 (144, 144, 144)    | #808080 (128, 128, 128)    |
| TextOnPrimary     | #FFFFFF (255, 255, 255)    | #FFFFFF (255, 255, 255)    |
| AccentBlue        | #6A8CAF (106, 140, 175)    | #8BADCF (139, 173, 207)    |
| AccentBurgundy    | #8C2F39 (140, 47, 57)      | #B04450 (176, 68, 80)      |
| Success           | #4A8F69 (74, 143, 105)     | #5BAF79 (91, 175, 121)     |
| Warning           | #D4A72C (212, 167, 44)     | #E4B73C (228, 183, 60)     |
| Error             | #B54141 (181, 65, 65)      | #D55151 (213, 81, 81)      |
| Info              | #4A7D9F (74, 125, 159)     | #5A8DAF (90, 141, 175)     |

## Step 3: Sample Usage in SwiftUI

```swift
import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.neutralBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Primary branding element
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.richBlack)
                        .frame(height: 80)
                        .overlay(
                            Text("Rich Black Brand")
                                .foregroundColor(.textOnPrimary)
                                .font(.headline)
                        )
                    
                    // Content area
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Main Content Area")
                            .font(.title2)
                            .foregroundColor(.textPrimary)
                        
                        Text("Secondary text example with your brand theme.")
                            .foregroundColor(.textSecondary)
                        
                        Divider()
                            .background(Color.neutralBorder)
                        
                        // Sample buttons
                        HStack(spacing: 12) {
                            Button(action: {}) {
                                Text("Primary")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.richBlack)
                                    .foregroundColor(.textOnPrimary)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {}) {
                                Text("Accent")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.accentBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {}) {
                                Text("Secondary")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.textSecondary)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.neutralBorder, lineWidth: 1)
                                    )
                            }
                        }
                        
                        // Status examples
                        HStack(spacing: 20) {
                            statusItem(color: .success, text: "Success")
                            statusItem(color: .warning, text: "Warning")
                            statusItem(color: .error, text: "Error")
                            statusItem(color: .info, text: "Info")
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color.neutralSurface)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 5)
                    
                    Text("Current mode: \(colorScheme == .dark ? "Dark" : "Light")")
                        .font(.caption)
                        .foregroundColor(.textTertiary)
                }
                .padding()
            }
            .navigationTitle("Color Theme")
        }
    }
    
    func statusItem(color: Color, text: String) -> some View {
        HStack(spacing: 6) {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            
            Text(text)
                .font(.caption)
                .foregroundColor(.textSecondary)
        }
    }
}
```

## Step 4: Sample Usage in UIKit

```swift
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Background
        view.backgroundColor = .neutralBackground
        
        // Header view
        let headerView = UIView()
        headerView.backgroundColor = .richBlack
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerLabel = UILabel()
        headerLabel.text = "Rich Black Brand"
        headerLabel.textColor = .textOnPrimary
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(headerLabel)
        view.addSubview(headerView)
        
        // Content panel
        let contentPanel = UIView()
        contentPanel.backgroundColor = .neutralSurface
        contentPanel.layer.cornerRadius = 12
        contentPanel.layer.shadowColor = UIColor.black.cgColor
        contentPanel.layer.shadowOpacity = 0.05
        contentPanel.layer.shadowRadius = 5
        contentPanel.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentPanel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentPanel)
        
        // Add sample content elements
        let titleLabel = UILabel()
        titleLabel.text = "Main Content Area"
        titleLabel.textColor = .textPrimary
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Secondary text example with your brand theme."
        subtitleLabel.textColor = .textSecondary
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentPanel.addSubview(titleLabel)
        contentPanel.addSubview(subtitleLabel)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            contentPanel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            contentPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentPanel.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: contentPanel.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentPanel.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentPanel.trailingAnchor, constant: -20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentPanel.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentPanel.trailingAnchor, constant: -20),
        ])
    }
}
```

## Step 5: Implementing the Theme Manager

In your AppDelegate.swift:

```swift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Apply the theme globally
        ThemeManager.shared.applyTheme()
        return true
    }
}
```
