//
//  WeatherInfoView.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct WeatherInfoView: View {
    
    var cityName: String = ""
    var country: String = ""
    var status: String = ""
    var temperature: String = ""
    var icon: String = ""
    
    var body: some View {
        VStack {
            Text(cityName)
                .font(Font.custom("Montserrat-Bold", size: 18))
                .foregroundColor(.black)
            
            Text(country)
                .font(Font.custom("Montserrat-Bold", size: 16))
                .foregroundColor(.black)
            
            AsyncImage(url: URL(string: icon)) { phase in
                switch phase {
                case .empty:
                    Color.clear
                case .success(let image):
                    image.resizable().scaledToFit()
                case .failure:
                    Color.clear
                @unknown default:
                    Color.clear
                }
            }
            .frame(width: 150, height: 150, alignment: .center)
            
            Text(status)
                .font(Font.custom("Montserrat-Regular", size: 16))
                .foregroundColor(.black)
            
            Text(temperature)
                .font(Font.custom("Montserrat-Medium", size: 48))
                .foregroundColor(.black)
                .padding(.init(top: 10, leading: 0, bottom: 32, trailing: 0))
        }
    }
}
