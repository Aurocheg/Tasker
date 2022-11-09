//
//  Theme + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

extension Theme {
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return themeWindow.traitCollection.userInterfaceStyle
        }
    }
    
    func setActive() {
        save()
        
        UIApplication.shared.windows
            .filter { $0 != themeWindow }
            .forEach { $0.overrideUserInterfaceStyle = userInterfaceStyle }
    }
}
