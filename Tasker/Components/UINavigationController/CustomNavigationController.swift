//
//  UINavigationController.swift
//  Tasker
//
//  Created by Aurocheg on 6.12.22.
//

import UIKit

final class CustomNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        let darkColor = UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1)
        
        UIBarButtonItem.addBackArrowButton(navigationController: self, navigationItem: navigationItem)
        navigationBar.tintColor = UIColor.color(light: darkColor, dark: .white)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
