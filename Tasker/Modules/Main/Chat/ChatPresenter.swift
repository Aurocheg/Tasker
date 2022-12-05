//
//  ChatPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

import UIKit

final class ChatPresenter: ChatPresenterProtocol {
    weak var view: ChatViewProtocol!
    var interactor: ChatInteractorProtocol!
    var router: ChatRouterProtocol!
    
    // MARK: - ChatPresenterProtocol Properties
    
    required init(view: ChatViewProtocol) {
        self.view = view
    }
    
    // MARK: - ChatPresenterProtocol Methods
    func configureView() {
        
    }
}
