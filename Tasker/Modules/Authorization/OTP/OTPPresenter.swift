//
//  OTPPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

import UIKit

final class OTPPresenter: OTPPresenterProtocol {
    weak var view: OTPViewProtocol!
    var interactor: OTPInteractorProtocol!
    var router: OTPRouterProtocol!
    
    // MARK: - OTPPresenter Properties
    
    required init(view: OTPViewProtocol) {
        self.view = view
    }
    
    // MARK: - OTPPresenter Methods
    func configureView() {
        
    }
    
    func resendButtonTapped() {
        
    }
    
    func nextButtonTapped() {
        router.showReset()
    }
}
