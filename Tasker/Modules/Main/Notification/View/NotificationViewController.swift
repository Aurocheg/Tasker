//
//  NotificationViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class NotificationViewController: UIViewController {
    public var presenter: NotificationViewPresenterProtocol!
    
    // MARK: - Variables
    
    // MARK: - Init UI Elements
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem.selectedImage = UIImage(named: "notificationBold")
        
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        [].forEach {view in
            self.view.addSubview(view)
        }
        
        // MARK: - Setting Constraints
        setConstraints()
        
        // MARK: - Targets
    }
    
    // MARK: - Methods
    private func setConstraints() {}
    
    // MARK: - @objc
    
}

extension NotificationViewController: NotificationViewProtocol {
    func test() {
        print("hello")
    }
}

