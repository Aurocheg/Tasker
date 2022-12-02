//
//  ResetInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class ResetInteractor: ResetInteractorProtocol {
    weak var presenter: ResetPresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: ResetPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - ResetInteractorProtocol Properties
    
    // MARK: - ResetInteractorProtocol Methods
}
