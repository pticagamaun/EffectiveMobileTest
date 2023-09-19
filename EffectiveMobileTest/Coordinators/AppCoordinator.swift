//
//  AppCoordinator.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 14.09.2023.
//

import UIKit

private protocol AppCoordinatorProtocol: AnyObject, CoordinatorProtocol {
    var rootViewController: UIViewController { get }
    func showMainFlow()
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = .init()
        configNavController()
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
    }
    
    internal var finishDelegate: CoordinatorFinishDelegate? = nil
    internal var rootViewController: UIViewController {
        return self.navigationController
    }
    internal var navigationController: UINavigationController
    internal var childCoordinators = [CoordinatorProtocol]()
    internal var type: CoordinatorType { .app }
    private let window: UIWindow
    
    internal func start() {
        showMainFlow()
    }
    
    internal func showMainFlow() {
        print("TabBar")
        let tabCoordinator = TabBarCoordinator(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
    
    private func configNavController() {
        navigationController.isNavigationBarHidden = true
        navigationController.isToolbarHidden = true
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            showMainFlow()
        default:
            break
        }
    }
}
