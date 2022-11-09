//
//  SignInPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import Foundation

protocol SignInViewProtocol: AnyObject {
    func test()
}

protocol SignInViewPresenterProtocol: AnyObject {
    init(view: SignInViewProtocol, router: RouterProtocol)
    func signUpButtonTapped()
    func forgotPasswordButtonTapped()
}

class SignInPresenter: SignInViewPresenterProtocol {
    weak var view: SignInViewProtocol?
    var router: RouterProtocol?
    
    required init(view: SignInViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func signUpButtonTapped() {
        router?.showSignUp()
    }
    
    func forgotPasswordButtonTapped() {
        router?.showForgotPassword()
    }
}
