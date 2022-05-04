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
            identifier: self.route.storyboardID
        )
        
        self.navigationController = UINavigationController(rootViewController: viewController)
    }
    
    public func navigateToDetail(args: RestaurantDetailViewArgs) {
        let route = Routes.restaurantDetail
        let storyboard = UIStoryboard.init(
            name: route.storyboardName,
            bundle: nil
        )
        let viewController = storyboard.instantiateViewController(
            identifier: route.storyboardID,
            creator: { coder in
                RestaurantDetailViewController(args: args, coder: coder)
            }
        )
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    public func pop() {
        self.navigationController.popViewController(animated: true)
    }
}
