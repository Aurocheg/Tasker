//
//  AuthService.swift
//  Tasker
//
//  Created by Aurocheg on 2.12.22.
//

import FirebaseAuth

protocol AuthServiceProtocol {
    func createUser(email: String, password: String, completion: @escaping (_ success: Bool) -> Void)
}

final class AuthService: AuthServiceProtocol {
    func createUser(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            print(error)
            if let user = authResult?.user {
                print(user)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
