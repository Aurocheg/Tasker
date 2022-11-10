//
//  ChatPresenter.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import Foundation

protocol ChatViewProtocol: AnyObject {
    func test()
}

protocol ChatViewPresenterProtocol: AnyObject {
    init(view: ChatViewProtocol, router: RouterProtocol)
}

final class ChatPresenter: ChatViewPresenterProtocol {
    weak var view: ChatViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ChatViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

