//
//  MotionAnimationView.swift
//  Hike
//
//  Created by 이민영 on 2024/01/07.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    
    // MARK: - FUNCTIONS
    
    // MARK: - 1. random coordinate
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // 2. random Size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .position(x: randomCoordinate(), y:randomCoordinate())
            }
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    ZStack {
        Color.teal.ignoresSafeArea()
        
        MotionAnimationView()
    }
    
}
