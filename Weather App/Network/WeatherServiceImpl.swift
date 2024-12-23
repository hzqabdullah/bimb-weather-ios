//
//  WeatherServiceImpl.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation
import Combine

class WeatherServiceImpl: WeatherService {
    func getWeatherForCity(city: String) -> AnyPublisher<Weather, Error> {
        var urlComponents = URLComponents(string: Constants.WEATHER_URL)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "units", value: Constants.TEMPERATURE_UNIT),
            URLQueryItem(name: "appid", value: Constants.APP_ID)
        ]
        
        guard let url = urlComponents?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Weather.self, decoder: JSONDecoder())
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
