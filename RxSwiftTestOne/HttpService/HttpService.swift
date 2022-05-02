//
//  HttpService.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/02.
//

import Foundation
import RxSwift
import RxAlamofire

final class HttpService<T: Decodable> {
    private let baseUrl: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init() {
        self.baseUrl = "https://mocki.io/v1/124843d1-a200-44bc-9ecb-37484ce5ba48"
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func get(path: String? = nil) -> Observable<T> {
        let urlPath = "\(baseUrl)" + ((path != nil) ? "/\(path!)" : "")
        return RxAlamofire.data(.get, urlPath)
            .observe(on: self.scheduler)
            .map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
}
