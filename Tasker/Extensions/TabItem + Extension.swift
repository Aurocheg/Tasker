//
//  CustomTabItem + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 23.11.22.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home
    case chat
    case notification
    case settings
}

extension TabItem {
    var viewController: UIViewController {
        switch self {
        case .home:
            return TabBarViewController(item: .home)
        case .chat:
            return TabBarViewController(item: .chat)
        case .notification:
            return TabBarViewController(item: .notification)
        case .settings:
            return TabBarViewController(item: .settings)
        }
    }
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home")?.withTintColor(UIColor.Pallette.tabBarItemColor, renderingMode: .alwaysOriginal)
        case .chat:
            return UIImage(named: "chat")?.withTintColor(UIColor.Pallette.tabBarItemColor, renderingMode: .alwaysOriginal)
        case .notification:
            return UIImage(named: "notification")?.withTintColor(UIColor.Pallette.tabBarItemColor, renderingMode: .alwaysOriginal)
        case .settings:
            return UIImage(named: "settings")?.withTintColor(UIColor.Pallette.tabBarItemColor, renderingMode: .alwaysOriginal)
        }
    }
    var selectedIcon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "homeBold")?.withTintColor(UIColor.Pallette.tabBarItemActiveColor, renderingMode: .alwaysOriginal)
        case .chat:
            return UIImage(named: "chatBold")?.withTintColor(UIColor.Pallette.tabBarItemActiveColor, renderingMode: .alwaysOriginal)
        case .notification:
            return UIImage(named: "notificationBold")?.withTintColor(UIColor.Pallette.tabBarItemActiveColor, renderingMode: .alwaysOriginal)
        case .settings:
            return UIImage(named: "settingsBold")?.withTintColor(UIColor.Pallette.tabBarItemActiveColor, renderingMode: .alwaysOriginal)
        }
    }
    var name: String {
        return rawValue.capitalized
    }
}
