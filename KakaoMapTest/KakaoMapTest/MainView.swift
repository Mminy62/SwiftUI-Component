//
//  MainView.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/12/24.
//

import SwiftUI

struct MainView: View {
    @State private var isShowing = true
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .sheet(isPresented: $isShowing, onDismiss: {
                isShowing = true
            }) {
                DataView()
                    .padding()
                    .presentationDetents([.height(10), .medium, .large])
                    .presentationDragIndicator(.visible)
                
            }
    }
}

#Preview {
    MainView()
}
