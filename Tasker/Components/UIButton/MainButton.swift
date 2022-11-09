//
//  Button.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

final class MainButton: UIButton {
    enum SelfType {
        case withoutArrow
        case withLeftArrow
        case withRightArrow
    }
    
    init(text: String, type: SelfType) {
        super.init(frame: .zero)
        
        var arrowIcon: UIImage?
        
        self.setTitle(text, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.backgroundColor = UIColor.Pallette.buttonBackground
        
        self.layer.cornerRadius = 16

        if let icon = UIImage(named: "right") {
            arrowIcon = icon
        }
        
        switch type {
        case .withoutArrow:
            self.setImage(UIImage(), for: .normal)
        case .withLeftArrow:
            self.setImage(arrowIcon, for: .normal)
        case .withRightArrow:
            self.setImage(arrowIcon, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}