//
//  ForgotPasswordInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class ForgotInteractor: ForgotInteractorProtocol {
    weak var presenter: ForgotPresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: ForgotPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - ForgotInteractorProtocol Properties
    
    // MARK: - ForgotInteractorProtocol Methods
}
