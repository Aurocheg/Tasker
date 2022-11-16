//
//  String + Extension.swift
//  Tasker
//
//  Created by Aurocheg on 14.11.22.
//

import Foundation

enum TextFieldType {
    case email
    case password
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func isValidTextField(type: TextFieldType) -> Bool {
        switch type {
            case .email:
                let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
                return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
            case .password:
                let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$", options: .caseInsensitive)
            return (regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil)
        }
        

    }
    
    func generatePassword() -> String {
        let len = 16
        let passwordCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        let password = String((0..<len).compactMap{ _ in passwordCharacters.randomElement() })
        return password
    }
}
