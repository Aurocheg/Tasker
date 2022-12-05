//
//  SettingsRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//


import UIKit

final class SettingsRouter: SettingsRouterProtocol {
    weak var viewController: SettingsViewController!
    
    init(viewController: SettingsViewController) {
        self.viewController = viewController
    }
}
