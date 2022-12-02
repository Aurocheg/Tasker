//
//  SignUpInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class SignUpInteractor: SignUpInteractorProtocol {
    weak var presenter: SignUpPresenterProtocol!
    
    // MARK: - Services
    let authService: AuthServiceProtocol = AuthService()
    
    required init(presenter: SignUpPresenterProtocol) {
        self.presenter = presenter
    }
        
    // MARK: - SignUpInteractorProtocol Methods
    func createUser(email: String, password: String, alert: @escaping (_ success: Bool) -> Void) {
        authService.createUser(email: email, password: password) {success in
            alert(success)
        }
    }
}
