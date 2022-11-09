//
//  Theme.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import Foundation

enum Theme: Int, CaseIterable {
    case system = 0
    case light
    case dark
}

extension Theme {
    @Persist(key: "app_theme", defaultValue: Theme.system.rawValue)
    private static var appTheme: Int
    
    func save() {
        Theme.appTheme = self.rawValue
    }
    
    static var current: Theme {
        Theme(rawValue: appTheme) ?? .system
    }
}
