//
//  SignUpPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import Foundation

protocol SignUpViewProtocol: AnyObject {
    func test()
}

protocol SignUpViewPresenterProtocol: AnyObject {
    init(view: SignUpViewProtocol, router: RouterProtocol)
}

final class SignUpPresenter: SignUpViewPresenterProtocol {
    weak var view: SignUpViewProtocol?
    var router: RouterProtocol?
    
    required init(view: SignUpViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

