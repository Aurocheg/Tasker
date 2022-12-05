//
//  HomePresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    // MARK: - HomePresenterProtocol Properties
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
    
    // MARK: - HomePresenterProtocol Methods
    func configureView() {
        
    }
}
