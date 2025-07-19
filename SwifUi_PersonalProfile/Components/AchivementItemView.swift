//
//  AchivementItemView.swift
//  SwifUi_PersonalProfile
//
//  Created by Tony Pham on 29/3/25.
//

import SwiftUI

struct AchievementItemView: View {
    var achievement: Achievement
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: achievement.icon)
                .font(.system(size: 30))
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(achievement.title)
                    .font(.headline)
                
                Text(achievement.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    
    var sampleAchievement = Achievement(icon: "star.fill", title: "First Achievement", description: "Complete your first task")
    
    AchievementItemView(achievement: sampleAchievement)
}
