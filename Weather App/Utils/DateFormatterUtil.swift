//
//  DateFormatterUtil.swift
//  Weather App
//
//  Created by Haziq Abdullah on 23/12/2024.
//

import Foundation

func unitToDateString(
    unixTimestamp: Int64,
    timezone: Int64 = 0,
    pattern: String = "hh:mm:ssa",
    locale: Locale = Locale.current
) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = pattern
    formatter.locale = locale
    formatter.timeZone = TimeZone(secondsFromGMT: Int(timezone)) ?? TimeZone.current
    
    let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    return formatter.string(from: date)
}
