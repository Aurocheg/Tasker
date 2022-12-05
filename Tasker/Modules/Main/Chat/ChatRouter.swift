//
//  ChatRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ChatRouter: ChatRouterProtocol {
    weak var viewController: ChatViewController!
    
    init(viewController: ChatViewController) {
        self.viewController = viewController
    }
}
