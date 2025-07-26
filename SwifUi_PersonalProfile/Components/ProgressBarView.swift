//
//  ProgressBarView.swift
//  SwifUi_PersonalProfile
//
//  Created by Tony Pham on 29/3/25.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var value: Double
    var color: Color = .blue
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 20)
                    .opacity(0.1)
                    .foregroundColor(color)
                    .cornerRadius(10)
                
                Rectangle()
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: 20)
                    .foregroundColor(color)
                    .cornerRadius(10)
                    .animation(.linear, value: value)
                
                Text("\(Int(value * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 8)
            }
        }
        .frame(height: 20)
    }
}

#Preview {
    ProgressBarView(value: .constant(0.5))
}
