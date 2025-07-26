//
//  DarkModeToggle.swift
//  SwifUi_PersonalProfile
//
//  Created by Tony Pham on 29/3/25.
//

import SwiftUI

struct ThemeToggleView: View {
    @Binding var isDarkMode: Bool
    var backgroundColor: Color = Color(.secondarySystemBackground)
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkMode) {
                HStack(spacing: 12) {
                    Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                        .font(.system(size: 20))
                        .foregroundColor(isDarkMode ? .yellow : .orange)
                    
                    Text(isDarkMode ? "Chế độ tối" : "Chế độ sáng")
                        .font(.headline)
                }
            }
            .padding()
            .background(backgroundColor)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
        .animation(.spring(), value: isDarkMode)
    }
}

// MARK: - Preview
#Preview {
    Group {
        // Light mode preview
        ThemeToggleView(isDarkMode: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Light Mode")
        
        // Dark mode preview
        ThemeToggleView(isDarkMode: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
    }
}
