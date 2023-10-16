//
//  Database.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-16.
//

import Foundation
import Firebase

func login(email: String, password: String){
    Auth.auth().signIn(withEmail: email, password: password){ result, error in
        if let error = error  {
            print(error.localizedDescription)
        }
    }
}

func register(email: String, password: String){
    Auth.auth().createUser(withEmail: email, password: password){ result, error in
        if let error = error  {
            print(error.localizedDescription)
        }
    }
}
