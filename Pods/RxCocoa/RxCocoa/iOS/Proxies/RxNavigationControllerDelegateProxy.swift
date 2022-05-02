//
//  RxNavigationControllerDelegateProxy.swift
//  RxCocoa
//
//  Created by Diogo on 13/04/17.
//  Copyright © 2017 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

    import UIKit
    import RxSwift

    extension UINavigationController: HasDelegate {
        public typealias Delegate = UINavigationControllerDelegate
    }

    /// For more information take a look at `DelegateProxyType`.
    open class RxNavigationControllerDelegateProxy
        : DelegateProxy<UINavigationController, UINavigationControllerDelegate>
        , DelegateProxyType {

        /// Typed parent object.
        public weak private(set) var viewController: UINavigationController?

        /// - parameter navigationController: Parent object for delegate proxy.
        public init(viewController: ParentObject) {
            self.viewController = viewController
            super.init(parentObject: viewController, delegateProxy: RxNavigationControllerDelegateProxy.self)
        }

        // Register known implementations
        public static func registerKnownImplementations() {
            self.register { RxNavigationControllerDelegateProxy(viewController: $0) }
        }
    }

    extension RxNavigationControllerDelegateProxy: UINavigationControllerDelegate {}
#endif
