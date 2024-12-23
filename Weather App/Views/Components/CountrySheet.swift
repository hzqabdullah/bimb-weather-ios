//
//  CountrySheet.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct CountrySheet: View {
    
    var countries: [Country]
    
    @Binding var selectedCountry: Country?
    @Binding var selectedCity: String?
    @Binding var isShowCountrySheet: Bool
    
    @FocusState private var isTextFieldFocused: Bool
    @State private var isCityState: Bool = false
    @State private var country: Country?
    @State private var cities: [String] = []
    @State private var searchText: String = ""
    
    var filteredCountries: [Country] {
        countries.filter { country in
            searchText.isEmpty || country.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var filteredCities: [String] {
        cities.filter { city in
            searchText.isEmpty || city.lowercased().contains(searchText.lowercased())
        }
    }
    
    var onClickConfirm: () -> Void
    
    var body: some View {
        let title = isCityState ? "Select City in \(country?.name ?? "")" : "Select Country"
        let hint = isCityState ? "Search for any cities in \(country?.name ?? "")" : "Search any countries"
        
        VStack(alignment: .center, spacing: 16) {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.5))
                .padding(.top, 8)
            
            HStack(alignment: .center, spacing: 16) {
                
                if isCityState {
                    Button(action: {
                        isTextFieldFocused = false
                        isCityState = false
                        country = nil
                        searchText = ""
                    }) {
                        Image("ic_arrow_left")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                
                Text(title)
                    .font(Font.custom("Montserrat-Bold", size: 20))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 16)
            
            TextField(hint, text: $searchText)
                .font(Font.custom("Montserrat-Regular", size: 14))
                .foregroundColor(.black)
                .padding()
                .focused($isTextFieldFocused)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#8D8D8D"), lineWidth: 1))
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    if !isCityState {
                        ForEach(filteredCountries) { item in
                            HStack(alignment: .center, spacing: 8) {
                                let icon = String(format: Constants.FLAG_ICON_URL, item.code)
                                
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
                                .frame(width: 24, height: 24)
                                
                                Text(item.name)
                                    .font(Font.custom("Montserrat-Regular", size: 14))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image("ic_chevron_right")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                            .padding(.vertical, 12)
                            .onTapGesture {
                                isTextFieldFocused = false
                                country = item
                                isCityState = true
                                searchText = ""
                                cities = item.cities
                                
                                withAnimation {
                                    selectedCountry = item
                                }
                            }
                        }
                    } else {
                        ForEach(filteredCities, id: \.self) { item in
                            HStack(alignment: .center, spacing: 8) {
                                
                                Text(item)
                                    .font(Font.custom("Montserrat-Regular", size: 14))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image("ic_chevron_right")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                            .padding(.vertical, 12)
                            .onTapGesture {
                                withAnimation {
                                    selectedCity = item
                                    isShowCountrySheet = false
                                    onClickConfirm()
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 16)
        .edgesIgnoringSafeArea(.bottom)
    }
}
