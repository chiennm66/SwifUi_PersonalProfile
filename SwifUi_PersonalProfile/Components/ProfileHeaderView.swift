//
//  ProfileHeaderView.swift
//  SwifUi_PersonalProfile
//
//  Created by Tony Pham on 29/3/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var name: String
    var avatar: String
    
    var body: some View {
        VStack {
            Image(avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.blue, lineWidth: 1)
                )
                .shadow(radius: 5)
            
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 8)
        }
        .padding()
    }
}

#Preview {
    ProfileHeaderView(name: "Tony Pham", avatar: "avatar")
}


