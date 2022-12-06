//
//  OTPViewController.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import UIKit

final class OTPViewController: UIViewController, OTPViewProtocol {
    var presenter: OTPPresenterProtocol!
    var configurator: OTPConfiguratorProtocol = OTPConfigurator()
    
    private let titleImage = UIImage(named: "OTP")
    private var otpText = String()
    private var textFieldsArray = [CustomTextField]()
    
    // MARK: - UI Elements
    private lazy var titleImageView = TitleImageView(image: titleImage)
    private lazy var mainTitleLabel = TitleLabel(text: "Enter OTP")
    private lazy var textLabel = TextLabel(text: "Enter the OTP we just sent to your phone then start reset your new password.")
    
    private lazy var textFieldsStackView = CustomStackView(spacing: 16)
    private lazy var firstTF = CustomTextField(type: .number, alignment: .center, icon: false, view: view)
    private lazy var secondTF = CustomTextField(type: .number, alignment: .center, icon: false, view: view)
    private lazy var thirdTF = CustomTextField(type: .number, alignment: .center, icon: false, view: view)
    private lazy var fourthTF = CustomTextField(type: .number, alignment: .center, icon: false, view: view)
    
    private lazy var resendStackView = CustomStackView(spacing: 7)
    private lazy var resendButton = SecondaryButton(text: "Resend OTP")
    private lazy var resendTextLabel = TextLabel(text: "in 00:30s")
    private lazy var nextButton = LargeButton(text: "Next", type: .withRightArrow)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [firstTF, secondTF, thirdTF, fourthTF].forEach {
            textFieldsArray.append($0)
        }
        
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
        
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    // MARK: - OTPViewProtocol Methods
    func setupHierarchy() {
        view.addSubviews(titleImageView, mainTitleLabel, textLabel, textFieldsStackView, resendStackView, nextButton)
        
        textFieldsStackView.addArrangedSubviews(textFieldsArray)
        resendStackView.addArrangedSubviews([resendButton, resendTextLabel])
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
        
        textFieldsStackView.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(24)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
        }
        
        textFieldsArray.forEach {textField in
            textField.snp.makeConstraints {
                $0.width.equalTo(textFieldsStackView).multipliedBy(0.213)
                $0.height.equalTo(70)
            }
        }
        
        resendStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldsStackView.snp.bottom).offset(16)
            $0.centerX.equalTo(view)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(resendStackView.snp.bottom).offset(24)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view).offset(-48)
            $0.height.equalTo(48)
        }
    }
    
    func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
        
        textFieldsArray.forEach {
            $0.font = .systemFont(ofSize: 24, weight: .bold)
            $0.textContentType = .oneTimeCode
        }
        firstTF.becomeFirstResponder()
    }
    
    func setupTargets() {
        textFieldsArray.forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .touchUpInside)
        }
        
        resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    private func dismissKeyboard() {
        for textField in textFieldsArray {
            otpText += textField.text ?? ""
        }
        view.endEditing(true)
    }

    // MARK: - Targets
    @objc func textFieldDidChange(_ sender: UITextField) {
        let text = sender.text
        
        if text?.count == 1 {
            switch sender {
                case firstTF: firstTF.becomeFirstResponder()
                case secondTF: secondTF.becomeFirstResponder()
                case thirdTF: thirdTF.becomeFirstResponder()
                case fourthTF:
                    fourthTF.resignFirstResponder()
                    dismissKeyboard()
                default: break
            }
        }
        
        if text?.count == 0 {
            switch sender {
                case firstTF: firstTF.becomeFirstResponder()
                case secondTF: secondTF.becomeFirstResponder()
                case thirdTF: thirdTF.becomeFirstResponder()
                case fourthTF: fourthTF.becomeFirstResponder()
                default: break
            }
        }

    }
    
    @objc func resendButtonTapped() {
        presenter.resendButtonTapped()
    }
    
    @objc func nextButtonTapped() {
        presenter.nextButtonTapped()
    }
}
