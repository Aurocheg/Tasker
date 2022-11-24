//
//  UIStackView + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 23.11.22.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach { addArrangedSubview($0) }
    }
}
