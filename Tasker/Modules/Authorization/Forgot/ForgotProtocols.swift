//
//  ForgotProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol ForgotViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol ForgotPresenterProtocol: AnyObject {
    var router: ForgotRouterProtocol! { get set }
    func configureView()
    func sendButtonTapped()
}

protocol ForgotInteractorProtocol: AnyObject {
    
}

protocol ForgotRouterProtocol: AnyObject {
    func showOTP()
}

protocol ForgotConfiguratorProtocol: AnyObject {
    func configure(with viewController: ForgotViewController)
}
