//
//  OTPPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import Foundation

protocol OTPViewProtocol: AnyObject {
    func test()
}

protocol OTPViewPresenterProtocol: AnyObject {
    init(view: OTPViewProtocol, router: RouterProtocol)
    func resendButtonTapped()
    func nextButtonTapped()
}

final class OTPPresenter: OTPViewPresenterProtocol {
    weak var view: OTPViewProtocol?
    var router: RouterProtocol?
    
    required init(view: OTPViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func resendButtonTapped() {
        
    }
    
    func nextButtonTapped() {
        router?.showResetPassword()
    }
}

