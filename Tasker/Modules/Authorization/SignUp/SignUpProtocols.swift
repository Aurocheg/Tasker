//
//  SignUpProtocols.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

protocol SignUpViewProtocol: AnyObject {
    func setupHierarchy()
    func setupLayout()
    func setupProperties()
    func setupTargets()
    func applyValidation(with value: String, type: TextFieldType)
}

protocol SignUpPresenterProtocol: AnyObject {
    var router: SignUpRouterProtocol! { get set }
    var emailValue: String? { get set }
    var passwordValue: String? { get set }
    func configureView()
    func signUpButtonTapped(alert: @escaping (_ success: Bool) -> Void)
    func signInButtonTapped()
}

protocol SignUpInteractorProtocol: AnyObject {
    func createUser(email: String, password: String, alert: @escaping (_ success: Bool) -> Void)
}

protocol SignUpRouterProtocol: AnyObject {
    func showWorkspace()
    func showSignIn()
}

protocol SignUpConfiguratorProtocol: AnyObject {
    func configure(with viewController: SignUpViewController)
}
