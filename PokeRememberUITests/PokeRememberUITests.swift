//
//  PokeRememberUITests.swift
//  PokeRememberUITests
//
//  Created by David Ulvan on 2023-10-09.
//

import XCTest

final class PokeRememberUITests: XCTestCase {

    func testMenuScreenWhenLoggedIn(){
        let app = XCUIApplication()
        app.launch()
        
        let menuView = app.staticTexts["Title"]
        let signOutButton = app.buttons["SignOutButton"]
        let playButton = app.buttons["PlayButton"]
        let pokedexButton = app.buttons["PokedexButton"]
        let planYourStudyButton = app.buttons["PlanYourStudyButton"]
            
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
            XCTAssert(menuView.exists)
            XCTAssert(signOutButton.exists)
            XCTAssert(playButton.exists)
            XCTAssert(pokedexButton.exists)
            XCTAssert(planYourStudyButton.exists)
            
            
        }

    }
}
