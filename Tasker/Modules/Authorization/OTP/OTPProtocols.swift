//
//  OTPProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol OTPViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol OTPPresenterProtocol: AnyObject {
    var router: OTPRouterProtocol! { get set }
    func configureView()
    func resendButtonTapped()
    func nextButtonTapped()
}

protocol OTPInteractorProtocol: AnyObject {
    
}

protocol OTPRouterProtocol: AnyObject {
    func showReset()
}

protocol OTPConfiguratorProtocol: AnyObject {
    func configure(with viewController: OTPViewController)
}
