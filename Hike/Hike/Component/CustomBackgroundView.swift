//
//  CustomBackground.swift
//  Hike
//
//  Created by 이민영 on 2024/01/03.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        // MARK: - 3. Depth
        
        
        ZStack {
            // MARK: - 3. Depth
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2. Light
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
        
            
            // MARK: - 1. Surface
            LinearGradient(
                colors: [
                    Color.colorGreenLight,
                    Color.colorGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView().padding()
}
