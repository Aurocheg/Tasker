//
//  TextField.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit

class TextField: UITextField {
    enum SelfType {
        case email
        case password
        case number
        case name
    }

    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
