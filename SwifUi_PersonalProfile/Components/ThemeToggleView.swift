//
//  DarkModeToggle.swift
//  SwifUi_PersonalProfile
//
//  Created by Tony Pham on 29/3/25.
//

import SwiftUI

struct DarkModeToggle: View {
    @Binding var user : User
    var body: some View {
        Toggle(isOn: $user.isDarkMode) {
            HStack {
                Image(systemName: user.isDarkMode ? "moon.fill" : "sun.max.fill")
                Text(user.isDarkMode ? "Chế độ tối" : "Chế độ sáng")
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    DarkModeToggle(user: .user)
}
