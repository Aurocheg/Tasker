//
//  SignUpViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class SignUpViewController: UIViewController {
    public var presenter: SignUpViewPresenterProtocol!
    
    // MARK: - Properties
    private let facebookImage = UIImage(named: "facebook")
    private let instagramImage = UIImage(named: "instagram")
    private let gmailImage = UIImage(named: "gmail")
    private let socialImageTintColor = UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white)
    
    // MARK: - Init UI Elements
    private lazy var mainTitleLabel = TitleLabel(text: "Sign Up")
    private lazy var titleImageView = TitleImageView(image: UIImage(named: "signInAndUp"))
    private lazy var emailTF = TextField(type: .email, placeholder: "Email", view: self.view)
    private lazy var passwordTF = TextField(type: .password, placeholder: "Password", view: self.view)
    private lazy var confirmPasswordTF = TextField(type: .password, placeholder: "Confirm password", view: self.view)
    private lazy var signUpButton = MainButton(text: "Sign Up", type: .withoutArrow)
    private lazy var signUpWithLabel = TextLabel(text: "Or sign up with", size: 16)
    private lazy var socialStackView = StackView(spacing: 16)
    private lazy var facebookButton = SecondaryButton(type: .withBackground,
                                                      image: facebookImage?.withTintColor(socialImageTintColor))
    private lazy var instagramButton = SecondaryButton(type: .withBackground,
                                                       image: instagramImage?.withTintColor(socialImageTintColor))
    private lazy var gmailButton = SecondaryButton(type: .withBackground,
                                                   image: gmailImage?.withTintColor(socialImageTintColor))
    private lazy var bottomStackView = StackView(spacing: 8)
    private lazy var accountLabel = TextLabel(text: "Already have an account?", size: 16)
    private lazy var signInButton: UIButton = {
        let textColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        let button = SecondaryButton(text: "Sign In", textColor: textColor)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
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
        view.addSubviews(mainTitleLabel, titleImageView, emailTF, passwordTF, confirmPasswordTF, signUpButton, signUpWithLabel, socialStackView, bottomStackView)
        
        socialStackView.addArrangedSubviews([facebookButton, instagramButton, gmailButton])
        bottomStackView.addArrangedSubviews([accountLabel, signInButton])
    }
    
    private func setupLayout() {
        mainTitleLabel.snp.makeConstraints {make -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
        }
        
        titleImageView.snp.makeConstraints {make -> Void in
            make.right.equalTo(mainTitleLabel).offset(45)
            make.bottom.equalTo(mainTitleLabel)
            make.width.height.equalTo(34)
        }
        
        emailTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(39)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(48)
            make.left.equalTo(view).offset(24)
        }
        
        passwordTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(emailTF.snp.bottom).offset(16)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(48)
            make.left.equalTo(view).offset(24)
        }
        
        confirmPasswordTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(passwordTF.snp.bottom).offset(16)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(48)
            make.left.equalTo(view).offset(24)
        }
        
        signUpButton.snp.makeConstraints {make -> Void in
            make.top.equalTo(confirmPasswordTF.snp.bottom).offset(24)
            make.left.equalTo(view).offset(24)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(48)
        }
        
        signUpWithLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(signUpButton.snp.bottom).offset(24)
            make.centerX.equalTo(view)
        }
        
        socialStackView.snp.makeConstraints {make -> Void in
            make.top.equalTo(signUpWithLabel.snp.bottom).offset(16)
            make.centerX.equalTo(view)
            make.height.equalTo(48)
        }
        
        [facebookButton, instagramButton, gmailButton].forEach {button in
            button.snp.makeConstraints {make -> Void in
                make.width.height.equalTo(48)
            }
        }
        
        bottomStackView.snp.makeConstraints {make -> Void in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.centerX.equalTo(view)
        }
    }
    
    private func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
        signUpWithLabel.drawLineOnBothSides(view: view)
    }
    
    private func setupTargets() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        [emailTF, passwordTF].forEach {textField in
            textField.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
        }
    }
    
    private func applyValidation(value: String, type: TextFieldType) {
        if value.isValidTextField(type: type) {
            emailTF.layer.borderColor = UIColor.white.cgColor
        } else {
            emailTF.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    // MARK: - @objc
    @objc func textFieldChanged(_ sender: UITextField) {
        let value = sender.text?.trim()
        switch sender {
        case emailTF:
            presenter.emailValue = value
            applyValidation(value: value ?? "", type: .email)
            
        case passwordTF:
            presenter.passwordValue = value
            applyValidation(value: value ?? "", type: .password)
        default:
            break
        }
    }
    
    @objc func signUpButtonTapped() {
        presenter.signUpButtonTapped {[weak self] success in
            guard let self = self else { return }
            var message = ""
            
            if success {
                message = "User was successfully created."
            } else {
                message = "There was an error."
            }
            
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
}

// MARK: - SignUpViewProtocol
extension SignUpViewController: SignUpViewProtocol {
    func test() {
        print("hello")
    }
}

