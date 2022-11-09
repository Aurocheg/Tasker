//
//  CreateWorkspacePresenter.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import Foundation

protocol CreateWorkspaceViewProtocol: AnyObject {
    func test()
}

protocol CreateWorkspaceViewPresenterProtocol: AnyObject {
    init(view: CreateWorkspaceViewProtocol, router: RouterProtocol)
    func createButtonTapped()
}

final class CreateWorkspacePresenter: CreateWorkspaceViewPresenterProtocol {
    weak var view: CreateWorkspaceViewProtocol?
    var router: RouterProtocol?
    
    required init(view: CreateWorkspaceViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func createButtonTapped() {
        router?.showChoosePlan()
    }
}

