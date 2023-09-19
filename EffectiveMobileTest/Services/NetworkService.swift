//
//  NetworkService.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    
    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    internal func getCategories(completion: @escaping (Result<[Category], APIError>) -> Void) {
        guard let url = URL(string: APIUrl.categoriesURL) else {
            completion(.failure(APIError.wrongURL))
            return
        }
        let request = urlSession.dataTask(with: url) {[jsonDecoder] data, response, error in
            switch(data, error) {
            case let (.some(data), nil):
                do {
                    let response = try jsonDecoder.decode(Categories.self, from: data)
                    completion(.success(response.categories))
                } catch {
                    completion(.failure(APIError.getError))
                }
            case (.none, .some(_)):
                completion(.failure(APIError.cantDecode))
            default:
                completion(.failure(APIError.wrongURL))
            }
        }
        request.resume()
    }
    
    internal func getDishes(completion: @escaping (Result<[Dish], APIError>) -> Void) {
        guard let url = URL(string: APIUrl.dishesURL) else {
            completion(.failure(APIError.wrongURL))
            return
        }
        let request = urlSession.dataTask(with: url) {[jsonDecoder] data, response, error in
            switch(data, error) {
            case let (.some(data), nil):
                do {
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let response = try jsonDecoder.decode(Dishes.self, from: data)
                    completion(.success(response.dishes))
                } catch {
                    completion(.failure(APIError.getError))
                }
            case (.none, .some(_)):
                completion(.failure(APIError.cantDecode))
            default:
                completion(.failure(APIError.wrongURL))
            }
        }
        request.resume()
    }
}
