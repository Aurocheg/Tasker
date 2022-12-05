//
//  NotificationInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class NotificationInteractor: NotificationInteractorProtocol {
    weak var presenter: NotificationPresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: NotificationPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - NotificationInteractorProtocol Properties
    
    // MARK: - NotificationInteractorProtocol Methods
}
