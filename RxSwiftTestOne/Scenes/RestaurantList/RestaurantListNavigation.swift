//
//  NavigationController.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/29.
//

import UIKit

class RestaurantListNavigation: AppNavigation {
    let appRoute: AppRoute
    let storyboard: UIStoryboard
    let navigationController: UINavigationController
    let viewController: UIViewController
    
    init(appRoute: AppRoute, navigationController: UINavigationController) {
        self.appRoute = appRoute
        self.storyboard = UIStoryboard.init(
            name: appRoute.storyboardName,
            bundle: nil
        )
        self.navigationController = navigationController
        self.viewController = storyboard.instantiateViewController(
            identifier: appRoute.storyboardID,
            creator: { coder in
                RestaurantListViewModel(
                    navigationController: navigationController,
                    coder: coder
                )
            }
        )
        
        self.configNavigation()
    }
    
    func configNavigation() {
        // Configure things related to navigation
    }
}
