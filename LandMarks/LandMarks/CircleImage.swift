//
//  CircleImage.swift
//  LandMarks
//
//  Created by 이민영 on 11/1/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtle_rock")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            
    }
}

#Preview {
    CircleImage()
}
