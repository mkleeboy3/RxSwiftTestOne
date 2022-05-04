//
//  Inject.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/03.
//

import Foundation

@propertyWrapper
class Inject<T> {
    
    let wrappedValue: T
    
    init() {
        self.wrappedValue = AppDelegate.container.resolve(T.self)!
    }
}
