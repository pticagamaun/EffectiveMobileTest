//
//  Categories.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import Foundation

struct Categories: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let id: Int
    let name: String
    let imageURL: URL
}
