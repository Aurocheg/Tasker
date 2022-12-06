//
//  ChatViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ChatViewController: UIViewController, ChatViewProtocol {
    var presenter: ChatPresenterProtocol!
    var configurator: ChatConfiguratorProtocol = ChatConfigurator()
    
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
    
    // MARK: - ChatVewProtocol Methods
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
