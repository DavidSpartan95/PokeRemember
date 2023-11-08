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
    
    private var listener: ListenerRegistration?
        
        init() {
            
        }
        
        func fetchUser() {
            let db = Firestore.firestore()
            let ref = db.collection("UserData")
            listener = ref.addSnapshotListener { (querySnapshot, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                if let snapshot = querySnapshot, !snapshot.isEmpty {
                    
                    if let userSpesificData = snapshot.documents.first(where: {$0.documentID == self.userUID}){
                        let data = userSpesificData
                        
                        let name = data["name"] as? String ?? ""
                        let age = data["age"] as? Int ?? 0
                        let kanto_score = data["kanto_score"] as? Int ?? 0
                        let johto_score = data["johto_score"] as? Int ?? 0
                        let hoenn_score = data["hoenn_score"] as? Int ?? 0
                        let sinnoh_score = data["sinnoh_score"] as? Int ?? 0
                        let unova_score = data["unova_score"] as? Int ?? 0
                        let kalos_score = data["kalos_score"] as? Int ?? 0
                        let alola_score = data["alola_score"] as? Int ?? 0
                        let galar_score = data["galar_score"] as? Int ?? 0
                        
                        let updatedUser = UserData(
                            name: name,
                            age: age,
                            kanto_score: kanto_score,
                            johto_score: johto_score,
                            hoenn_score: hoenn_score,
                            sinnoh_score: sinnoh_score,
                            unova_score: unova_score,
                            kalos_score: kalos_score,
                            alola_score: alola_score,
                            galar_score: galar_score
                        )
                        self.user = updatedUser
                    }
                }
            }
        }
        
        deinit {
            listener?.remove()
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
    
    func updateScore(deckName:String, score: Int, userUID: String) {
           
            let db = Firestore.firestore()
            let ref = db.collection("UserData").document(userUID)
            
            // Create a dictionary with the field you want to update
            let dataToUpdate = [deckName: score]
            
            // Use the updateData method to update only the specified fields
            ref.updateData(dataToUpdate) { error in
                if let error = error {
                    print("Error updating Score: \(error.localizedDescription)")
                } else {
                    print("Score updated successfully")
                }
            }
        }
    }

