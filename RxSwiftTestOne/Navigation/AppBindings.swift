//
//  AppBindings.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit

class AppBindings {
    static func getAppNavigation(appRoute: AppRoute) -> AppNavigation {
        switch (appRoute.route) {
            case AppRoutes.restaurantList.route:
                return ResaurantListBindings()
            default:
                fatalError()
        }
    }
    
    // Register bindings
    static private func ResaurantListBindings() -> AppNavigation {
        let rootNavigationController = AppCoordinator.shared.navigationController
        return RestaurantListNavigation(
            appRoute: AppRoutes.restaurantList,
            navigationController: rootNavigationController
        )
    }
    
    
}
