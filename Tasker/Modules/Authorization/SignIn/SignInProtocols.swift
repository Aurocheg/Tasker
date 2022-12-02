//
//  SignInProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol SignInViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
}

protocol SignInPresenterProtocol: AnyObject {
    var router: SignInRouterProtocol! { get set }
    func configureView()
    func forgotButtonTapped()
    func signInButtonTapped()
    func signUpButtonTapped()
}

protocol SignInInteractorProtocol: AnyObject {
    
}

protocol SignInRouterProtocol: AnyObject {
    func showTabBar()
    func showForgot()
    func showSignUp()
}

protocol SignInConfiguratorProtocol: AnyObject {
    func configure(with viewController: SignInViewController)
}
