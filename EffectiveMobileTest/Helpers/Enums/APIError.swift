//
//  APIError.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import Foundation

enum APIError: Error {
    case wrongURL
    case getError
    case dataWasNil
    case cantDecode
}
