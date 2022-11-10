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
    func showSignIn()
    func showSignUp()
    func showForgotPassword()
    func showOTP()
    func showResetPassword()
    func showCreateWorkspace()
    func showChoosePlan()
}

final class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        /*
        if let navigationController = navigationController {
            guard let onboardingViewController = assemblyBuilder?.createOnboardingModule(router: self) else { return }
            navigationController.viewControllers = [onboardingViewController]
        }
         */
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
    
    func showOTP() {
        if let navigationController = navigationController {
            guard let OTPViewController = assemblyBuilder?.createOTPModule(router: self) else { return }
            navigationController.pushViewController(OTPViewController, animated: true)
        }
    }
    
    func showResetPassword() {
        if let navigationController = navigationController {
            guard let resetPasswordViewController = assemblyBuilder?.createResetPasswordModule(router: self) else { return }
            navigationController.pushViewController(resetPasswordViewController, animated: true)
        }
    }
    
    func showCreateWorkspace() {
        if let navigationController = navigationController {
            guard let createWorkspaceViewController = assemblyBuilder?.createWorkspaceModule(router: self) else { return }
            navigationController.pushViewController(createWorkspaceViewController, animated: true)
        }
    }
    
    func showChoosePlan() {
        if let navigationController = navigationController {
            guard let choosePlanViewController = assemblyBuilder?.createChoosePlanModule(router: self) else { return }
            navigationController.pushViewController(choosePlanViewController, animated: true)
        }
    }
}
