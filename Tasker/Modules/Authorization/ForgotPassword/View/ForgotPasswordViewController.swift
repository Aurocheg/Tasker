//
//  ForgotPasswordViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
    public var presenter: ForgotPasswordViewPresenterProtocol!
    
    // MARK: - Init UI Elements
    private lazy var titleImageView = TitleImageView(image: UIImage(named: "forgotPassword"))
    private lazy var mainTitleLabel = TitleLabel(text: "Forgot Password ?")
    private lazy var textLabel = TextLabel(text: "Enter your phone number then we will send you OTP sms to reset new password.")
    private lazy var numberTF = TextField(type: .number, placeholder: "Enter your number", view: self.view)
    private lazy var sendButton = MainButton(text: "Send OTP", type: .withoutArrow)
    
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
        view.addSubviews(titleImageView, mainTitleLabel, textLabel, numberTF, sendButton)
    }
    
    private func setupLayout() {
        titleImageView.snp.makeConstraints {make -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.centerX.equalTo(view)
            make.width.equalTo(121)
            make.height.equalTo(112)
        }
        
        mainTitleLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(titleImageView.snp.bottom).offset(24)
            make.centerX.equalTo(view)
        }
        
        textLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(15)
            make.centerX.equalTo(view)
            make.width.equalTo(view).offset(-78)
        }
        
        numberTF.snp.makeConstraints {make -> Void in
            make.top.equalTo(textLabel.snp.bottom).offset(24)
            make.centerX.equalTo(view)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(48)
        }
        
        sendButton.snp.makeConstraints {make -> Void in
            make.top.equalTo(numberTF.snp.bottom).offset(16)
            make.centerX.equalTo(view)
            make.width.equalTo(view).offset(-48)
            make.height.equalTo(48)
        }
    }
    
    private func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
    }
    
    private func setupTargets() {
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc
    @objc func sendButtonTapped() {
        presenter.sendButtonTapped()
    }
    
}

// MARK: - ForgotPasswordViewProtocol
extension ForgotPasswordViewController: ForgotPasswordViewProtocol {
    func test() {
        print("hello")
    }
}
