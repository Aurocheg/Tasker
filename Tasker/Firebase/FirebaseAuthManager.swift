//
//  FirebaseAuthManager.swift
//  Tasker
//
//  Created by Aurocheg on 14.11.22.
//

import FirebaseAuth

final class FirebaseAuthManager {
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
