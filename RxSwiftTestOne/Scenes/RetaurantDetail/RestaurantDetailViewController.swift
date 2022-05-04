//
//  RestaurantDetailViewController.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/05/04.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    private let args: RestaurantDetailViewArgs
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildUI()
        
        self.bind()
    }
    
    init?(args: RestaurantDetailViewArgs, coder: NSCoder) {
        self.args = args
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func bind() {
        
    }
    
    private func buildUI() {
        buildLabels()
    }
    
    private func buildLabels() {
        titleLabel.text = args.title
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.textAlignment = .left
        
        bodyLabel.text = args.body
        bodyLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        bodyLabel.textAlignment = .natural
    }
}
