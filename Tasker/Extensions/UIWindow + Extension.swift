//
//  UIWindow + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

extension UIWindow {
    func initTheme() {
        overrideUserInterfaceStyle = Theme.current.userInterfaceStyle
    }
}
