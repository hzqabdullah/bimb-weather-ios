//
//  WeatherLocalized.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct WeatherLocalizedView: View {
    
    var sunrise: String
    var sunset: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Localized")
                .font(Font.custom("Montserrat-Semibold", size: 20))
                .foregroundColor(.black)
                .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 0))
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center, spacing: 12) {
                    Image("ic_sunrise")
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                    Text("Sunrise at \(sunrise)")
                        .font(Font.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                HStack(alignment: .center, spacing: 12) {
                    Image("ic_sunset")
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                    Text("Sunset at \(sunset)")
                        .font(Font.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
            .frame(maxWidth: .infinity)
            .padding(.init(top: 12, leading: 8, bottom: 12, trailing: 8))
            .background(.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3)
        }
        .padding()
    }
}
