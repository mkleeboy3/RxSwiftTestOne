//
//  RestaruantRepository.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/02.
//

import Foundation
import RxSwift

final class RestaurantRepository {
    @Inject private var httpService: HttpService
    
    public func getRestaurants() -> Observable<[Restaurant]> {
        let restaurants: Observable<[Restaurant]> = self.httpService.get()
        return restaurants
    }
}
