//
//  Dishes.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import Foundation

struct Dishes: Decodable {
    let dishes: [Dish]
}

struct Dish: Decodable {
    let id: Int
    let name: String
    let price, weight: Int
    let description: String
    let imageURL: URL
    let tegs: [Teg]
}

enum Teg: String, Decodable {
    case всеМеню = "Все меню"
    case сРисом = "С рисом"
    case сРыбой = "С рыбой"
    case салаты = "Салаты"
}
