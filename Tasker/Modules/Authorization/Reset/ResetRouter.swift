//
//  ResetRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ResetRouter: ResetRouterProtocol {
    weak var viewController: ResetViewController!
    
    init(viewController: ResetViewController) {
        self.viewController = viewController
    }
}
