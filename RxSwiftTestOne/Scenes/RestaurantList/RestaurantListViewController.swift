//
//  RestaurantListVC.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit
import RxSwift
import RxCocoa

class RestaurantListViewController: UIViewController, ViewController {
    var controller: UINavigationController
    var listViewModel: RestaurantListViewModel
    var disposeBag: DisposeBag
    
    @IBOutlet weak var restaurantListTableView: UITableView!
    
    init?(
        navigationController: UINavigationController,
        coder: NSCoder
    ) {
        self.controller = navigationController
        self.listViewModel = RestaurantListViewModel()
        self.disposeBag = DisposeBag()
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildUI()
        
        self.bind()
    }
    
    func bind() {
        self.listViewModel.restaurants
            .bind(
                to: restaurantListTableView.rx.items(cellIdentifier: "restaurantListTableCell")
            ) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }.disposed(by: self.disposeBag)
    }
    
    // All UI rendering related functions must have the prefix `build` in front of the method
    private func buildUI() {
        buildNavigationBarUsingNavController()
        
        buildTableView()
    }
    
    private func buildNavigationBarUsingNavController() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        self.controller.navigationBar.standardAppearance = navBarAppearance
        self.controller.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.controller.navigationBar.topItem?.title = "Restaurants"
        self.controller.navigationBar.prefersLargeTitles = true
    }
    
    private func buildTableView() {
        self.restaurantListTableView.contentInsetAdjustmentBehavior = .never
    }
}
