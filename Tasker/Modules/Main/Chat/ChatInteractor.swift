//
//  ChatInteractor.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

final class ChatInteractor: ChatInteractorProtocol {
    weak var presenter: ChatPresenterProtocol!
    
    // MARK: - Services
    
    required init(presenter: ChatPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - ChatInteractorProtocol Properties
    
    // MARK: - ChatInteractorProtocol Methods
}
