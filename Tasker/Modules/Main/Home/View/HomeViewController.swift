//
//  HomeViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class HomeViewController: UIViewController {
    public var presenter: HomeViewPresenterProtocol!
    
    // MARK: - Properties
    private let titleImage = UIImage(named: "dashboard")?.withTintColor(UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white), renderingMode: .alwaysOriginal)
    private let plusImage = UIImage(named: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    
    // MARK: - Init UI Elements
    private lazy var mainTitleLabel = TitleLabel(text: "Dashboard")
    private lazy var titleImageView = TitleImageView(image: titleImage)
    private lazy var plusButton: SecondaryButton = {
        let button = SecondaryButton(type: .withBackground, image: plusImage, radius: 12)
        let lightColor = UIColor.Pallette.buttonBackground
        let darkColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        
        button.backgroundColor = UIColor.color(light: lightColor, dark: darkColor)
        button.layer.borderWidth = 0
        
        return button
    }()
    private lazy var searchTF = TextField(type: .search, placeholder: "Search", view: view)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
    }
    
    // MARK: - Methods
    private func setupHierarchy() {
        view.addSubviews(mainTitleLabel, titleImageView, plusButton, searchTF)
    }
    
    private func setupLayout() {
        mainTitleLabel.snp.makeConstraints {
            $0.left.equalTo(24)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        titleImageView.snp.makeConstraints {
            $0.left.equalTo(mainTitleLabel.snp.right).offset(11)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(3)
            $0.width.height.equalTo(24)
        }
        
        plusButton.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-24)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-5)
            $0.width.height.equalTo(44)
        }
        
        searchTF.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(plusButton.snp.bottom).offset(24)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
    }
    
    private func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
    }
    
    private func setupTargets() {
        
    }
    
    // MARK: - @objc
}

// MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func test() {
        print("hello")
    }
}

