//
//  SignUpViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class SignUpViewController: UIViewController, SignUpViewProtocol {
    var presenter: SignUpPresenterProtocol!
    var configurator: SignUpConfiguratorProtocol = SignUpConfigurator()
    
    // MARK: - Properties
    private let socialImages = [
        UIImage(named: "facebook"),
        UIImage(named: "instagram"),
        UIImage(named: "gmail")
    ]
    private var socialButtons = [SecondaryButton]()
    private let titleImage = UIImage(named: "signInAndUp")
    private let socialImageTintColor = UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white)
    
    // MARK: - UI Elements
    private lazy var mainTitleLabel = TitleLabel(text: "Sign Up")
    private lazy var titleImageView = TitleImageView(image: titleImage)
    
    private lazy var emailTF = CustomTextField(type: .email, placeholder: "Email", view: view)
    private lazy var passwordTF = CustomTextField(type: .password, placeholder: "Password", view: view)
    private lazy var confirmPasswordTF = CustomTextField(type: .password, placeholder: "Confirm password", view: view)
    private lazy var signUpButton = LargeButton(text: "Sign Up", type: .withoutArrow)
    
    private lazy var signUpWithLabel = TextLabel(text: "Or sign up with", size: 16)
    private lazy var socialStackView = CustomStackView(spacing: 16)
    private lazy var facebookButton = SecondaryButton(type: .withBackground)
    private lazy var instagramButton = SecondaryButton(type: .withBackground)
    private lazy var gmailButton = SecondaryButton(type: .withBackground)
    
    private lazy var bottomStackView = CustomStackView(spacing: 8)
    private lazy var accountLabel = TextLabel(text: "Already have an account?", size: 16)
    private lazy var signInButton: UIButton = {
        let textColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        let button = SecondaryButton(text: "Sign In", textColor: textColor)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
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
    
    // MARK: - SignUpViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(mainTitleLabel, titleImageView, emailTF, passwordTF, confirmPasswordTF, signUpButton, signUpWithLabel, socialStackView, bottomStackView)
        
        for button in [facebookButton, instagramButton, gmailButton] {
            socialButtons.append(button)
        }
        
        socialStackView.addArrangedSubviews(socialButtons)
        bottomStackView.addArrangedSubviews([accountLabel, signInButton])
    }
    
    func setupLayout() {
        mainTitleLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
        }
        
        titleImageView.snp.makeConstraints {
            $0.right.equalTo(mainTitleLabel).offset(45)
            $0.bottom.equalTo(mainTitleLabel)
            $0.width.height.equalTo(34)
        }
        
        emailTF.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(39)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(24)
        }
        
        passwordTF.snp.makeConstraints {
            $0.top.equalTo(emailTF.snp.bottom).offset(16)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(24)
        }
        
        confirmPasswordTF.snp.makeConstraints {
            $0.top.equalTo(passwordTF.snp.bottom).offset(16)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(24)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTF.snp.bottom).offset(24)
            $0.left.equalTo(view).offset(24)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
        
        signUpWithLabel.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(24)
            $0.centerX.equalTo(view)
        }
        
        socialStackView.snp.makeConstraints {
            $0.top.equalTo(signUpWithLabel.snp.bottom).offset(16)
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
        }
        
        socialButtons.forEach {button in
            button.snp.makeConstraints {
                $0.width.height.equalTo(48)
            }
        }
        
        bottomStackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.centerX.equalTo(view)
        }
    }
    
    func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
        signUpWithLabel.drawLineOnBothSides(view: view)
        
        for (i, _) in socialButtons.enumerated() {
            for _ in socialImages {
                let modifiedImage = socialImages[i]?.withTintColor(socialImageTintColor, renderingMode: .alwaysOriginal)
                socialButtons[i].setImage(modifiedImage, for: .normal)
            }
        }
    }
    
    func setupTargets() {
        [emailTF, passwordTF].forEach {
            $0.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
        }
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    func applyValidation(with value: String, type: TextFieldType) {
        if value.isValidTextField(type: type) {
            emailTF.layer.borderColor = UIColor.white.cgColor
        } else {
            emailTF.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
        
    // MARK: - Targets
    @objc func textFieldChanged(_ sender: UITextField) {
        let value = sender.text?.trim()
        switch sender {
        case emailTF:
            presenter.emailValue = value
            applyValidation(with: value ?? "", type: .email)
            
        case passwordTF:
            presenter.passwordValue = value
            applyValidation(with: value ?? "", type: .password)
        default:
            break
        }
    }
    
    @objc func signUpButtonTapped() {
        presenter.signUpButtonTapped {[weak self] success in
            guard let self = self else { return }
            var message: String
            
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
    
    @objc func signInButtonTapped() {
        presenter.signInButtonTapped()
    }
}
