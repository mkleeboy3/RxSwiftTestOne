//
//  RestaurantListVC.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit
import RxSwift
import RxCocoa

final class RestaurantListViewController: UIViewController, ViewController {
    var listViewModel: RestaurantListViewModel
    var disposeBag: DisposeBag
    
    @IBOutlet weak var restaurantListTableView: UITableView!
    
    required init?(coder: NSCoder) {
        self.listViewModel = RestaurantListViewModel()
        self.disposeBag = DisposeBag()
        
        super.init(coder: coder)
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
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationController?.navigationBar.topItem?.title = "Restaurants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func buildTableView() {
        self.restaurantListTableView.contentInsetAdjustmentBehavior = .never
    }
}
