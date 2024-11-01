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
            
            MapView()
                .frame(height: 300)//width 는 해당 뷰에 맞게 자동 조절
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                Text("Tutle Rock")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack{
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                //지역 설명을 위한 구분선 추가
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
                
            }
            .padding()
            
            Spacer()
            
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
