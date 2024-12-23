//
//  CountriesData.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

struct CountriesData: Decodable {
    
    let countries: [Country]
    
    enum CodingKeys: String, CodingKey {
        case countries = "data"
    }
}
