//
//  TabBarViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class TabBarController: UITabBarController {
    var upperLineView: UIView!
    let spacing: CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.delegate = self
                
        UITabBar.appearance().tintColor = UIColor.Pallette.buttonBackground
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.addTabBarIndicatorView(index: 0, isFirstTime: true)
        }
    }
    
    func addTabBarIndicatorView(index: Int, isFirstTime: Bool = false){
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        if !isFirstTime {
            upperLineView.removeFromSuperview()
        }
        upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: 4))
        upperLineView.backgroundColor = UIColor.Pallette.buttonBackground
        tabBar.addSubview(upperLineView)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabBarIndicatorView(index: self.selectedIndex)
    }
}
