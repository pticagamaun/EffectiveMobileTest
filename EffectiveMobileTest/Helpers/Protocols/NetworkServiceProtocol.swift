//
//  NetworkServiceProtocol.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getCategories(completion: @escaping (Result<[Category], APIError>) -> Void)
    func getDishes(completion: @escaping (Result<[Dish], APIError>) -> Void)
}
