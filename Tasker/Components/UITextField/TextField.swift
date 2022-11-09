//
//  TextField.swift
//  Tasker
//
//  Created by Aurocheg on 6.11.22.
//

import UIKit
import SnapKit

final class TextField: UITextField {
    enum SelfType {
        case password
        case name
        case number
        case email
    }
    
    private var textPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24)
    private var isPasswordTF = false
    private var needNumberIcon = true

    init(type: SelfType, placeholder: String = "", alignment: NSTextAlignment = .left, icon: Bool = true) {
        super.init(frame: .zero)
        
        let color = UIColor.color(light: UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1), dark: .white)
        
        self.placeholder = placeholder
        self.textAlignment = alignment
        
        self.backgroundColor = UIColor.color(light: .white, dark: .clear)
        self.textColor = color
        self.font = .systemFont(ofSize: 16, weight: .medium)
        
        self.layer.cornerRadius = 16
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
                
        switch type {
        case .password:
            self.textContentType = .password
            self.isSecureTextEntry = true
            isPasswordTF = true
            
            let passwordIcon = UIImage(named: "password")?.withTintColor(color, renderingMode: .alwaysOriginal)
            let eyesIcon = UIImage(named: "eyes")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            setTextFieldIcon(icon: passwordIcon)
            setShowPasswordButton(icon: eyesIcon)
            
        case .name:
            self.textContentType = .name
            
            let nameIcon = UIImage(named: "user")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            setTextFieldIcon(icon: nameIcon)
            
        case .number:
            self.textContentType = .telephoneNumber
            self.keyboardType = .numberPad
            
            let phoneIcon = UIImage(named: "phone")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            if icon {
                setTextFieldIcon(icon: phoneIcon)
            } else {
                needNumberIcon = false
            }
            
        case .email:
            self.textContentType = .emailAddress
            self.keyboardType = .emailAddress
            
            let mailIcon = UIImage(named: "mail")?.withTintColor(color, renderingMode: .alwaysOriginal)
            
            setTextFieldIcon(icon: mailIcon)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func setTextFieldIcon(icon: UIImage?) {
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
    
    private func setShowPasswordButton(icon: UIImage?) {
        guard let icon = icon else { return }
        let button = UIButton()
        
        button.setImage(icon, for: .normal)
        self.addSubview(button)
        
        button.snp.makeConstraints {make -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-24)
            make.width.height.equalTo(24)
        }
    }
}
