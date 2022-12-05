//
//  SignUpPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class SignUpPresenter: SignUpPresenterProtocol {
    weak var view: SignUpViewProtocol!
    var interactor: SignUpInteractorProtocol!
    var router: SignUpRouterProtocol!
    
    // MARK: - SignUpPresenter Properties
    var emailValue: String?
    var passwordValue: String?

    required init(view: SignUpViewProtocol) {
        self.view = view
    }
    
    // MARK: - SignUpPresenter Methods
    func configureView() {
        
    }
    
    func signUpButtonTapped(alert: @escaping (_ success: Bool) -> Void) {
        guard let email = emailValue, let password = passwordValue else { return }
        interactor.createUser(email: email, password: password, alert: alert)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.router.showWorkspace()
        }
    }
    
    func signInButtonTapped() {
        router.showSignIn()
    }
    
}
