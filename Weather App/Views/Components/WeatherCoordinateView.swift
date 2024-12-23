//
//  WeatherCoordinateView.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct WeatherCoordinateView: View {
    
    var latitude: Double
    var longitude: Double
    
    var body: some View {
        let latitudeInString = decimalToString(value: latitude)
        let longitudeInString =  decimalToString(value: longitude)
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Coordinate")
                .font(Font.custom("Montserrat-Semibold", size: 20))
                .foregroundColor(.black)
                .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 0))
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Latitude at \(latitudeInString)")
                    .font(Font.custom("Montserrat-Regular", size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Longitude at \(longitudeInString)")
                    .font(Font.custom("Montserrat-Regular", size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3)
        }
        .padding(.init(top: 8, leading: 16, bottom: 24, trailing: 16))
    }
}
