//
//  WeatherMainInfo.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct WeatherMainInfo: Decodable {
    
    let currentTemperature: Double
    let humidity: Int
    let pressureAtSeaLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case humidity = "humidity"
        case pressureAtSeaLevel = "sea_level"
    }
}
