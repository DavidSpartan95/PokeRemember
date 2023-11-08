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
    
    //TODO make this a nil on defult, and show a loading screen while wiating for dataManager
    
    @State var userIsLoggedIn = false
    
    
    var body: some View {
        
        if !userIsLoggedIn {
            NavigationStack{
                LogInPage(logedIn: $userIsLoggedIn)
            }.onAppear{
                Auth.auth().addStateDidChangeListener{ auth, user in
                    if let user = user {
                        //TODO when we get a user.uid then we should fetch
                        dataManager.userUID = user.uid
                        dataManager.fetchUser()
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }else {
            NavigationStack{
                MenuView(logedIn: $userIsLoggedIn)
            }
        }
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/

