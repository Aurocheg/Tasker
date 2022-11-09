//
//  ResetPasswordViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class ResetPasswordViewController: UIViewController {
    public var presenter: ResetPasswordViewPresenterProtocol!
    
    // MARK: - Variables
    
    // MARK: - Init UI Elements
    private lazy var titleImageView = TitleImageView(image: UIImage(named: "resetPassword"))
    private lazy var mainTitleLabel = TitleLabel(text: "Reset new password")
    private lazy var passwordTF = TextField(type: .password, placeholder: "Enter new password")
    private lazy var confirmPasswordTF = TextField(type: .password, placeholder: "Confirm password")
    private lazy var saveButton = MainButton(text: "Save changes", type: .withoutArrow)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        [titleImageView, mainTitleLabel, passwordTF, confirmPasswordTF, saveButton].forEach {view in
            self.view.addSubview(view)
        }
    
        // MARK: - Setting Constraints
        setConstraints()
        
        // MARK: - Targets
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Methods
    private func setConstraints() {
        titleImageView.snp.makeConstraints {make -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(24)
            make.centerX.equalTo(self.view)
            make.width.equalTo(121)
            make.height.equalTo(112)
        }
        
        mainTitleLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(titleImageView.snp.bottom).offset(24)
            make.centerX.equalTo(self.view)
        }
        
        passwordTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(39)
        }
        
        confirmPasswordTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(passwordTF.snp.bottom).offset(16)
        }
        
        [passwordTF, confirmPasswordTF].forEach {textField in
            textField.snp.makeConstraints {make -> Void in
                make.centerX.equalTo(self.view)
                make.width.equalTo(self.view).offset(-48)
                make.height.equalTo(48)
            }
        }
        
        saveButton.snp.makeConstraints {make -> Void in
            make.top.equalTo(confirmPasswordTF.snp.bottom).offset(24)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - @objc
    @objc func saveButtonTapped() {
        presenter.saveButtonTapped()
    }
}

extension ResetPasswordViewController: ResetPasswordViewProtocol {
    func test() {
        print("hello")
    }
}

