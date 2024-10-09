//
//  ExploreView.swift
//  AirbnbTutorial
//
//  Created by 이민영 on 10/9/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) { // 화면에 나타난 아이템만 이미지를 랜더링(VStack은 모든아이템을 다하나?)
                    ForEach(0 ... 10, id: \.self) { listing in
                        ListingItemView()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ExploreView()
}
