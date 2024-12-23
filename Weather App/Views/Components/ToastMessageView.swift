//
//  ToastMessage.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import SwiftUI

struct ToastMessageView: View {
    
    var message: String = "Oops! Something went wrong."
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color(hex: "#DD5147"))
            
            Text(message)
                .font(Font.custom("Montserrat-Semibold", size: 16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(hex: "#333A49"))
        .cornerRadius(12)
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    ToastMessageView()
}
