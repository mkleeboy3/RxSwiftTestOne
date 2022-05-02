//
//  AppCoordinator.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit

class AppCoordinator {
    static let shared = AppCoordinator()
    
    private let initialAppPath = AppRoutes.restaurantList
    
    public let navigationController = UINavigationController()
    
    private init() {}
    
    func configureInitialInterface(window: UIWindow) {
        // Set root view controller to view controller
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        navigateTo(
            appPath: AppRoutes.restaurantList,
            animated: false
        )
    }
    
    func navigateTo(appPath: AppRoute, animated: Bool = true) {
        let navigation = AppBindings.getAppNavigation(appRoute: appPath)
        navigationController.pushViewController(
            navigation.viewController,
            animated: animated
        )
    }
    
    func pop(To appRoute: AppRoute? = nil, animated: Bool = true) {
        if (appRoute != nil) {
            let navigation = AppBindings.getAppNavigation(appRoute: appRoute!)
            navigationController.popToViewController(
                navigation.viewController,
                animated: animated
            )
            return
        }
        
        navigationController.popViewController(animated: animated)
    }
}
