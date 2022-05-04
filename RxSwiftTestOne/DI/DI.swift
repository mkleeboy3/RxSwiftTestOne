//
//  DI.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/04.
//

import Swinject
import SwinjectAutoregistration

public let Injector = InjectorImpl.shared

final public class InjectorImpl {
    
    fileprivate static let shared: InjectorImpl = InjectorImpl()
    
    private let container: Container = Container()
    
    private init() {
        self.registerDependencies()
    }
    
    public func find<T>() -> T {
        return container.resolve(T.self)!
    }
}

// - MARK: Injector Register Dependencies
extension InjectorImpl {
    private func registerDependencies() {
        registerCoordinators()
        registerViewModels()
        registerServices()
        registerRepositories()
    }
    
    // Register coordinators
    private func registerCoordinators() {
        container.autoregister(RestaurantListCoordinator.self) { () in
            return RestaurantListCoordinator.init(route: Routes.restaurantList)
        }.inObjectScope(.container)
    }
    
    // Register view models
    private func registerViewModels() {
        container.autoregister(
            RestaurantListViewModel.self,
            initializer: RestaurantListViewModel.init
        ).inObjectScope(.container)
    }
    
    // Register services
    private func registerServices() {
        container
            .autoregister(HttpService.self, initializer: HttpService.init)
            .inObjectScope(.container)
    }
    
    private func registerRepositories() {
        container
            .autoregister(RestaurantRepository.self, initializer: RestaurantRepository.init)
            .inObjectScope(.container)
    }
}
