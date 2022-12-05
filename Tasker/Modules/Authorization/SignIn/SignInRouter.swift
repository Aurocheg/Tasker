//
//  SignInRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class SignInRouter: SignInRouterProtocol {
    weak var viewController: SignInViewController!
    private lazy var navigationController = viewController.navigationController!
    
    init(viewController: SignInViewController) {
        self.viewController = viewController
    }
    
    func showTabBar() {
        let tabBarVC = TabBarController()
        navigationController.viewControllers = [tabBarVC]
    }
    
    func showForgot() {
        let forgotVC = ForgotViewController()
        navigationController.pushViewController(forgotVC, animated: true)
    }
    
    func showSignUp() {
        let signUpVC = SignUpViewController()
        navigationController.pushViewController(signUpVC, animated: true)
    }
}
