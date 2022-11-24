//
//  SignInViewController.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController {
    public var presenter: SignInViewPresenterProtocol!
    
    // MARK: - Properties
    
    private let facebookImage = UIImage(named: "facebook")
    private let instagramImage = UIImage(named: "instagram")
    private let gmailImage = UIImage(named: "gmail")
    private let socialImageTintColor = UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white)
    
    // MARK: - Init UI Elements
    
    private lazy var mainTitleLabel = TitleLabel(text: "Sign In")
    private lazy var titleImageView = TitleImageView(image: UIImage(named: "signInAndUp"))
    private lazy var nameTF = TextField(type: .name, placeholder: "Name", view: self.view)
    private lazy var passwordTF = TextField(type: .password, placeholder: "Password", view: self.view)
    private lazy var forgotPasswordButton = SecondaryButton(text: "Forgot password ?")
    private lazy var signInButton = MainButton(text: "Sign In", type: .withoutArrow)
    private lazy var signInWithLabel = TextLabel(text: "Or sign in with", size: 16)
    private lazy var socialStackView = StackView(spacing: 16)
    private lazy var facebookButton = SecondaryButton(type: .withBackground,
                                                      image: facebookImage?.withTintColor(socialImageTintColor))
    private lazy var instagramButton = SecondaryButton(type: .withBackground,
                                                       image: instagramImage?.withTintColor(socialImageTintColor))
    private lazy var gmailButton = SecondaryButton(type: .withBackground,
                                                   image: gmailImage?.withTintColor(socialImageTintColor))
    private lazy var bottomStackView = StackView(spacing: 8)
    private lazy var accountLabel = TextLabel(text: "Don't have an account?", size: 16)
    private lazy var signUpButton: UIButton = {
        let textColor = UIColor(red: 1, green: 0.541, blue: 0, alpha: 1)
        let button = SecondaryButton(text: "Sign Up", textColor: textColor)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
        
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        
        [mainTitleLabel, titleImageView, nameTF, passwordTF, forgotPasswordButton, signInButton, signInWithLabel, socialStackView, bottomStackView].forEach {view in
            self.view.addSubview(view)
        }
        
        [facebookButton, instagramButton, gmailButton].forEach {button in
            socialStackView.addArrangedSubview(button)
        }
        
        [accountLabel, signUpButton].forEach {view in
            bottomStackView.addArrangedSubview(view)
        }
        
        // MARK: - Setting Constraints
        
        setConstraints()
        
        // MARK: - Additional UI Improvements
        
        signInWithLabel.drawLineOnBothSides(view: self.view)
        
        // MARK: - Targets
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Methods
    
    private func setConstraints() {
        mainTitleLabel.snp.makeConstraints {make -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(35)
        }
        
        titleImageView.snp.makeConstraints {make -> Void in
            make.right.equalTo(self.mainTitleLabel).offset(45)
            make.bottom.equalTo(self.mainTitleLabel)
            make.width.height.equalTo(34)
        }
        
        nameTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(39)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(48)
            make.left.equalTo(self.view).offset(24)
        }
        
        passwordTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(nameTF.snp.bottom).offset(16)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(48)
            make.left.equalTo(self.view).offset(24)
        }
        
        forgotPasswordButton.snp.makeConstraints {make -> Void in
            make.top.equalTo(passwordTF.snp.bottom).offset(16)
            make.right.equalTo(self.view).offset(-24)
            make.width.equalTo(143)
            make.height.equalTo(24)
        }
        
        signInButton.snp.makeConstraints {make -> Void in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(24)
            make.left.equalTo(self.view).offset(24)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(48)
        }
        
        signInWithLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(signInButton.snp.bottom).offset(24)
            make.centerX.equalTo(self.view)
        }
        
        socialStackView.snp.makeConstraints {make -> Void in
            make.top.equalTo(signInWithLabel.snp.bottom).offset(16)
            make.centerX.equalTo(self.view)
            make.height.equalTo(48)
        }
        
        [facebookButton, instagramButton, gmailButton].forEach {button in
            button.snp.makeConstraints {make -> Void in
                make.width.height.equalTo(48)
            }
        }
        
        bottomStackView.snp.makeConstraints {make -> Void in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.centerX.equalTo(self.view)
        }
    }
    
    // MARK: - @objc
    
    @objc func signInButtonTapped() {
        presenter.signInButtonTapped()
    }
    
    @objc func forgotPasswordButtonTapped() {
        presenter.forgotPasswordButtonTapped()
    }
    
    @objc func signUpButtonTapped() {
        presenter.signUpButtonTapped()
    }

}

// MARK: - SignInViewProtocol

extension SignInViewController: SignInViewProtocol {
    func test() {
        print("hello")
    }
}
