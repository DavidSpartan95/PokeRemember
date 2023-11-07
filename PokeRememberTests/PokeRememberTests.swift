//
//  PokeRememberTests.swift
//  PokeRememberTests
//
//  Created by David Ulvan on 2023-10-09.
//

import XCTest
@testable import PokeRemember


final class PokeRememberTests: XCTestCase {
    
    private var game: FlashCardGame!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        game = FlashCardGame(deckToStudy: kantoDeck)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }
    
    func testGame(){
        
    }

    func testCheckAnswerCorrect() {
    
        let pokemon1 = PokemonEntry(name: "Bulbasaur", urlPicture: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png", dexNo:1)
        let pokemon2 = PokemonEntry(name: "Ivysaur", urlPicture: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/2.png", dexNo:2)
        let pokemon3 = PokemonEntry(name: "Venusaur", urlPicture: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/3.png", dexNo:3)
        let pokemon4 = PokemonEntry(name: "Charmander", urlPicture: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png", dexNo: 4)
        let game = FlashCardGame(deckToStudy: [pokemon1, pokemon2, pokemon3, pokemon4])
            
        let correctAnswer = game.choices.first!
        game.checkAwnser(awsner: correctAnswer)
            
        XCTAssertEqual(game.score, 1)
        XCTAssertFalse(game.gameOver)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
