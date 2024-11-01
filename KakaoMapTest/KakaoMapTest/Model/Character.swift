//
//  Character.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/12/24.
//

import Foundation

struct Character: Hashable, Codable {
    let id: Int
    let name: String
    let imageURL: String
    let coordinate: Coordinate
}

// MARK: - Coordinate
struct Coordinate: Hashable, Codable {
    let latitude, longitude: Double
}
