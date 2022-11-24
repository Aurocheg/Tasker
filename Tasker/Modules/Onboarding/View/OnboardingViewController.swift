//
//  OnboardingViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class OnboardingViewController: UIPageViewController {
    // MARK: - Properties
    
    private var items: [BoardViewController] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
//        dataSource = self
        
        if let firstVC = items.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    // MARK: - Methods
    
    private func decoratePageControl() {
        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingViewController.self])
        pc.currentPageIndicatorTintColor = .orange
        pc.pageIndicatorTintColor = .gray
    }
}

// MARK: - UIPageViewControllerDelegate
/*
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    
}
*/
