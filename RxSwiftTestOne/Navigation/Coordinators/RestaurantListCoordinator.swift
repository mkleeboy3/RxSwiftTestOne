//
//  RestaurantListCoordinator.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/03.
//

import UIKit

class RestaurantListCoordinator: BaseCoordinator {
    let route: Route
    
    init(route: Route) {
        self.route = route
    }
    
    override func start() {
        let storyboard = UIStoryboard.init(
            name: self.route.storyboardName,
            bundle: nil
        )
        let viewController = storyboard.instantiateViewController(
            identifier: self.route.storyboardID,
            creator: { coder in
                RestaurantListViewController(coder: coder)
            }
        )
        
        self.navigationController = UINavigationController(rootViewController: viewController)
    }
}
