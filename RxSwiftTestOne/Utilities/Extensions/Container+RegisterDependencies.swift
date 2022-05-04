//
//  Container+RegisterDependencies.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/03.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerDependencies() {
        registerCoordinators()
        registerViewModels()
        registerServices()
        registerRepositories()
    }
    
    // Register coordinators
    func registerCoordinators() {
        autoregister(RestaurantListCoordinator.self) { () in
            RestaurantListCoordinator.init(route: Routes.restaurantList)
        }
    }
    
    // Register view models
    func registerViewModels() {
        
    }
    
    // Register services
    func registerServices() {
        autoregister(HttpService.self, initializer: HttpService.init)
    }
    
    func registerRepositories() {
        autoregister(RestaurantRepository.self, initializer: RestaurantRepository.init)
    }
}

