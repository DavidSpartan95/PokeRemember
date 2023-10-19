//
//  LoginPage.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-16.
//

import SwiftUI
import Firebase
struct LogInPage: View {
    
    @State private var email = ""
    @State private var password = ""
    @Binding var logedIn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("LogIn")
                    .font(.system(size: 36).bold())
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width*0.33, height: geometry.size.height*0.1)
            
                TextField("Email", text: $email)
                    .frame(width: geometry.size.width*0.33, height: geometry.size.height*0.05).background(.white)
                
                SecureField("Password", text: $password)
                    .frame(width: geometry.size.width*0.33, height: geometry.size.height*0.05).background(.white)
                Button("LOG IN", action: {
    
                    login(email: email, password: password) { success in
                        if success {
                            logedIn = true
                        } else {
                            print("Failed to log in")
                        }
                    }

                })
                NavigationLink(destination: RegisterPage(), label: {
                    Text("Register account").bold().padding().foregroundColor(.black)
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .alignmentGuide(HorizontalAlignment.center) { $0[.leading] }
            .background(Color.red)
        }
    }
}



