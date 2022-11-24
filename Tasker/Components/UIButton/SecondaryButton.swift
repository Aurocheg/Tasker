//
//  SecondaryButton.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

final class SecondaryButton: UIButton {
    enum SelfType {
        case withBackground
        case withoutBackground
    }
    
    init(text: String = "", type: SelfType = .withoutBackground, image: UIImage? = nil, radius: CGFloat = 8, textColor: UIColor? = nil) {
        super.init(frame: .zero)
                        
        setTitle(text, for: .normal)

        if let color = textColor {
            setTitleColor(color, for: .normal)
        } else {
            setTitleColor(.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white), for: .normal)
        }
        
        titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
                
        if let image = image {
            setImage(image, for: .normal)
        }
                
        switch type {
        case .withBackground:
            let color = UIColor(red: 0.937, green: 0.945, blue: 0.953, alpha: 1)
            backgroundColor = UIColor.color(light: color, dark: .clear)
            layer.cornerRadius = radius
            layer.borderColor = UIColor.color(light: color, dark: .white).cgColor
            layer.borderWidth = 1
        case .withoutBackground: break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
