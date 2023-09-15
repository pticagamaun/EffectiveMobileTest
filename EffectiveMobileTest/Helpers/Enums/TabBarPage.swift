//
//  TabBarPage.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import UIKit

protocol TabBarPageProtocol {
    init?(index: Int)
    func pageTitleValue() -> String
    func pageOrderNumber() -> Int
    func icon() -> UIImage?
    func selectedIcon() -> UIImage?
}

enum TabBarPage: TabBarPageProtocol {
    
    case main
    case search
    case cart
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .search
        case 2:
            self = .cart
        case 3:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return "Main"
        case .search:
            return "Search"
        case .cart:
            return "Cart"
        case .profile:
            return "Profile"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .search:
            return 1
        case .cart:
            return 2
        case .profile:
            return 3
        }
    }
    
    func icon() -> UIImage? {
        switch self {
        case .main:
            return UIImage(systemName: "house")
        case .search:
            return UIImage(systemName: "magnifyingglass")
        case .cart:
            return UIImage(systemName: "cart")
        case .profile:
            return UIImage(systemName: "person")
        }
    }
    
    func selectedIcon() -> UIImage? {
        switch self {
        case .main:
            return UIImage(systemName: "house.fill")
        case .search:
            return UIImage(systemName: "magnifyingglass.fill")
        case .cart:
            return UIImage(systemName: "cart.fill")
        case .profile:
            return UIImage(systemName: "person.fill")
        }
    }
}
