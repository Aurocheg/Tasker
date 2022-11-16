//
//  SettingsPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import Foundation

protocol SettingsViewProtocol: AnyObject {
    func test()
}

protocol SettingsViewPresenterProtocol: AnyObject {
    init(view: SettingsViewProtocol, router: RouterProtocol)
}

final class SettingsPresenter: SettingsViewPresenterProtocol {
    weak var view: SettingsViewProtocol?
    var router: RouterProtocol?
    
    required init(view: SettingsViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

