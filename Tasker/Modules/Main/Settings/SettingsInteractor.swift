//
//  SettingsInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class SettingsInteractor: SettingsInteractorProtocol {
    weak var presenter: SettingsPresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - SettingsInteractorProtocol Properties
    
    // MARK: - SettingsInteractorProtocol Methods
}
