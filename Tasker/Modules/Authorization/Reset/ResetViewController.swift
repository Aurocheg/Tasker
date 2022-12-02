//
//  ResetViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class ResetViewController: UIViewController, ResetViewProtocol {
    var presenter: ResetPresenterProtocol!
    var configurator: ResetConfiguratorProtocol = ResetConfigurator()
    
    // MARK: - UI Elements
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
        
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    // MARK: - ResetViewProtocol Methods
    func setupHierarchy() {
        
    }
    
    func setupLayout() {
        
    }
    
    func setupProperties() {
        
    }
    
    func setupTargets() {
        
    }
    
    // MARK: - Private Methods
    
    // MARK: - Targets
}
