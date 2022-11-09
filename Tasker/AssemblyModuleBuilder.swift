//
//  AssemblyModuleBuilder.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

protocol AssemblyBuilderProtocol {
    // MARK: - Authorization
    func createSignUpModule(router: RouterProtocol) -> UIViewController
    func createSignInModule(router: RouterProtocol) -> UIViewController
    func createForgotPasswordModule(router: RouterProtocol) -> UIViewController
    func createOTPModule(router: RouterProtocol) -> UIViewController
    func createResetPasswordModule(router: RouterProtocol) -> UIViewController
    func createWorkspaceModule(router: RouterProtocol) -> UIViewController
    func createChoosePlanModule(router: RouterProtocol) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    // MARK: - Authorization
    func createSignUpModule(router: RouterProtocol) -> UIViewController {
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSignInModule(router: RouterProtocol) -> UIViewController {
        let view = SignInViewController()
        let presenter = SignInPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createForgotPasswordModule(router: RouterProtocol) -> UIViewController {
        let view = ForgotPasswordViewController()
        let presenter = ForgotPasswordPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createOTPModule(router: RouterProtocol) -> UIViewController {
        let view = OTPViewController()
        let presenter = OTPPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createResetPasswordModule(router: RouterProtocol) -> UIViewController {
        let view = ResetPasswordViewController()
        let presenter = ResetPasswordPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createWorkspaceModule(router: RouterProtocol) -> UIViewController {
        let view = CreateWorkspaceViewController()
        let presenter = CreateWorkspacePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createChoosePlanModule(router: RouterProtocol) -> UIViewController {
        let view = ChoosePlanViewController()
        let presenter = ChoosePlanPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
