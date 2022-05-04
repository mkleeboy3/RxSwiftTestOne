//
//  RestaurantListVC.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit
import RxSwift
import RxCocoa

final class RestaurantListViewController: UIViewController {
    let coordinator: RestaurantListCoordinator = Injector.find()
    let listViewModel: RestaurantListViewModel = Injector.find()
    var disposeBag: DisposeBag = DisposeBag()
    
    @IBOutlet weak var restaurantListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildUI()
        
        self.bind()
    }
    
    private func bind() {
        self.listViewModel.restaurants
            .bind(
                to: restaurantListTableView.rx.items(cellIdentifier: "restaurantListTableCell")
            ) { index, restaurant, cell in
                let viewModel = RestaurantListTableCellViewModel(restaurantData: restaurant)
    
                cell.textLabel?.text = viewModel.displayText
            }.disposed(by: self.disposeBag)
        
        self.restaurantListTableView.rx.modelSelected(Restaurant.self)
            .subscribe(onNext: { [weak self] restaurant in
                self?.coordinator.navigateToDetail(
                    args: RestaurantDetailViewArgs(
                        title: restaurant.name,
                        body: restaurant.cuisine.rawValue
                    )
                )
            }).disposed(by: disposeBag)
        
        self.restaurantListTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] row in
                self?.restaurantListTableView.deselectRow(at: row, animated: true)
            })
            .disposed(by: disposeBag)
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
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationController?.navigationBar.topItem?.title = "Restaurants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func buildTableView() {
        self.restaurantListTableView.contentInsetAdjustmentBehavior = .never
    }
}
