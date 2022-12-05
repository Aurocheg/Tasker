//
//  WorkspacePresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

import UIKit

final class WorkspacePresenter: WorkspacePresenterProtocol {
    weak var view: WorkspaceViewProtocol!
    var interactor: WorkspaceInteractorProtocol!
    var router: WorkspaceRouterProtocol!
    
    // MARK: - WorkspacePresenter Properties
    
    required init(view: WorkspaceViewProtocol) {
        self.view = view
    }
    
    // MARK: - WorkspacePresenter Methods
    func configureView() {
        
    }
    
    func createButtonTapped() {
        router.showPlan()
    }
}
