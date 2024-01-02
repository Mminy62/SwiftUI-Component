//
//  ContentView.swift
//  Hike
//
//  Created by 이민영 on 2024/01/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("image-1")
                .resizable()
                .scaledToFit()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
