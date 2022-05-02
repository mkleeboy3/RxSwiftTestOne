//
//  RestaurantListViewMode.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/02.
//

import RxSwift

final class RestaurantListViewModel {
    var restaurants: Observable<[RestaurantListTableCellViewModel]>
    
    init() {
        self.restaurants = Observable<[RestaurantListTableCellViewModel]>.empty()
        
        getRestaurants()
    }
    
    func getRestaurants() {
        self.restaurants = RestaurantRepository.getRestaurants().map({ restaurants in
            return restaurants.map { restaurant in
                return RestaurantListTableCellViewModel(restaurantData: restaurant)
            }
        })
    }
}

final class RestaurantListTableCellViewModel {
    var displayText: String
    
    init(restaurantData: Restaurant) {
        self.displayText = restaurantData.name + " - " + restaurantData.cuisine.rawValue
    }
}
