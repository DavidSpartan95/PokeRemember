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
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.black, lineWidth: 2)
            )
    }
}
struct DataWindow: View {
    
    let text:String
    let color: Color?
    
    var body: some View {
        let screen = UIScreen.main.bounds
        let WindowWidth = screen.width * 0.3
        
        Text(text)
            .bold()
            .frame(minWidth:WindowWidth)
            .foregroundColor(.white)
            .padding()
            .background(color ?? Color.white.opacity(0.5))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}
struct StatDisplayView: View {
    
    let stats: [Stat]
    let statColors = [Color.red.opacity(0.9), Color.orange.opacity(0.9), Color.yellow.opacity(0.9), Color.blue.opacity(0.9), Color.green.opacity(0.9), Color.pink.opacity(0.9)]
    var body: some View {
        let screen = UIScreen.main.bounds
        let WindowWidth = screen.width * 0.3
        
        ForEach(Array(stats.enumerated()), id: \.offset ){ index,stat in
            let text = "\(stat.name): \(stat.base_stat)"
            DataWindow(text:text, color: statColors[index])
        }
    }
}
