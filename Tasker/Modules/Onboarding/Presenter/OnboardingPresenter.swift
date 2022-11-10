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
    var boards: [Board]? { get set }
    func getBoards()
}

final class OnboardingPresenter: OnboardingViewPresenterProtocol {
    weak var view: OnboardingViewProtocol?
    var router: RouterProtocol?
    var boards: [Board]?
    
    required init(view: OnboardingViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        
        getBoards()
    }
    
    func getBoards() {
        boards = Board.getBoards()
    }
}

