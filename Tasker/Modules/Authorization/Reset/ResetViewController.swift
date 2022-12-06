//
//  ResetViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ResetViewController: UIViewController, ResetViewProtocol {
    var presenter: ResetPresenterProtocol!
    var configurator: ResetConfiguratorProtocol = ResetConfigurator()
    
    private let titleImage = UIImage(named: "resetPassword")
    
    // MARK: - UI Elements
    private lazy var titleImageView = TitleImageView(image: titleImage)
    private lazy var mainTitleLabel = TitleLabel(text: "Reset new password")
    private lazy var passwordTF = CustomTextField(type: .password, placeholder: "Enter new password", view: view)
    private lazy var confirmPasswordTF = CustomTextField(type: .password, placeholder: "Confirm password", view: view)
    private lazy var saveButton = LargeButton(text: "Save changes", type: .withoutArrow)
    
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
    
    // MARK: - ResetViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(titleImageView, mainTitleLabel, passwordTF, confirmPasswordTF, saveButton)
    }
    
    func setupLayout() {
        titleImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.centerX.equalTo(view)
            $0.width.equalTo(121)
            $0.height.equalTo(112)
        }
        
        mainTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleImageView.snp.bottom).offset(24)
            $0.centerX.equalTo(view)
        }
        
        passwordTF.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(39)
        }
        
        confirmPasswordTF.snp.makeConstraints {
            $0.top.equalTo(passwordTF.snp.bottom).offset(16)
        }
        
        [passwordTF, confirmPasswordTF].forEach {textField in
            textField.snp.makeConstraints {
                $0.centerX.equalTo(view)
                $0.width.equalTo(view).offset(-48)
                $0.height.equalTo(48)
            }
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTF.snp.bottom).offset(24)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
    }
    
    func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
    }
    
    func setupTargets() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
        
    // MARK: - Targets
    @objc func saveButtonTapped() {
        presenter.saveButtonTapped()
    }
}
