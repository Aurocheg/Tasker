//
//  ForgotPasswordPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import Foundation

protocol ForgotPasswordViewProtocol: AnyObject {
    func test()
}

protocol ForgotPasswordViewPresenterProtocol: AnyObject {
    init(view: ForgotPasswordViewProtocol, router: RouterProtocol)
    func sendButtonTapped()
}

final class ForgotPasswordPresenter: ForgotPasswordViewPresenterProtocol {
    weak var view: ForgotPasswordViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ForgotPasswordViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func sendButtonTapped() {
        router?.showOTP()
    }
}

