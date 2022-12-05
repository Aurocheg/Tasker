//
//  SignInViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController, SignInViewProtocol {
    var presenter: SignInPresenterProtocol!
    var configurator: SignInConfiguratorProtocol = SignInConfigurator()
    
    private let facebookImage = UIImage(named: "facebook")
    private let instagramImage = UIImage(named: "instagram")
    private let gmailImage = UIImage(named: "gmail")
    private let socialImageTintColor = UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white)
    
    // MARK: - UI Elements
    private lazy var mainTitleLabel = TitleLabel(text: "Sign In")
    private lazy var titleImageView = TitleImageView(image: UIImage(named: "signInAndUp"))
    
    private lazy var nameTF = TextField(type: .name, placeholder: "Name", view: view)
    private lazy var passwordTF = TextField(type: .password, placeholder: "Password", view: view)
    private lazy var forgotButton = SecondaryButton(text: "Forgot password ?")
    private lazy var signInButton = LargeButton(text: "Sign In", type: .withoutArrow)
    
    private lazy var signInWithLabel = TextLabel(text: "Or sign in with", size: 16)
    private lazy var socialStackView = StackView(spacing: 16)
    private lazy var facebookButton = SecondaryButton(type: .withBackground)
    private lazy var instagramButton = SecondaryButton(type: .withBackground)
    private lazy var gmailButton = SecondaryButton(type: .withBackground)
    
    private lazy var bottomStackView = StackView(spacing: 8)
    private lazy var accountLabel = TextLabel(text: "Don't have an account?", size: 16)
    private lazy var signUpButton: UIButton = {
        let textColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        let button = SecondaryButton(text: "Sign Up", textColor: textColor)
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
    
    // MARK: - SignInViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(mainTitleLabel, titleImageView, nameTF, passwordTF, forgotButton, signInButton, signInWithLabel, socialStackView, bottomStackView)
        
        socialStackView.addArrangedSubviews([facebookButton, instagramButton, gmailButton])
        bottomStackView.addArrangedSubviews([accountLabel, signUpButton])
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
        
        nameTF.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(39)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(24)
        }
        
        passwordTF.snp.makeConstraints {
            $0.top.equalTo(nameTF.snp.bottom).offset(16)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(24)
        }
        
        forgotButton.snp.makeConstraints {
            $0.top.equalTo(passwordTF.snp.bottom).offset(16)
            $0.right.equalTo(view).offset(-24)
            $0.width.equalTo(143)
            $0.height.equalTo(24)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(forgotButton.snp.bottom).offset(24)
            $0.left.equalTo(view).offset(24)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
        
        signInWithLabel.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(24)
            $0.centerX.equalTo(view)
        }
        
        socialStackView.snp.makeConstraints {
            $0.top.equalTo(signInWithLabel.snp.bottom).offset(16)
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
        }
        
        [facebookButton, instagramButton, gmailButton].forEach {button in
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
        signInWithLabel.drawLineOnBothSides(view: view)
        
        [facebookButton, instagramButton, gmailButton].forEach {
            for image in [facebookImage, instagramImage, gmailImage] {
                $0.setImage(image)
            }
        }
    }
    
    func setupTargets() {
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        forgotButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
        
    // MARK: - Targets
    @objc func signInButtonTapped() {
        presenter.signInButtonTapped()
    }
    
    @objc func forgotPasswordButtonTapped() {
        presenter.forgotButtonTapped()
    }
    
    @objc func signUpButtonTapped() {
        presenter.signUpButtonTapped()
    }
}
