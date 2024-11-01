//
//  ContentView.swift
//  LandMarks
//
//  Created by 이민영 on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            LandmarkList()
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
