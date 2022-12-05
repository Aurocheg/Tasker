//
//  WorkspaceRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class WorkspaceRouter: WorkspaceRouterProtocol {
    weak var viewController: WorkspaceViewController!
    private lazy var navigationController = viewController.navigationController!
    
    init(viewController: WorkspaceViewController) {
        self.viewController = viewController
    }
    
    func showPlan() {
        let planVC = PlanViewController()
        navigationController.pushViewController(planVC, animated: true)
    }
}
