//
//  Database.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-16.
//

import Foundation
import Firebase

func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
        if let error = error {
            print(error.localizedDescription)
            completion(false) // Call the completion handler with false on login failure
        } else {
            completion(true) // Call the completion handler with true on successful login
        }
    }
}

func register(email: String, password: String, completion: @escaping (Bool) -> Void){
    Auth.auth().createUser(withEmail: email, password: password){ result, error in
        if let error = error {
            print(error.localizedDescription)
            completion(false) // Call the completion handler with false on login failure
        } else {
            completion(true) // Call the completion handler with true on successful login
        }
    }
}
func logout() {
    do {
        try Auth.auth().signOut()
        // Successfully signed out
    } catch let error {
        // Handle the error, e.g., print it
        print("Error while signing out: \(error)")
    }
}

