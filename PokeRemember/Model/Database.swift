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
            Auth.auth().addStateDidChangeListener{ auth, user in
                if let user = user {
                    addUserData(name: "Test", age: 18, userUID: user.uid)
                    }
                }
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

func addUserData(name: String, age: Int, userUID: String) {
    let db = Firestore.firestore()
    let ref = db.collection("UserData").document(userUID)
    
    let userData = UserData(
        name: name,
        age: age,
        kanto_score: 0,
        johto_score: 0,
        hoenn_score: 0,
        sinnoh_score: 0,
        unova_score: 0,
        kalos_score: 0,
        alola_score: 0,
        galar_score: 0
    )
    
    let data: [String: Any] = [
        "name": userData.name,
        "age": userData.age,
        "kanto_score": userData.kanto_score,
        "johto_score": userData.johto_score,
        "hoenn_score": userData.hoenn_score,
        "sinnoh_score": userData.sinnoh_score,
        "unova_score": userData.unova_score,
        "kalos_score": userData.kalos_score,
        "alola_score": userData.alola_score,
        "galar_score": userData.galar_score
    ]
    
    ref.setData(data) { error in
        if let error = error {
            print("NOOOOOOOOOOOOOOOO")
            print(error.localizedDescription)
        }
    }
}
