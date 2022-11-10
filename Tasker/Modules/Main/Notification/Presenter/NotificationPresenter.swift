//
//  NotificationPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import Foundation

protocol NotificationViewProtocol: AnyObject {
    func test()
}

protocol NotificationViewPresenterProtocol: AnyObject {
    init(view: NotificationViewProtocol, router: RouterProtocol)
}

final class NotificationPresenter: NotificationViewPresenterProtocol {
    weak var view: NotificationViewProtocol?
    var router: RouterProtocol?
    
    required init(view: NotificationViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

