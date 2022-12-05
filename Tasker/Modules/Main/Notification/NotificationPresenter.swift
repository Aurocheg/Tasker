//
//  NotificationPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class NotificationPresenter: NotificationPresenterProtocol {
    weak var view: NotificationViewProtocol!
    var interactor: NotificationInteractorProtocol!
    var router: NotificationRouterProtocol!
    
    // MARK: - NotificationPresenterProtocol Properties
    
    required init(view: NotificationViewProtocol) {
        self.view = view
    }
    
    // MARK: - NotificationPresenterProtocol Methods
    func configureView() {
        
    }
}
