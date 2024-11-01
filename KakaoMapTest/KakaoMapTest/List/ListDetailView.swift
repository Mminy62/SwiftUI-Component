//
//  ListDetailView.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/12/24.
//

import SwiftUI

struct ListDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                
                Image(systemName: "star.fill")
                
                Text("병명")
                Text("이름")
            }
            .navigationTitle("상세 화면")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()  // 커스텀 버튼으로 뒤로 가기 기능
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")  // 커스텀 아이콘
                            Text("Back")  // 백 버튼 텍스트
                        }
                        .foregroundStyle(.black)
                    }
                    
                    
                }
            }
        }
    }
}
#Preview {
    ListDetailView()
}
