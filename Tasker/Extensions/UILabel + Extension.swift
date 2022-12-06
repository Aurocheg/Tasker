//
//  UILabel + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit
import SnapKit

extension UILabel {
    func drawLineOnBothSides(view: UIView) {
        let leftLine = UIView()
        let rightLine = UIView()
        let color = UIColor.color(light: UIColor(red: 0.937, green: 0.945, blue: 0.953, alpha: 1), dark: .white)
        
        leftLine.backgroundColor = color
        rightLine.backgroundColor = color
        
        addSubview(leftLine)
        addSubview(rightLine)
        
        leftLine.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(24)
            $0.trailing.equalTo(snp.leading).offset(-16)
            $0.centerY.equalTo(self)
            $0.height.equalTo(2)
        }
        
        rightLine.snp.makeConstraints {
            $0.leading.equalTo(snp.trailing).offset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(-24)
            $0.centerY.equalTo(self)
            $0.height.equalTo(2)
        }
    }
}
