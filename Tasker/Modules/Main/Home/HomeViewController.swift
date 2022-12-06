//
//  HomeViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol!
    var configurator: HomeConfiguratorProtocol = HomeConfigurator()
    
    private let titleImage = UIImage(named: "dashboard")?.withTintColor(UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white), renderingMode: .alwaysOriginal)
    private let plusImage = UIImage(named: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    private let buttonTitles = ["Overview", "Analytics"]
    
    // MARK: - UI Elements
    private lazy var mainTitleLabel = TitleLabel(text: "Dashboard")
    private lazy var titleImageView = TitleImageView(image: titleImage)
    private lazy var plusButton: SecondaryButton = {
        let button = SecondaryButton(type: .withBackground, radius: 12)
        let lightColor = UIColor.Pallette.buttonBackground
        let darkColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        
        button.backgroundColor = UIColor.color(light: lightColor, dark: darkColor)
        button.layer.borderWidth = 0
        button.setImage(plusImage, for: .normal)
        
        return button
    }()
    private lazy var searchTF: CustomTextField = {
        let textField = CustomTextField(type: .search, view: view)
        let placeholderColor = UIColor.color(light: UIColor(red: 0.635, green: 0.62, blue: 0.714, alpha: 1),
                                             dark: UIColor(red: 0.937, green: 0.945, blue: 0.953, alpha: 1))
        textField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        return textField
    }()
    private lazy var segmentedControl = SegmentedControl(buttonTitles: buttonTitles)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
        
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    // MARK: - HomeViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(mainTitleLabel, titleImageView, plusButton, searchTF, segmentedControl)
    }
    
    func setupLayout() {
        mainTitleLabel.snp.makeConstraints {
            $0.left.equalTo(24)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        titleImageView.snp.makeConstraints {
            $0.left.equalTo(mainTitleLabel.snp.right).offset(11)
            $0.top.equalTo(mainTitleLabel.snp.top).offset(3)
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
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchTF.snp.bottom).offset(24)
            $0.left.equalToSuperview().inset(24)
            $0.height.equalTo(40)
            $0.width.equalTo(view).multipliedBy(0.608)
        }
    }
    
    func setupProperties() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.Pallette.background
        segmentedControl.backgroundColor = .clear
    }
    
    func setupTargets() {

    }
    
    // MARK: - Private Methods
    
    // MARK: - Targets
}
