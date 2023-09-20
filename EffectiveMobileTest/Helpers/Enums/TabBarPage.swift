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
}

enum TabBarPage: TabBarPageProtocol {
    
    case categories
    case search
    case cart
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .categories
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
        case .categories:
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
        case .categories:
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
        case .categories:
            return UIImage(named: "main")
        case .search:
            return UIImage(named: "search")
        case .cart:
            return UIImage(named: "cart")
        case .profile:
            return UIImage(named: "profile")
        }
    }
}
