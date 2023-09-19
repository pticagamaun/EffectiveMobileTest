//
//  TabBarCoordinator.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 15.09.2023.
//

import UIKit

private protocol TabBarCoordinatorProtocol: CoordinatorProtocol, AnyObject {
    var tabBarController: UITabBarController { get set }
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    internal var tabBarController: UITabBarController
    internal var navigationController: UINavigationController
    internal var childCoordinators = [CoordinatorProtocol]()
    internal var type: CoordinatorType { .tab }
    
    internal func start() {
        let pages: [TabBarPage] = [.main, .search, .cart, .profile]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    internal func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    internal func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage(index: index) else { return }
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    internal func currentPage() -> TabBarPage? {
        TabBarPage.init(index: tabBarController.selectedIndex)
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .white
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())
        switch page {
        case .main:
            let mainVC = MainViewController()
            mainVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .main:
                    self?.selectPage(.search)
                }
            }
            navController.pushViewController(mainVC, animated: true)
        case .search:
            let searchVC = UIViewController()
            searchVC.view.backgroundColor = .blue
            navController.pushViewController(searchVC, animated: true)
        case .cart:
            let cartVC = UIViewController()
            cartVC.view.backgroundColor = .yellow
            navController.pushViewController(cartVC, animated: true)
        case .profile:
            let profileVC = UIViewController()
            profileVC.view.backgroundColor = .green
            navController.pushViewController(profileVC, animated: true)
        }
        return navController
    }
}
