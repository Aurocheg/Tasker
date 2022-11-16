//
//  SignUpPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

protocol SignUpViewProtocol: AnyObject {
    func test()
}

protocol SignUpViewPresenterProtocol: AnyObject {
    init(view: SignUpViewProtocol, router: RouterProtocol)
    func signUpButtonTapped(alert: @escaping (_ success: Bool) -> Void)
    var emailValue: String? { get set }
    var passwordValue: String? { get set }
}

final class SignUpPresenter: SignUpViewPresenterProtocol {
    weak var view: SignUpViewProtocol?
    var router: RouterProtocol?
    var emailValue: String?
    var passwordValue: String?
    
    required init(view: SignUpViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func signUpButtonTapped(alert: @escaping (_ success: Bool) -> Void) {
        let signUpManager = FirebaseAuthManager()
        
        if let email = emailValue, let password = passwordValue {
            signUpManager.createUser(email: email, password: password) {success in
                alert(success)
                
                if success {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.router?.showTabBar()
                    }
                }
            }
        }
    }
}

