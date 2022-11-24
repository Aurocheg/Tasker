//
//  TextLabel.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

final class TextLabel: UILabel {
    init(text: String = "", size: CGFloat = 14, alignment: NSTextAlignment = .center) {
        super.init(frame: .zero)
        
        self.text = text
        textAlignment = alignment
        textColor = UIColor(red: 0.635, green: 0.62, blue: 0.714, alpha: 1)
        
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        
        font = .systemFont(ofSize: size, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
