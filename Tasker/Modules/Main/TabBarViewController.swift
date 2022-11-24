//
//  TabBarViewController.swift
//  Tasker
//
//  Created by Aurocheg on 23.11.22.
//

import UIKit

final class TabBarViewController: UIViewController {
    private let item: TabItem
    
    init(item: TabItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
