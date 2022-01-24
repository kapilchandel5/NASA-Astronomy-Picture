//
//  DateUtils.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//

import Foundation

let dateFormat = "ddMMyyyy"

func shortStringValueInYYYYMMDDAsDate(_ date: Date?) -> String? {
    guard let dateValue = date else { return nil }
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = dateFormat
    return formatter.string(from: dateValue)
}

func shortStringValueInYYYYMMDDAsDayBeforeDate(_ date: Date?) -> String? {
    guard let dateValue = date else { return nil }
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = dateFormat
    let lastTime: TimeInterval = -(24*60*60)
    let lastDate = dateValue.addingTimeInterval(lastTime)
    return formatter.string(from: lastDate)
}
