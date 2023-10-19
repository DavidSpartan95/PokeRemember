//
//  DataManager.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-19.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    @Published var user: UserData? = nil
    @Published var userUID: String? = nil
    
    init(){
        fetchUser()
    }
    
    func fetchUser() {
        let db = Firestore.firestore()
        let ref = db.collection("UserData")
        ref.getDocuments{snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                let data = snapshot.documents[0]
                
                let name = data["name"] as? String ?? ""
                let age = data ["data"] as? Int ?? 0
                
                let user = UserData(name: name, age:age)
                self.user = user
            }
        }
    }
    
    func addUserData(name: String, age: Int, userUID: String){
        let db = Firestore.firestore()
        let ref = db.collection("UserData").document(userUID)
        ref.setData(["name": name, "age": age]){ error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func updateAge(age: Int, userUID: String) {
        let db = Firestore.firestore()
        let ref = db.collection("UserData").document(userUID)
        
        // Create a dictionary with the field you want to update
        let dataToUpdate = ["age": age]
        
        // Use the updateData method to update only the specified fields
        ref.updateData(dataToUpdate) { error in
            if let error = error {
                print("Error updating age: \(error.localizedDescription)")
            } else {
                print("Age updated successfully")
            }
        }
    }
}
