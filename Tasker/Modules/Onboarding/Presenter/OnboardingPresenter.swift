//
//  OnboardingPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import Foundation

protocol OnboardingViewProtocol: AnyObject {
    func test()
}

protocol OnboardingViewPresenterProtocol: AnyObject {
    init(view: OnboardingViewProtocol, router: RouterProtocol)
}

final class OnboardingPresenter: OnboardingViewPresenterProtocol {
    weak var view: OnboardingViewProtocol?
    var router: RouterProtocol?
    
    required init(view: OnboardingViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

