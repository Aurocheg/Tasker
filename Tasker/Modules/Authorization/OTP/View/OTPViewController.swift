//
//  OTPViewController.swift
//  Tasker
//
//  Created by Aurocheg on 9.11.22.
//

import UIKit

final class OTPViewController: UIViewController {
    public var presenter: OTPViewPresenterProtocol!
    
    // MARK: - Variables
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Pallette.background
        
        // MARK: - Adding Subviews
        [titleImageView, mainTitleLabel, textLabel, textFieldsStackView, resendStackView, nextButton].forEach {view in
            self.view.addSubview(view)
        }
        
        [firstTF, secondTF, thirdTF, fourthTF].forEach {textField in
            self.textFieldsStackView.addArrangedSubview(textField)
            textField.font = .systemFont(ofSize: 24, weight: .bold)
        }
        
        [resendButton, resendTextLabel].forEach {element in
            self.resendStackView.addArrangedSubview(element)
        }
        
        // MARK: - Setting Constraints
        setConstraints()
                
        // MARK: - Targets
        resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
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
        
        textLabel.snp.makeConstraints {make -> Void in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(15)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-78)
        }
        
        textFieldsStackView.snp.makeConstraints {make -> Void in
            make.top.equalTo(textLabel.snp.bottom).offset(24)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-48)
        }
        
        [firstTF, secondTF, thirdTF, fourthTF].forEach {textField in
            textField.snp.makeConstraints {make -> Void in
                make.width.equalTo(textFieldsStackView).multipliedBy(0.213)
                make.height.equalTo(70)
            }
        }
        
        resendStackView.snp.makeConstraints {make -> Void in
            make.top.equalTo(textFieldsStackView.snp.bottom).offset(16)
            make.centerX.equalTo(self.view)
        }
        
        nextButton.snp.makeConstraints {make -> Void in
            make.top.equalTo(resendStackView.snp.bottom).offset(24)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).offset(-48)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - @objc
    @objc func resendButtonTapped() {
        presenter.resendButtonTapped()
    }
    
    @objc func nextButtonTapped() {
        presenter.nextButtonTapped()
    }
}

extension OTPViewController: OTPViewProtocol {
    func test() {
        print("hello")
    }
}

