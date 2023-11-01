//
//  InfoViewComponents.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-11-01.
//

import SwiftUI

struct TypeEmblem: View {
    let type: String
    
    var body: some View {
        
        let screen = UIScreen.main.bounds
        let buttonWidth = screen.width * 0.3
        
        Text(type.uppercased())
            .bold()
            .frame(width: buttonWidth)
            .foregroundColor(.white)
            .padding()
            .background(getColorForPokemonType(typeName: type))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.black, lineWidth: 2)
            )
    }
}
