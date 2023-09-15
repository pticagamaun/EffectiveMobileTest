//
//  NetworkingManagerProtocol.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCategories(completion: @escaping (Result<Categories, APIError>) -> Void)
    func getDishes(completion: @escaping (Result<Dishes, APIError>) -> Void)
}
