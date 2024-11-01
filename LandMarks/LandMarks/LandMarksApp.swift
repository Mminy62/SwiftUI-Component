//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by 이민영 on 11/1/24.
//

import SwiftUI

@main
struct LandMarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
