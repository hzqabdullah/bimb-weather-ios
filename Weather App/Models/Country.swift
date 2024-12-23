//
//  Country.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct Country: Decodable, Identifiable {
    
    let id: UUID = UUID()
    let name: String
    let code: String
    let cities: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "country"
        case code = "iso2"
        case cities = "cities"
    }
}
