//
//  ListItemView.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/12/24.
//

import SwiftUI
import NukeUI

struct ListItemView: View {
    @State var character: Character
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            HStack {
                LazyImage(url: URL(string: character.imageURL)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60) // 원하는 크기로 설정
                    } else if state.error != nil {
                        ProgressView()
                    } else {
                        ProgressView()
                    }
                }
                Text(character.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding()
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.horizontal)
            }
            .foregroundStyle(.black)
            
            Divider()
        }
    }
}

#Preview {
    ListItemView(character: Character(id: 1, name: "이상해씨", imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", coordinate: Coordinate(latitude: 37.26579, longitude: 127.00009)))
}
