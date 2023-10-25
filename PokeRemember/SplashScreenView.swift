//
//  SplashScreen.swift
//  PokeRemember
//
//  Created by David Ulvan on 2023-10-25.
//

import SwiftUI

struct SplashScreenView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var isActive = false
    @State private var size = 0.2
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            ContentView().environmentObject(dataManager)
        }else {
            VStack {
                VStack {
                    Image("Pokeball").resizable().frame(width: 150, height: 150)
                }.scaleEffect(size).opacity(opacity).onAppear{
                    withAnimation(.easeIn(duration:1.2)){
                        self.size = 1
                        self.opacity = 1.0
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(primaryColor).onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ){
                    self.isActive = true
                }
            }
        }
    }
}
