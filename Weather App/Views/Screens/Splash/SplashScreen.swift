//
//  SplashScreen.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var destination: String? = nil
    
    private var isOpenWeatherScreen: Bool {
        return UserDefaults.standard.string(forKey: Constants.SELECTED_CITY) != nil
    }
    
    var body: some View {
        ZStack {
            if isActive {
                if destination == "WeatherScreen" {
                    WeatherScreen()
                } else {
                    CountryScreen()
                }
            } else {
                VStack(spacing: 32) {
                    Image("ic_logo")
                        .resizable()
                        .frame(width: 170, height: 170)
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color(hex: "#FAB03C")))
                        .scaleEffect(2)
                }
            }
        }
        .background(.white)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.destination = isOpenWeatherScreen ? "WeatherScreen" : "CountryScreen"
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
