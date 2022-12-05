//
//  SignUpRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class SignUpRouter: SignUpRouterProtocol {
    weak var viewController: SignUpViewController!
    private lazy var navigationController = viewController.navigationController!
    
    init(viewController: SignUpViewController) {
        self.viewController = viewController
    }
    
    func showWorkspace() {
        let workspaceVC = WorkspaceViewController()
        navigationController.pushViewController(workspaceVC, animated: true)
    }
    
    func showSignIn() {
        let signInVC = SignInViewController()
        navigationController.popViewController(animated: true)
    }
}
