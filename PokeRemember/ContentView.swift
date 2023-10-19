//
//  ContentView.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-09.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    @State var userIsLoggedIn = false
    
    
    var body: some View {
        
        if !userIsLoggedIn {
            NavigationStack{
                LogInPage(logedIn: $userIsLoggedIn)
            }.onAppear{
                Auth.auth().addStateDidChangeListener{ auth, user in
                    if let user = user {
                        dataManager.userUID = user.uid
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }else {
            NavigationStack{
                PokemonListPage(logedIn: $userIsLoggedIn).environmentObject(dataManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

