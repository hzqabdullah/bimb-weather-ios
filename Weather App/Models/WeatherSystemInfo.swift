//
//  WeatherSystemInfo.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct WeatherSystemInfo: Decodable {
    
    let country: String
    let sunrise: Int64
    let sunset: Int64
}
