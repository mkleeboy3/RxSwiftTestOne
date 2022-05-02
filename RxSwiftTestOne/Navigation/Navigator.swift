//
//  AppCoordinator.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit

final class Navigator {
    static let shared = Navigator()
    
    private let initialAppPath = Routes.restaurantList
    
    public let navigationController = UINavigationController()
    
    private init() {}
    
    func configureInitialInterface(window: UIWindow) {
        // Set root view controller to view controller
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        navigateTo(
            appPath: Routes.restaurantList,
            animated: false
        )
    }
    
    func navigateTo(appPath: Route, animated: Bool = true) {
        let navigation = Bindings.getAppNavigation(appRoute: appPath)
        navigationController.pushViewController(
            navigation.viewController,
            animated: animated
        )
    }
    
    func pop(To appRoute: Route? = nil, animated: Bool = true) {
        if (appRoute != nil) {
            let navigation = Bindings.getAppNavigation(appRoute: appRoute!)
            navigationController.popToViewController(
                navigation.viewController,
                animated: animated
            )
            return
        }
        
        navigationController.popViewController(animated: animated)
    }
}
