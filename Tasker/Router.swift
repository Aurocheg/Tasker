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
    // MARK: - Authorization
    func initialViewController()
    func showSignIn()
    func showSignUp()
    func showForgotPassword()
    func showOTP()
    func showResetPassword()
    func showCreateWorkspace()
    func showChoosePlan()
    // MARK: - Main
    func showTabBar()
}

final class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    // MARK: - Methods
    @objc func popLast() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    // MARK: - Authorization
    func initialViewController() {
        if let navigationController = navigationController {
            guard let signInViewController = assemblyBuilder?.createSignInModule(router: self) else { return }
            navigationController.viewControllers = [signInViewController]
        }
    }
    
    func showSignIn() {
        if let navigationController = navigationController {
            guard let signInViewController = assemblyBuilder?.createSignInModule(router: self) else { return }
            navigationController.pushViewController(signInViewController, animated: true)
        }
    }
    
    func showSignUp() {
        if let navigationController = navigationController {
            guard let view = assemblyBuilder?.createSignUpModule(router: self) else { return }
            view.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backward"), style: .plain, target: self, action: #selector(popLast))
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    func showForgotPassword() {
        if let navigationController = navigationController {
            guard let view = assemblyBuilder?.createForgotPasswordModule(router: self) else { return }
            view.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backward"), style: .plain, target: self, action: #selector(popLast))
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    func showOTP() {
        if let navigationController = navigationController {
            guard let view = assemblyBuilder?.createOTPModule(router: self) else { return }
            view.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backward"), style: .plain, target: self, action: #selector(popLast))
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    func showResetPassword() {
        if let navigationController = navigationController {
            guard let view = assemblyBuilder?.createResetPasswordModule(router: self) else { return }
            view.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backward"), style: .plain, target: self, action: #selector(popLast))
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    func showCreateWorkspace() {
        if let navigationController = navigationController {
            guard let view = assemblyBuilder?.createWorkspaceModule(router: self) else { return }
            view.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backward"), style: .plain, target: self, action: #selector(popLast))
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    func showChoosePlan() {
        if let navigationController = navigationController {
            guard let view = assemblyBuilder?.createChoosePlanModule(router: self) else { return }
            view.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backward"), style: .plain, target: self, action: #selector(popLast))
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    // MARK: - Main
    func showTabBar() {
        if let navigationController = navigationController {
            guard let tabBarController = assemblyBuilder?.createTabBarModule(router: self) else { return }
            navigationController.viewControllers = [tabBarController]
        }
    }
}
