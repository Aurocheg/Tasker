//
//  Label.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

final class TitleLabel: UILabel {
    init(text: String, size: CGFloat = 24.0) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = UIColor.Pallette.titleColor
        self.numberOfLines = 0
        self.font = .systemFont(ofSize: size, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
