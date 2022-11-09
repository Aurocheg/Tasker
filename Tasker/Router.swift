//
//  Router.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
    func showSignUp()
    func showForgotPassword()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let signInViewController = assemblyBuilder?.createSignInModule(router: self) else { return }
            navigationController.viewControllers = [signInViewController]
        }
    }
    
    func showSignUp() {
        if let navigationController = navigationController {
            guard let signUpViewController = assemblyBuilder?.createSignUpModule(router: self) else { return }
            navigationController.pushViewController(signUpViewController, animated: true)
        }
    }
    
    func showForgotPassword() {
        if let navigationController = navigationController {
            guard let forgotPasswordViewController = assemblyBuilder?.createForgotPasswordModule(router: self) else { return }
            navigationController.pushViewController(forgotPasswordViewController, animated: true)
        }
    }
}
