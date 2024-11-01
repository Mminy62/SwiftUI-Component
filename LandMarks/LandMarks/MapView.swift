//
//  MapView.swift
//  LandMarks
//
//  Created by 이민영 on 11/1/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        // Map View가 따로 있음
        Map(position: .constant(.region(region)))
    }
    
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}


#Preview {
    MapView(coordinate: landmarks[0].locationCoordinate)
}
