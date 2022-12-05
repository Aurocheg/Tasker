//
//  NotificationViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class NotificationViewController: UIViewController, NotificationViewProtocol {
    var presenter: NotificationPresenterProtocol!
    var configurator: NotificationConfiguratorProtocol = NotificationConfigurator()
    
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
    
    // MARK: - NoticationViewProtocol Methods
    func setupHierarchy() {
        
    }
    
    func setupLayout() {
        
    }
    
    func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
    }
    
    func setupTargets() {
        
    }
    
    // MARK: - Private Methods
    
    // MARK: - Targets
}
