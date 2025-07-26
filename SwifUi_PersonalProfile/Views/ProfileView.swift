//
//  ProfileView.swift
//  SwifUi_PersonalProfile
//
//

import SwiftUI

struct ProfileView: View {
    @State private var user = User(
        name: "Nguyễn Văn A",
        email: "nguyenvana@example.com",
        avatar: "avatar",
        interests: ["Lập trình", "Âm nhạc", "Đọc sách"],
        profileCompletion: 0.75,
        achievements: [
            Achievement(icon: "star.fill", title: "Người mới", description: "Đã tham gia được 1 tháng"),
            Achievement(icon: "flame.fill", title: "Siêu năng suất", description: "Hoàn thành 5 dự án liên tiếp")
        ]
    )
    
    @State private var isEditMode = false
    @State private var showingLogoutAlert = false
    
    var body: some View {
        //ScroolView
        ScrollView {
            VStack(spacing: 20) {
                // Profile Header
                ProfileHeaderView(name: user.name, avatar: user.avatar)
                
                // Profile Completion
                VStack(alignment: .leading) {
                    Text("Hoàn thành hồ sơ")
                        .font(.headline)
                    
                    ProgressBarView(value: $user.profileCompletion)
                }
                .padding(.horizontal)
                
                // Information Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Thông tin cá nhân")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    HStack {
                        Text("Họ tên:")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(user.name)
                            .fontWeight(.medium)
                    }
                    Divider()
                    
                    HStack {
                        Text("Email:")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(user.email)
                            .fontWeight(.medium)
                    }
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sở thích:")
                            .foregroundColor(.secondary)
                        
                        HStack {
                            ForEach(user.interests, id: \.self) { interest in
                                Text(interest)
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                .padding(.horizontal)
                
                // Achievements Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Thành tựu")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ForEach(user.achievements, id: \.title) { achievement in
                        AchievementItemView(achievement: achievement)
                            .padding(.horizontal)
                    }
                }
                
                // Action Buttons
                HStack(spacing: 20) {
                    Button(action: {
                        isEditMode.toggle()
                    }) {
                        HStack {
                            Image(systemName: "pencil")
                            Text("Chỉnh sửa")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        showingLogoutAlert = true
                    }) {
                        HStack {
                            Image(systemName: "arrow.right.square")
                            Text("Đăng xuất")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding()
                
                ThemeToggleView(isDarkMode: $user.isDarkMode)
                    .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .preferredColorScheme(user.isDarkMode ? .dark : .light)
        .alert(isPresented: $showingLogoutAlert) {
            Alert(
                title: Text("Đăng xuất"),
                message: Text("Bạn có chắc chắn muốn đăng xuất?"),
                primaryButton: .destructive(Text("Đăng xuất")) {
                    // Xử lý đăng xuất
                },
                secondaryButton: .cancel()
            )
        }
        .sheet(isPresented: $isEditMode) {
            Text("Màn hình chỉnh sửa profile")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    ProfileView()
}
