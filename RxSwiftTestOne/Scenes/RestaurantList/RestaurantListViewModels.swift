//
//  RestaurantListViewMode.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/02.
//

import RxSwift

final class RestaurantListViewModel {
    private var restaurantRepository: RestaurantRepository = Injector.find()
    
    var restaurants: Observable<[Restaurant]>
    
    init() {
        self.restaurants = Observable<[Restaurant]>.empty()
        
        getRestaurants()
    }
    
    func getRestaurants() {
        self.restaurants = restaurantRepository.getRestaurants()
    }
}

struct RestaurantListTableCellViewModel {
    var displayText: String
    
    init(restaurantData: Restaurant) {
        self.displayText = restaurantData.name + " - " + restaurantData.cuisine.rawValue
    }
}
