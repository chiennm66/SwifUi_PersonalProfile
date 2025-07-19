//
//  Data Models.swift
//  SwifUi_PersonalProfile
//
//  Created by Tony Pham on 29/3/25.
//

import Foundation


struct User {
    var name: String
    var email: String
    var avatar: String
    var interests: [String]
    var profileCompletion: Double
    var achievements: [Achievement]
    var isDarkMode: Bool = false
}

struct Achievement {
    var icon: String
    var title: String
    var description: String
}
