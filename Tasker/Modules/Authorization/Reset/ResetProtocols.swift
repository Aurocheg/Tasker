//
//  ResetProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol ResetViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol ResetPresenterProtocol: AnyObject {
    var router: ResetRouterProtocol! { get set }
    func configureView()
}

protocol ResetInteractorProtocol: AnyObject {
    
}

protocol ResetRouterProtocol: AnyObject {
    
}

protocol ResetConfiguratorProtocol: AnyObject {
    func configure(with viewController: ResetViewController)
}
