//
//  ForgotRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ForgotRouter: ForgotRouterProtocol {
    weak var viewController: ForgotViewController!
    
    init(viewController: ForgotViewController) {
        self.viewController = viewController
    }
    
    func showOTP() {
        
    }
}
