//
//  ContentView.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-09.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var userIsLoggedIn = false
    
    var body: some View {
        
        if !userIsLoggedIn {
            NavigationStack{
                LogInPage()
            }.onAppear{
                Auth.auth().addStateDidChangeListener{ auth, user in
                    if let user = user {
                        userIsLoggedIn.toggle()
                    }
                    
                }
            }
        }else {
            NavigationStack{
                PokemonListPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

