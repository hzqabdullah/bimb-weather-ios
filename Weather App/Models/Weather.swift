//
//  Weather.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct Weather: Decodable {
    
    let cityName: String
    let coordinate: Coordinate
    let weatherMainInfo: WeatherMainInfo
    let weatherStatus: [WeatherStatus]
    let windStatus: WindStatus
    let timeZone: Int64
    let weatherSystemInfo: WeatherSystemInfo
    
    enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case coordinate = "coord"
        case weatherMainInfo = "main"
        case weatherStatus = "weather"
        case windStatus = "wind"
        case timeZone = "timezone"
        case weatherSystemInfo = "sys"
    }
}
