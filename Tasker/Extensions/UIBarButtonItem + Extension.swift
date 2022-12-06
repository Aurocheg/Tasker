//
//  UIBarButtonItem + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

extension UIBarButtonItem {
    static func addBackArrowButton(navigationController: CustomNavigationController, navigationItem: UINavigationItem) {
        guard let icon = UIImage(named: "backward") else { return }
        let backBarButton = UIBarButtonItem(image: icon,
                                            style: .plain,
                                            target: navigationController,
                                            action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBarButton
    }
}
