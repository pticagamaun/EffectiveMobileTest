//
//  Date+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 19.09.2023.
//

import Foundation

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU") // Русская локализация
        formatter.dateFormat = "d MMMM, yyyy" // Например: "12 августа, 2023"
        return formatter.string(from: self)
    }
}
