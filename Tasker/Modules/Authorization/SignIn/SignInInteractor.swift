//
//  SignInInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class SignInInteractor: SignInInteractorProtocol {
    weak var presenter: SignInPresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: SignInPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - SignInInteractorProtocol Properties
    
    // MARK: - SignInInteractorProtocol Methods
}
