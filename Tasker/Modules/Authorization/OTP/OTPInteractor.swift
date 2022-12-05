//
//  OTPInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class OTPInteractor: OTPInteractorProtocol {
    weak var presenter: OTPPresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: OTPPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - OTPInteractorProtocol Properties
    
    // MARK: - OTPInteractorProtocol Methods
}
