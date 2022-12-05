//
//  OTPRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class OTPRouter: OTPRouterProtocol {
    weak var viewController: OTPViewController!
    private lazy var navigationController = viewController.navigationController!
    
    init(viewController: OTPViewController) {
        self.viewController = viewController
    }
    
    func showReset() {
        let resetVC = ResetViewController()
        navigationController.pushViewController(resetVC, animated: true)
    }
}
