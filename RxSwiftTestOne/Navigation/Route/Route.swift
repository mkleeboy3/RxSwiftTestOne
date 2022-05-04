//
//  AppPaths.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit

struct Route {
    var storyboardName: String // Storyboard file name
    var storyboardID: String // Storyboard ID
    var route: String // App navigation route path
    
    init(storyboardName: String, storyboardID: String, route: String) {
        self.storyboardName = storyboardName
        self.storyboardID = storyboardID
        self.route = route
    }
}

// Mapping of app route to app navigation
final class Routes {
    static let restaurantList: Route = Route(
        storyboardName: "RestaurantList",
        storyboardID: "RestaurantListHome",
        route: "Main"
    )
    
    static let restaurantDetail: Route = Route(
        storyboardName: "RestaurantDetail",
        storyboardID: "RestaurantDetail",
        route: "Detail"
    )
}
