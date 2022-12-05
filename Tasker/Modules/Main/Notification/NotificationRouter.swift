//
//  NotificationRouter.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import Foundation

import UIKit

final class NotificationRouter: NotificationRouterProtocol {
    weak var viewController: NotificationViewController!
    
    init(viewController: NotificationViewController) {
        self.viewController = viewController
    }
}
