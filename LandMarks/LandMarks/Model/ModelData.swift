//
//  ModelData.swift
//  LandMarks
//
//  Created by 이민영 on 11/1/24.
//

import Foundation

// MARK: ModelData 클래스에 Observable을 넣어서, 데이터가 변경되면 감지
// 앱 데이터 저장소
@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
}

// MARK: 앱 메인 번들에서 지정된 이름의 JSON 데이터를 가져오는 load 메서드
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

