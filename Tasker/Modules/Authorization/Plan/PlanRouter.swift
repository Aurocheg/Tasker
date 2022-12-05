//
//  PlanRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

import UIKit

final class PlanRouter: PlanRouterProtocol {
    weak var viewController: PlanViewController!
    private lazy var navigationController = viewController.navigationController!
    
    init(viewController: PlanViewController) {
        self.viewController = viewController
    }
    
    func showTabBar() {
        let tabBarController = TabBarController()
        navigationController.viewControllers = [tabBarController]
    }
}
