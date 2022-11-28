//
//  ModelData.swift
//  Landmarks
//
//  Created by Nayeong Kim on 2022/11/22.
//

import Foundation
import Combine

// swiftUI는 관찰 가능한 객체를 구독하고 데이터가 변경될 때 새로 고쳐야 하는 모든 보기를 업데이트함.
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // hike는 Published가 없는 이유 : 구독하여 변경시킬 데이터가 아니기 때문에.
    var hikes: [Hike] = load("hikeData.json")
    
    var features: [Landmark] {
        landmarks.filter{$0.isFeatured}
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
