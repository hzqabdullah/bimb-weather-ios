//
//  WeatherSearchView.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct WeatherSearchView: View {
    
    var onClickBack: () -> Void
    var onClickSearch: (String) -> Void
    
    @State private var city: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                onClickBack()
            }) {
                Image("ic_arrow_left")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            HStack {
                TextField("Search for any cities", text: $city)
                    .font(Font.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.black)
                    .padding()
                    .focused($isTextFieldFocused)
                
                Button(action: {
                    isTextFieldFocused = false
                    onClickSearch(city)
                }) {
                    Text("Search")
                        .font(Font.custom("Montserrat-Semibold", size: 12))
                        .foregroundColor(.white)
                        .padding(.init(top: 14, leading: 16, bottom: 14, trailing: 16))
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#FAB03C")))
                        .padding(.init(top: 2, leading: 4, bottom: 2, trailing: 4))
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#8D8D8D"), lineWidth: 1))
        }
        .padding()
    }
}
