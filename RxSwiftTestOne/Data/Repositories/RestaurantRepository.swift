//
//  RestaruantRepository.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/02.
//

import Foundation
import RxSwift

final class RestaurantRepository {
    static func getRestaurants() -> Observable<[Restaurant]> {
        // TODO: fix here to RxAlamofire
        let httpService = HttpService<[Restaurant]>()
        return httpService.get()
//        return Observable.create { observer in
//            let url = "https://mocki.io/v1/124843d1-a200-44bc-9ecb-37484ce5ba48"
//
//            let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
//                if let httpResponse = response as? HTTPURLResponse {
//                    if (httpResponse.statusCode == 200) {
//                        guard data != nil else {
//                            observer.onError(fatalError())
//                            return
//                        }
//
//                        do {
//                            let restaurants = try JSONDecoder().decode([Restaurant].self, from: data!)
//                            observer.onNext(restaurants)
//                        } catch {
//                            observer.onError(error)
//                        }
//                    } else {
//                        print("HTTP STATUS ERROR")
//                    }
//                }
//            }
//            task.resume()
//
//            return Disposables.create {
//                task.cancel()
//            }
//        }
    }
}
