//
//  AppCoordinator.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/03.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    @Inject var initialCoordinator: RestaurantListCoordinator
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        window.makeKeyAndVisible()
        self.configureInitialView()
    }
    
    private func configureInitialView() {
        removeChildCoordinators()
        
        self.start(coordinator: initialCoordinator)
        
        window.rootViewController = initialCoordinator.navigationController
    }
    
}
