//
//  ResetPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ResetPresenter: ResetPresenterProtocol {
    weak var view: ResetViewProtocol!
    var interactor: ResetInteractorProtocol!
    var router: ResetRouterProtocol!
    
    // MARK: - ResetPresenter Properties
    
    required init(view: ResetViewProtocol) {
        self.view = view
    }
    
    // MARK: - ResetPresenter Methods
    func configureView() {
        
    }
    
    func saveButtonTapped() {
        router.showWorkspace()
    }
}
