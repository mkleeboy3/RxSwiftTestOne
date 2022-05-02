//
//  ViewControllerProtocol.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/02.
//

import UIKit
import RxSwift

protocol ViewController {
    var controller: UINavigationController { get }
    var disposeBag: DisposeBag { get }
    func bind()
}
