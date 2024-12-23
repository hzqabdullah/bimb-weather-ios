//
//  WeatherStatus.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct WeatherStatus: Decodable {
    
    let status: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case status = "main"
        case icon = "icon"
    }
}
