//
//  SettingsProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol SettingsViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol SettingsPresenterProtocol: AnyObject {
    var router: SettingsRouterProtocol! { get set }
    func configureView()
}

protocol SettingsInteractorProtocol: AnyObject {
    
}

protocol SettingsRouterProtocol: AnyObject {
    
}

protocol SettingsConfiguratorProtocol: AnyObject {
    func configure(with viewController: SettingsViewController)
}
