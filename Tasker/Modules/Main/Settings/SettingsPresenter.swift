//
//  SettingsPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class SettingsPresenter: SettingsPresenterProtocol {
    weak var view: SettingsViewProtocol!
    var interactor: SettingsInteractorProtocol!
    var router: SettingsRouterProtocol!
    
    // MARK: - SettingsPresenterProtocol Properties
    
    required init(view: SettingsViewProtocol) {
        self.view = view
    }
    
    // MARK: - SettingsPresenterProtocol Methods
    func configureView() {
        
    }
}
