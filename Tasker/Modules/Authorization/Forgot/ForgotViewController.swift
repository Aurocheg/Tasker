//
//  ForgotPasswordViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class ForgotViewController: UIViewController, ForgotViewProtocol {
    var presenter: ForgotPresenterProtocol!
    var configurator: ForgotConfiguratorProtocol = ForgotConfigurator()
    
    private let titleImage = UIImage(named: "forgotPassword")
    
    // MARK: - UI Elements
    private lazy var titleImageView = TitleImageView(image: titleImage)
    private lazy var mainTitleLabel = TitleLabel(text: "Forgot Password ?")
    private lazy var textLabel = TextLabel(text: "Enter your phone number then we will send you OTP sms to reset new password.")
    private lazy var numberTF = TextField(type: .number, placeholder: "Enter your number", view: self.view)
    private lazy var sendButton = LargeButton(text: "Send OTP", type: .withoutArrow)
    
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
    
    // MARK: - ForgotViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(titleImageView, mainTitleLabel, textLabel, numberTF, sendButton)
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
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(15)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-78)
        }
        
        numberTF.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(24)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(numberTF.snp.bottom).offset(16)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
    }
    
    func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
    }
    
    func setupTargets() {
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Targets
    @objc func sendButtonTapped() {
        presenter.sendButtonTapped()
    }
}
