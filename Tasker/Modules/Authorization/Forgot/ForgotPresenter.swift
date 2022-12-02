//
//  ForgotPasswordPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ForgotPresenter: ForgotPresenterProtocol {
    weak var view: ForgotViewProtocol!
    var interactor: ForgotInteractorProtocol!
    var router: ForgotRouterProtocol!
        
    required init(view: ForgotViewProtocol) {
        self.view = view
    }
    
    // MARK: - ForgotPresenter Methods
    func configureView() {
        
    }
    
    func sendButtonTapped() {
        router.showOTP()
    }
}
