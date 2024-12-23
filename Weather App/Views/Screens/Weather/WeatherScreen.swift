//
//  WeatherScreen.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct WeatherScreen: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @State private var selectedCountry: Country? = nil
    @State private var selectedCity: String? = nil
    @State private var isShowCountrySheet: Bool = false
    
    var body: some View {
        let cityName = viewModel.city ?? ""
        let country = viewModel.country ?? ""
        let icon = String(format: Constants.WEATHER_ICON_URL, viewModel.weather?.weatherStatus.first?.icon ?? "")
        let temperature = "\(Int(viewModel.weather?.weatherMainInfo.currentTemperature ?? 0.0))°"
        let status = viewModel.weather?.weatherStatus.first?.status ?? ""
        let humidity = "\(viewModel.weather?.weatherMainInfo.humidity ?? 0)%"
        let windSpeed = "\(String(format: "%.2f", viewModel.weather?.windStatus.windSpeed ?? 0.0)) m/s"
        let seaLevel = "\(viewModel.weather?.weatherMainInfo.pressureAtSeaLevel ?? 0) hPa"
        let timezone = viewModel.weather?.timeZone ?? 0
        let sunrise = unitToDateString(unixTimestamp: viewModel.weather?.weatherSystemInfo.sunrise ?? 0, timezone: timezone)
        let sunset = unitToDateString(unixTimestamp: viewModel.weather?.weatherSystemInfo.sunset ?? 0, timezone: timezone)
        let latitude = viewModel.weather?.coordinate.latitude ?? 0.0
        let longitude = viewModel.weather?.coordinate.longitude ?? 0.0
        
        ZStack {
            Color(hex: "#F1F1F1")
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            WeatherSearchModeView(
                                onClickSetLocation: {
                                    isShowCountrySheet = true
                                },
                                onClickSearch: { searchCity in
                                    viewModel.getWeatherForCity(city: searchCity)
                                }
                            )
                        }
                        
                        WeatherInfoView(
                            cityName: cityName,
                            country: country,
                            status: status,
                            temperature: temperature,
                            icon: icon
                        )
                    }
                    .background(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3)
                    
                    HStack(spacing: 16) {
                        WeatherCardView(icon: "ic_humidity", value: humidity)
                        
                        WeatherCardView(icon: "ic_wind", value: windSpeed)
                        
                        WeatherCardView(icon: "ic_sea_level", value: seaLevel)
                    }
                    .padding(.init(top: 24, leading: 16, bottom: 0, trailing: 16))
                    
                    WeatherLocalizedView(sunrise: sunrise, sunset: sunset)
                    
                    WeatherCoordinateView(latitude: latitude, longitude: longitude)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            
            if viewModel.isLoading {
                LoadingView(
                    message: "Searching...",
                    isLoading: viewModel.isLoading
                )
            }
        }
        .sheet(isPresented: $isShowCountrySheet) {
            CountrySheet(
                countries: viewModel.countries ?? [],
                selectedCountry: $selectedCountry,
                selectedCity: $selectedCity,
                isShowCountrySheet: $isShowCountrySheet,
                onClickConfirm: {
                    viewModel.getWeatherForCity(
                        city: selectedCity ?? "",
                        country: selectedCountry?.name
                    )
                }
            )
        }
        .overlay(alignment: .bottom) {
            if (viewModel.error != nil) {
                ToastMessageView(
                    message: viewModel.error ?? ""
                )
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            viewModel.error = nil
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WeatherScreen()
}
