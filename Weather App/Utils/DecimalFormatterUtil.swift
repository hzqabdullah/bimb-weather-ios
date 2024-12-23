//
//  DecimalFormatterUtil.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

func decimalToString(value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 10
    
    return formatter.string(from: NSNumber(value: value)) ?? ""
}
