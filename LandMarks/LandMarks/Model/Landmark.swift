//
//  Landmark.swift
//  LandMarks
//
//  Created by 이민영 on 11/1/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    // json 자료형 변환
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
