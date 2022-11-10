//
//  UIBarButtonItem + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

extension UIBarButtonItem {
    func addBackArrowButton(navigationController: UINavigationController, navigationItem: UINavigationItem) {
        if let icon = UIImage(named: "backward") {
            let backBarButton = UIBarButtonItem(image: icon,
                                                style: .plain,
                                                target: navigationController,
                                                action: #selector(UINavigationController.popViewController(animated:)))
            navigationItem.leftBarButtonItem = backBarButton
        }
    }
}
