//
//  HomePresenter.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func test()
}

protocol HomeViewPresenterProtocol: AnyObject {
    init(view: HomeViewProtocol, router: RouterProtocol)
}

final class HomePresenter: HomeViewPresenterProtocol {
    weak var view: HomeViewProtocol?
    var router: RouterProtocol?
    
    required init(view: HomeViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

