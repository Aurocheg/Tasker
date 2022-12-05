//
//  WorkspaceProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol WorkspaceViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol WorkspacePresenterProtocol: AnyObject {
    var router: WorkspaceRouterProtocol! { get set }
    func configureView()
    func createButtonTapped()
}

protocol WorkspaceInteractorProtocol: AnyObject {
    
}

protocol WorkspaceRouterProtocol: AnyObject {
    func showPlan()
}

protocol WorkspaceConfiguratorProtocol: AnyObject {
    func configure(with viewController: WorkspaceViewController)
}
