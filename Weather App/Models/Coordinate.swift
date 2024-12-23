//
//  Coordinate.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct Coordinate: Decodable {
    
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
