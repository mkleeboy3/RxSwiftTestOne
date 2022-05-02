//
//  RestaurantListVC.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit

class RestaurantListViewModel: UIViewController, ViewModel {
    var controller: UINavigationController
    
    init?(navigationController: UINavigationController, coder: NSCoder) {
        self.controller = navigationController
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildUI()
    }
    
    // All UI rendering related functions must have the prefix `build` in front of the method
    private func buildUI() {
        buildNavigationBarUsingNavController()
    }
    
    private func buildNavigationBarUsingNavController() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        self.controller.navigationBar.standardAppearance = navBarAppearance
        self.controller.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
