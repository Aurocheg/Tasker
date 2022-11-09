//
//  TitleImageView.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class TitleImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(frame: .zero)
        guard let image = image else { return }
        self.image = image
        self.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
