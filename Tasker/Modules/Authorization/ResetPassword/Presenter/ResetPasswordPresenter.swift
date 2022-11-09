//
//  ResetPasswordPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import Foundation

protocol ResetPasswordViewProtocol: AnyObject {
    func test()
}

protocol ResetPasswordViewPresenterProtocol: AnyObject {
    init(view: ResetPasswordViewProtocol, router: RouterProtocol)
    func saveButtonTapped()
}

final class ResetPasswordPresenter: ResetPasswordViewPresenterProtocol {
    weak var view: ResetPasswordViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ResetPasswordViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func saveButtonTapped() {
        router?.showCreateWorkspace()
    }
}

