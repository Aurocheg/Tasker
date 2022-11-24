//
//  UIColor + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

extension UIColor {
    static func color(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor.init{traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? dark : light
        }
    }
}

extension UIColor {
    struct Pallette {
        static let background = UIColor.color(light: .white, dark: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1))
        static let buttonBackground = UIColor(red: 0.392, green: 0.247, blue: 0.859, alpha: 1)
        static let titleColor = UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white)
        static let tabBarItemColor = UIColor(red: 0.635, green: 0.62, blue: 0.714, alpha: 1)
        static let tabBarItemActiveColor = UIColor.color(light: UIColor(red: 0.392, green: 0.247, blue: 0.859, alpha: 1), dark: .white)
    }
}
