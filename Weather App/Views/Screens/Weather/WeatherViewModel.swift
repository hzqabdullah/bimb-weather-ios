//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var countries: [Country]?
    @Published var weather: Weather?
    @Published var country: String?
    @Published var city: String?
    @Published var error: String?
    @Published var isLoading = false
    
    private let weatherService: WeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.weatherService = WeatherServiceImpl()
        self.countries = getCountries()
        self.country = getCountryName()
        self.city = getCityName()
        
        getWeatherForCity(city: self.city ?? "")
    }
    
    func getWeatherForCity(city: String, country: String? = nil) {
        if city.isEmpty {
            error = "Please enter a city"
            return
        }
        
        isLoading = true
        error = nil
        
        weatherService.getWeatherForCity(city: city)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case.failure(let error):
                    print(error.localizedDescription)
                    self.error = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { weather in
                print(weather)
                self.weather = weather
                self.error = nil
                
                if country != nil {
                    UserDefaults.standard.set(country, forKey: Constants.SELECTED_COUNTRY)
                    UserDefaults.standard.set(city, forKey: Constants.SELECTED_CITY)
                    
                    self.city = weather.cityName
                    self.country = country
                } else {
                    self.city = weather.cityName
                    self.country = self.getCountryNameForCountries(countryCode: weather.weatherSystemInfo.country)
                }
            })
            .store(in: &cancellables)
    }
    
    private func getCountries() -> [Country] {
        let data: CountriesData = Bundle.main.decode(file: "countries.json")
        return data.countries
    }
    
    private func getCountryName() -> String {
        return UserDefaults.standard.string(forKey: Constants.SELECTED_COUNTRY) ?? ""
    }
    
    private func getCityName() -> String {
        return UserDefaults.standard.string(forKey: Constants.SELECTED_CITY) ?? ""
    }
    
    private func getCountryNameForCountries(countryCode: String) -> String {
        var countryName = ""
        let countries = getCountries()
        
        if (!countries.isEmpty) {
            countryName = countries.first(where: { $0.code == countryCode })?.name ?? ""
        }
        return countryName
    }
}
