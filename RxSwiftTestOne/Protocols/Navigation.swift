//
//  Navigation.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/29.
//

import UIKit

protocol Navigation {
    var appRoute: AppRoute { get }
    var storyboard: UIStoryboard { get }
    var navigationController: UINavigationController { get }
    var viewController: UIViewController { get }
}
