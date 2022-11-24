//
//  StackView.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class StackView: UIStackView {
    // MARK: - Init Methods
    
    init(spacing: CGFloat, axis: NSLayoutConstraint.Axis = .horizontal, alignment: UIStackView.Alignment = .center) {
        super.init(frame: .zero)
        
        self.spacing = spacing
        self.axis = axis
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
