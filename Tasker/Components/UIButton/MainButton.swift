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
                
        self.setTitle(text, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
                
        self.backgroundColor = UIColor.Pallette.buttonBackground
        self.layer.cornerRadius = 16
                
        var arrowIcon: UIImage?
        if let icon = UIImage(named: "right") {
            arrowIcon = icon.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
        
        switch type {
        case .withoutArrow:
            self.setImage(UIImage(), for: .normal)
        case .withLeftArrow:
            self.setImage(arrowIcon, for: .normal)
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        case .withRightArrow:
            self.setImage(arrowIcon, for: .normal)
            self.semanticContentAttribute = .forceRightToLeft
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
