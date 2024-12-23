//
//  WindStatus.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct WindStatus: Decodable {
    
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case windSpeed = "speed"
    }
}
