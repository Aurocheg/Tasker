//
//  NotificationProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol NotificationViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol NotificationPresenterProtocol: AnyObject {
    var router: NotificationRouterProtocol! { get set }
    func configureView()
}

protocol NotificationInteractorProtocol: AnyObject {
    
}

protocol NotificationRouterProtocol: AnyObject {
    
}

protocol NotificationConfiguratorProtocol: AnyObject {
    func configure(with viewController: NotificationViewController)
}
