//
//  SignInPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

import UIKit

final class SignInPresenter: SignInPresenterProtocol {
    weak var view: SignInViewProtocol!
    var interactor: SignInInteractorProtocol!
    var router: SignInRouterProtocol!
        
    required init(view: SignInViewProtocol) {
        self.view = view
    }
    
    // MARK: - SignInPresenter Methods
    func configureView() {
        
    }
    
    func signInButtonTapped() {
        router.showTabBar()
    }
    
    func forgotButtonTapped() {
        router.showForgot()
    }
    
    func signUpButtonTapped() {
        router.showSignUp()
    }
}
