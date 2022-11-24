//
//  TextField.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit
import SnapKit

final class TextField: UITextField {
    
    // MARK: - Enum
    
    enum SelfType {
        case password
        case name
        case number
        case email
        case search
    }
    
    // MARK: - Properties
    
    private var textPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24)
    private var isPasswordTF = false
    private var needNumberIcon = true
    private var view: UIView?

    // MARK: - Init Methods
    
    init(type: SelfType, placeholder: String = "", alignment: NSTextAlignment = .left, icon: Bool = true, view: UIView) {
        super.init(frame: .zero)
        self.view = view
        
        // MARK: - Colors
        
        let color = UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white)
        let placeholderColor = UIColor.color(light: UIColor(red: 0.635, green: 0.62, blue: 0.714, alpha: 1),
                                             dark: UIColor(red: 0.937, green: 0.945, blue: 0.953, alpha: 1))
        self.backgroundColor = UIColor.color(light: .white, dark: .clear)
        
        // MARK: - Text
        
        self.textColor = color
        self.textAlignment = alignment
        self.font = .systemFont(ofSize: 16, weight: .medium)
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )

        // MARK: - Borders
        
        self.layer.cornerRadius = 16
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        
        // MARK: - Shadow
        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.delegate = self
                
        // MARK: - Text Field Type
        
        switch type {
        case .password:
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            isPasswordTF = true
            
            let passwordIcon = UIImage(named: "password")?.withTintColor(color, renderingMode: .alwaysOriginal)
            let eyesIcon = UIImage(named: "eyes")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            setLeftIcon(passwordIcon)
            setRightIcon(eyesIcon)
            
        case .name:
            self.textContentType = .name
            
            let nameIcon = UIImage(named: "user")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            setLeftIcon(nameIcon)
            
        case .number:
            self.textContentType = .telephoneNumber
            self.keyboardType = .numberPad
            
            let phoneIcon = UIImage(named: "phone")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            if icon {
                setLeftIcon(phoneIcon)
            } else {
                needNumberIcon = false
            }
            
        case .email:
            self.textContentType = .emailAddress
            self.keyboardType = .emailAddress
            self.autocorrectionType = .no
            self.autocapitalizationType = .none
            
            let mailIcon = UIImage(named: "mail")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            setLeftIcon(mailIcon)
        case .search:
            let searchIcon = UIImage(named: "search")?.withTintColor(color, renderingMode: .alwaysOriginal)
            let filterIcon = UIImage(named: "filter")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            setLeftIcon(searchIcon)
            setRightIcon(filterIcon)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Rect
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        if isPasswordTF {
            textPadding.right = 48
        }
        
        if !needNumberIcon {
            textPadding.right = 0
        }
        
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        if isPasswordTF {
            textPadding.right = 48
        }
        
        if !needNumberIcon {
            textPadding.right = 0
        }
        
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    // MARK: - Methods
    
    private func setLeftIcon(_ icon: UIImage?) {
        guard let icon = icon else { return }
        let imageView = UIImageView()
        imageView.image = icon
        imageView.frame = CGRect(x: 10, y: -5, width: 24, height: 24)
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 17)
        view.backgroundColor = .clear
        view.addSubview(imageView)
        
        leftView = view
        leftViewMode = .always
    }
    
    private func setRightIcon(_ icon: UIImage?) {
        guard let icon = icon else { return }
        let button = UIButton()
        
        button.setImage(icon, for: .normal)
        self.addSubview(button)
        
        button.snp.makeConstraints {make -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-24)
            make.width.height.equalTo(24)
        }
        
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc func showPasswordButtonTapped() {
        self.isSecureTextEntry.toggle()
    }
}

// MARK: - UITextFieldDelegate

extension TextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.Pallette.buttonBackground.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.white.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view?.endEditing(true)
        return false
    }
}
