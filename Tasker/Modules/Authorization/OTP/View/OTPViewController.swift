//
//  OTPViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class OTPViewController: UIViewController {
    public var presenter: OTPViewPresenterProtocol!
    
    // MARK: - Properties
    private var otpText = String()
    private var textFieldsArray = [TextField]()
    
    // MARK: - Init UI Elements
    private lazy var titleImageView = TitleImageView(image: UIImage(named: "OTP"))
    private lazy var mainTitleLabel = TitleLabel(text: "Enter OTP")
    private lazy var textLabel = TextLabel(text: "Enter the OTP we just sent to your phone then start reset your new password.")
    private lazy var textFieldsStackView = StackView(spacing: 16)
    private lazy var firstTF = TextField(type: .number, alignment: .center, icon: false, view: self.view)
    private lazy var secondTF = TextField(type: .number, alignment: .center, icon: false, view: self.view)
    private lazy var thirdTF = TextField(type: .number, alignment: .center, icon: false, view: self.view)
    private lazy var fourthTF = TextField(type: .number, alignment: .center, icon: false, view: self.view)
    private lazy var resendStackView = StackView(spacing: 7)
    private lazy var resendButton = SecondaryButton(text: "Resend OTP")
    private lazy var resendTextLabel = TextLabel(text: "in 00:30s")
    private lazy var nextButton = MainButton(text: "Next", type: .withRightArrow)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        [firstTF, secondTF, thirdTF, fourthTF].forEach {
            textFieldsArray.append($0)
        }
        
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupTargets()
    }
    
    // MARK: - Methods
    private func setupHierarchy() {
        view.addSubviews(titleImageView, mainTitleLabel, textLabel, textFieldsStackView, resendStackView, nextButton)
        
        textFieldsStackView.addArrangedSubviews(textFieldsArray)
        resendStackView.addArrangedSubviews([resendButton, resendTextLabel])
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
    
    private func setupProperties() {
        view.backgroundColor = UIColor.Pallette.background
        
        textFieldsArray.forEach {
            $0.font = .systemFont(ofSize: 24, weight: .bold)
            $0.textContentType = .oneTimeCode
        }
        firstTF.becomeFirstResponder()
    }
    
    private func setupTargets() {
        textFieldsArray.forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .touchUpInside)
        }
        
        resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc
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
    
    // MARK: - Methods
    private func dismissKeyboard() {
        for textField in textFieldsArray {
            otpText += textField.text ?? ""
        }
        view.endEditing(true)
    }
}

extension OTPViewController: OTPViewProtocol {
    func test() {
        print("hello")
    }
}

