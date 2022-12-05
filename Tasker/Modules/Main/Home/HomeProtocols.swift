//
//  HomeProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol HomePresenterProtocol: AnyObject {
    var router: HomeRouterProtocol! { get set }
    func configureView()
}

protocol HomeInteractorProtocol: AnyObject {
    
}

protocol HomeRouterProtocol: AnyObject {
    
}

protocol HomeConfiguratorProtocol: AnyObject {
    func configure(with viewController: HomeViewController)
}
