//
//  AppBindings.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit

final class Bindings {
    static func getAppNavigation(appRoute: Route) -> Navigation {
        switch (appRoute.route) {
            case Routes.restaurantList.route:
                return ResaurantListBindings()
            default:
                fatalError()
        }
    }
    
    // Register bindings
    static private func ResaurantListBindings() -> Navigation {
        let rootNavigationController = Navigator.shared.navigationController
        return RestaurantListNavigation(
            appRoute: Routes.restaurantList,
            navigationController: rootNavigationController
        )
    }
    
    
}
