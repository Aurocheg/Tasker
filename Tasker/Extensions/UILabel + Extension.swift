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
        
        self.addSubview(leftLine)
        self.addSubview(rightLine)
        
        leftLine.snp.makeConstraints {make -> Void in
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(self.snp.leading).offset(-16)
            make.centerY.equalTo(self)
            make.height.equalTo(2)
        }
        
        rightLine.snp.makeConstraints {make -> Void in
            make.leading.equalTo(self.snp.trailing).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.centerY.equalTo(self)
            make.height.equalTo(2)
        }
    }
}
