//
//  SignUpRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class SignUpRouter: SignUpRouterProtocol {
    weak var viewController: SignUpViewController!
    
    init(viewController: SignUpViewController) {
        self.viewController = viewController
    }
    
    func showCreateWorkspace() {
        
    }
    
    func showSignIn() {
        
    }
}
