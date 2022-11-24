//
//  ResetPasswordViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class ResetPasswordViewController: UIViewController {
    public var presenter: ResetPasswordViewPresenterProtocol!
        
    // MARK: - Init UI Elements
    private lazy var titleImageView = TitleImageView(image: UIImage(named: "resetPassword"))
    private lazy var mainTitleLabel = TitleLabel(text: "Reset new password")
    private lazy var passwordTF = TextField(type: .password, placeholder: "Enter new password", view: self.view)
    private lazy var confirmPasswordTF = TextField(type: .password, placeholder: "Confirm password", view: self.view)
    private lazy var saveButton = MainButton(text: "Save changes", type: .withoutArrow)
    
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
        view.addSubviews(titleImageView, mainTitleLabel, passwordTF, confirmPasswordTF, saveButton)
    }
    
    private func setupLayout() {
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
    
    private func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
    }
    
    private func setupTargets() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc
    @objc func saveButtonTapped() {
        presenter.saveButtonTapped()
    }
}

// MARK: - ResetPasswordViewProtocol
extension ResetPasswordViewController: ResetPasswordViewProtocol {
    func test() {
        print("hello")
    }
}

