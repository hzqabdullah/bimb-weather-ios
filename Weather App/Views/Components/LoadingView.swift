//
//  LoadingView.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct LoadingView: View {
    
    var message: String
    var isLoading: Bool
    
    var body: some View {
        ZStack {
            if isLoading {
                Color
                    .black
                    .opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
            }
            
            if isLoading {
                VStack {
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color(hex: "#FAB03C")))
                            .scaleEffect(2)
                        
                        Text(message)
                            .font(.custom("Montserrat-Semibold", size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 16)
                    }
                    .padding(.init(top: 36, leading: 24, bottom: 36, trailing: 24))
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                }
            }
        }
    }
}

#Preview {
    LoadingView(
        message: "Searching...",
        isLoading: true
    )
}
