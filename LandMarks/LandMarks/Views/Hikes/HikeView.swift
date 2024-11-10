//
//  HikeView.swift
//  LandMarks
//
//  Created by 이민영 on 11/10/24.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
//        AnyTransition.slide
        AnyTransition
            .asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .scale.combined(with: .opacity)
                    )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                    
                Button {
                    withAnimation {
                        showDetail.toggle()
                    }

                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1) // 아이콘 사이즈 커지는
                        .padding()
                
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
//                    .transition(.slide)
                    .transition(.moveAndFade)
            }
            
        }
    }
}

#Preview {
    let modelData = ModelData()
    return HikeView(hike: modelData.hikes[0])
            .environment(modelData)
}
