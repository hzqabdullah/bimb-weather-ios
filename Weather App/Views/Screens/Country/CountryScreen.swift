//
//  CountryScreen.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct CountryScreen: View {
    
    @StateObject private var viewModel = CountryViewModel()
    @State private var selectedCountry: Country? = nil
    @State private var selectedCity: String? = nil
    @State private var isShowCountrySheet: Bool = false
    
    var body: some View {
        let icon = String(format: Constants.FLAG_ICON_URL, selectedCountry?.code ?? "")
        let title = selectedCountry == nil && selectedCity == nil ? "Select Country and City" : "\(selectedCity ?? ""), \(selectedCountry?.name ?? "")"
        let buttonColor = selectedCity != nil ? "#FAB03C" : "#C4C4C4"
        
        ZStack {
            if viewModel.navigateToWeatherScreen {
                WeatherScreen()
            } else {
                ZStack {
                    VStack(alignment: .center, spacing: 16) {
                        Image("ic_location")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding(.top, 100)
                        
                        Text("Choose Your Location")
                            .font(Font.custom("Montserrat-Bold", size: 20))
                            .foregroundColor(.black)
                            .padding(.init(top: 24, leading: 0, bottom: 0, trailing: 0))
                        
                        Text("Please select your country and city to help us for \ngive you a better experience")
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        HStack(alignment: .center, spacing: 8) {
                            if (selectedCountry != nil) {
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
                            }
                            
                            Text(title)
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .foregroundColor(.black)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image("ic_arrow_right")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3)
                        .padding(.init(top: 40, leading: 24, bottom: 0, trailing: 24))
                        .onTapGesture {
                            isShowCountrySheet = true
                        }
                        
                        Button(action: {
                            if selectedCity != nil && selectedCountry != nil {
                                viewModel.searchWeatherForCity(
                                    city: selectedCity ?? "",
                                    country: selectedCountry!
                                )
                            }
                        }) {
                            Text("Continue")
                                .font(Font.custom("Montserrat-Semibold", size: 16))
                                .foregroundColor(.white)
                                .padding(16)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "\(buttonColor)")))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.init(top: 16, leading: 24, bottom: 16, trailing: 24))
                        .disabled(selectedCity == nil)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                    if viewModel.isLoading {
                        LoadingView(
                            message: "Searching...",
                            isLoading: viewModel.isLoading
                        )
                    }
                }
            }
        }
        .background(.white)
        .sheet(isPresented: $isShowCountrySheet) {
            CountrySheet(
                countries: viewModel.countries ?? [],
                selectedCountry: $selectedCountry,
                selectedCity: $selectedCity,
                isShowCountrySheet: $isShowCountrySheet,
                onClickConfirm: {}
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
    CountryScreen()
}
