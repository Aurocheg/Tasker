//
//  LargeButton.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

final class LargeButton: UIButton {
    enum SelfType {
        case withoutArrow
        case withLeftArrow
        case withRightArrow
    }
    
    init(text: String, type: SelfType) {
        super.init(frame: .zero)
                
        setTitle(text, for: .normal)
        titleLabel?.textColor = .white
        titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
                
        backgroundColor = UIColor.Pallette.buttonBackground
        layer.cornerRadius = 16
                
        var arrowIcon: UIImage?
        if let icon = UIImage(named: "right") {
            arrowIcon = icon.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
        
        switch type {
        case .withoutArrow:
            setImage(UIImage(), for: .normal)
        case .withLeftArrow:
            setImage(arrowIcon, for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        case .withRightArrow:
            setImage(arrowIcon, for: .normal)
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
