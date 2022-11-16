//
//  HomeViewController.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import UIKit

final class HomeViewController: UIViewController {
    public var presenter: HomeViewPresenterProtocol!
    
    // MARK: - Variables
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
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.clipsToBounds = true
        
        searchBar.layer.cornerRadius = 16
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        
        searchBar.layer.shadowOpacity = 1
        searchBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        searchBar.layer.shadowRadius = 8
        
        return searchBar
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem.selectedImage = UIImage(named: "homeBold")
                
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        [mainTitleLabel, titleImageView, plusButton].forEach {element in
            self.view.addSubview(element)
        }
        
        // MARK: - Setting Constraints
        setConstraints()
        
        // MARK: - Targets
    }
    
    // MARK: - Methods
    private func setConstraints() {
        mainTitleLabel.snp.makeConstraints {make -> Void in
            make.left.equalTo(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        titleImageView.snp.makeConstraints {make -> Void in
            make.left.equalTo(mainTitleLabel.snp.right).offset(11)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(5)
            make.width.height.equalTo(24)
        }
        
        plusButton.snp.makeConstraints {make -> Void in
            make.right.equalTo(self.view.snp.right).offset(-24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(-5)
            make.width.height.equalTo(44)
        }
    }
    
    // MARK: - @objc
    
}

extension HomeViewController: HomeViewProtocol {
    func test() {
        print("hello")
    }
}

