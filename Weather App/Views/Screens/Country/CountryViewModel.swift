//
//  CountryViewModel.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    
    @Published var countries: [Country]?
    @Published var error: String?
    @Published var isLoading = false
    @Published var navigateToWeatherScreen: Bool = false
    
    private let weatherService: WeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.weatherService = WeatherServiceImpl()
        self.countries = getCountries()
    }
    
    func searchWeatherForCity(city: String, country: Country) {
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
                self.error = nil
                
                UserDefaults.standard.set(country.name, forKey: Constants.SELECTED_COUNTRY)
                UserDefaults.standard.set(city, forKey: Constants.SELECTED_CITY)
                
                self.navigateToWeatherScreen = true
            })
            .store(in: &cancellables)
    }
    
    private func getCountries() -> [Country] {
        let data: CountriesData = Bundle.main.decode(file: "countries.json")
        return data.countries
    }
}
