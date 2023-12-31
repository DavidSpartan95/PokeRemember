//
//  RegisterPage.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-16.
//

import SwiftUI
import Firebase

struct RegisterPage: View {
    
    @State var email = ""
    @State var password = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View{
        GeometryReader { geometry in
            VStack {
               
                Text("Sign Up")
                    .font(.system(size: 36).bold())
                    .foregroundColor(.white)
                    //.frame(width: geometry.size.width*0.33, height: geometry.size.height*0.1)
            
                TextField("Email", text: $email)
                    .foregroundColor(textColor)
                    .textFieldStyle(.plain)
                    .frame(width: geometry.size.width*0.80)
                Rectangle()
                    .frame(width: geometry.size.width*0.80, height:1)
                    .foregroundColor(textColor)
                
                Spacer().frame(height: 20)
                
                SecureField("Password", text: $password)
                    .foregroundColor(textColor)
                    .textFieldStyle(.plain)
                    .frame(width: geometry.size.width*0.80)
                Rectangle()
                    .frame(width: geometry.size.width*0.80, height:1)
                    .foregroundColor(textColor)
                
                Spacer().frame(height: 20)
                
                ActionButton(title: "COMPLETE"){
                    register(email: email, password: password){success in
                        
                        if success {
                            dismiss()
                        }else {
                            print("Failed to sign in")
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .alignmentGuide(HorizontalAlignment.center) { $0[.leading] }
            .background(primaryColor)
        }
    }
}
