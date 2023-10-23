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
    var width: CGFloat
    var height: CGFloat
    var action: () -> Void // A function that takes no parameters and returns void
    var body: some View {
        return Button(action: {
            self.action() // Call the provided function when the button is pressed
        }) {
            Text(title)
                .frame(width: width, height: height)
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
    }
}

