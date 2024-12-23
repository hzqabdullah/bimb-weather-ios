//
//  WeatherSearchModeView.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct WeatherSearchModeView: View {
    
    var onClickSetLocation: () -> Void
    var onClickSearch: (String) -> Void
    
    @State private var isSearchMode: Bool = false
    
    var body: some View {
        if isSearchMode {
            WeatherSearchView(
                onClickBack: {
                    isSearchMode.toggle()
                },
                onClickSearch: { searchCity in
                    onClickSearch(searchCity)
                }
            )
        } else {
            HStack {
                Spacer()
                
                Button(action: {
                    onClickSetLocation()
                }) {
                    Image("ic_set_location")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(16)
                
                Button(action: {
                    isSearchMode.toggle()
                }) {
                    Image("ic_search")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.init(top: 0, leading: 24, bottom: 0, trailing: 24))
        }
    }
}
