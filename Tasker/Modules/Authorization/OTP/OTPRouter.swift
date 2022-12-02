//
//  OTPRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class OTPRouter: OTPRouterProtocol {
    weak var viewController: OTPViewController!
    
    init(viewController: OTPViewController) {
        self.viewController = viewController
    }
    
    func showReset() {
        
    }
}
