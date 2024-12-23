//
//  WeatherCardView.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct WeatherCardView: View {
    
    var icon: String
    var value: String
    
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text(value)
                .font(Font.custom("Montserrat-Medium", size: 14))
                .foregroundColor(.black)
                .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 0))
        }
        .frame(maxWidth: .infinity)
        .padding(.init(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3)
    }
}
