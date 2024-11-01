//
//  DataView.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/12/24.
//

import SwiftUI
import Nuke
import NukeUI

struct DataView: View {
    @StateObject var viewModel = CViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if viewModel.characters.isEmpty {
                        ProgressView()
                    } else {
                        ForEach(viewModel.characters, id: \.self) { character in
                            NavigationLink(value: character.id) {
                                ListItemView(character: character)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self, destination: { id in
//                Text("This is \(id)") // id에 따른 url로 이미지 받기 
                ListDetailView()
                    .navigationBarBackButtonHidden()
            })
        }
        .onAppear {
            viewModel.fetchData() // 뷰가 나타날 때 데이터를 불러옴
        }
    }
    
}

#Preview {
    DataView()
}
