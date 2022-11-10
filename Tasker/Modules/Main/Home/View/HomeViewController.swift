//
//  HomeViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class HomeViewController: UIViewController {
    public var presenter: HomeViewPresenterProtocol!
    
    // MARK: - Variables
    
    // MARK: - Init UI Elements
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        [<#elements#>].forEach {view in
            self.view.addSubview(view)
        }
        
        // MARK: - Setting Constraints
        setConstraints()
        
        // MARK: - Targets
    }
    
    // MARK: - Methods
    private func setConstraints() {}
    
    // MARK: - @objc
    
}

extension HomeViewController: HomeViewProtocol {
    func test() {
        print("hello")
    }
}

