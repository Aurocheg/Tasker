//
//  OnboardingViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class OnboardingViewController: UIPageViewController {
    public var presenter: OnboardingViewPresenterProtocol?
    private var boards: [Board] {
        presenter?.boards ?? [Board(image: "test", title: "test", text: "test")]
    }
    
    // MARK: - Init UI Elements
    private lazy var arrayBoardViewController: [BoardViewController] = {
        var boardsVC = [BoardViewController]()
        
        for board in boards {
            boardsVC.append(BoardViewController(boardWith: board))
        }
    
        return boardsVC
    }()
    
    // MARK: - View Life Cycle
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        self.view.backgroundColor = UIColor.Pallette.background
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayBoardViewController[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    // MARK: - @objc
    
}

// MARK: - OnboardingViewProtocol
extension OnboardingViewController: OnboardingViewProtocol {
    func test() {
        print("hello")
    }
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? BoardViewController else { return nil }
        
        if let index = arrayBoardViewController.firstIndex(of: viewController) {
            if index > 0 {
                return arrayBoardViewController[index - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? BoardViewController else { return nil }
        if let index = arrayBoardViewController.index(of: viewController) {
            if index < boards.count - 1 {
                return arrayBoardViewController[index + 1]
            }
        }
        
        return nil
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        boards.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}
