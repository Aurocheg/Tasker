//
//  ResetRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ResetRouter: ResetRouterProtocol {
    weak var viewController: ResetViewController!
    private lazy var navigationController = viewController.navigationController!
    
    init(viewController: ResetViewController) {
        self.viewController = viewController
    }
    
    func showWorkspace() {
        let workspaceVC = WorkspaceViewController()
        navigationController.pushViewController(workspaceVC, animated: true)
    }
}
