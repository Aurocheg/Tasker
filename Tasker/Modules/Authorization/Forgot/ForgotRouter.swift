//
//  ForgotRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ForgotRouter: ForgotRouterProtocol {
    weak var viewController: ForgotViewController!
    private lazy var navigationController = viewController.navigationController!
    
    init(viewController: ForgotViewController) {
        self.viewController = viewController
    }
    
    func showOTP() {
        let OTPVC = OTPViewController()
        navigationController.pushViewController(OTPVC, animated: true)
    }
}
