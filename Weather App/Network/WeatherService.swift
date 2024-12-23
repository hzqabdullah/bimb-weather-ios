//
//  WeatherService.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Combine

protocol WeatherService {
    func getWeatherForCity(city: String) -> AnyPublisher<Weather, Error>
}
