//
//  Buttons.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-23.
//

import Foundation

import SwiftUI

struct ActionButton: View {
    
    var title: String
    var action: () -> Void// A function that takes no parameters and returns void
    
    var body: some View {
        
        let screen = UIScreen.main.bounds
        let buttonWidth = screen.width * 0.3 // 90% of the screen width
        //let buttonHeight = screen.height * 0.1 // 10% of the screen height
        
        return Button(action: {
            self.action() // Call the provided function when the button is pressed
        }) {
           
            Text(title)
                .bold()
                .frame(width: buttonWidth)
                .foregroundColor(textColor)
                .padding()
                .background(secondaryColor)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                    .stroke(highlightColor, lineWidth: 4)
                )
        }
    }
}
