//
//  AssemblyModuleBuilder.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createSignInModule(router: RouterProtocol) -> UIViewController
    func createSignUpModule(router: RouterProtocol) -> UIViewController
    func createForgotPasswordModule(router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createSignInModule(router: RouterProtocol) -> UIViewController {
        let view = SignInViewController()
        let presenter = SignInPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSignUpModule(router: RouterProtocol) -> UIViewController {
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createForgotPasswordModule(router: RouterProtocol) -> UIViewController {
        let view = ForgotPasswordViewController()
        let presenter = ForgotPasswordPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
