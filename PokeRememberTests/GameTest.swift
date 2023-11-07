//
//  GameTest.swift
//  PokeRememberTests
//
//  Created by David Ulvan on 2023-11-07.
//

import XCTest

class FlashCardGameTests: XCTestCase {

    func testCheckAnswerCorrect() {
        let pokemon1 = PokemonEntry(name: "Pikachu")
        let pokemon2 = PokemonEntry(name: "Charizard")
        let pokemon3 = PokemonEntry(name: "Bulbasaur")
        
        let game = FlashCardGame(deckToStudy: [pokemon1, pokemon2, pokemon3])
        
        let correctAnswer = game.choices.first!
        game.checkAnswer(answer: correctAnswer)
        
        XCTAssertEqual(game.score, 1)
        XCTAssertFalse(game.gameOver)
    }

    func testCheckAnswerIncorrect() {
        let pokemon1 = PokemonEntry(name: "Pikachu")
        let pokemon2 = PokemonEntry(name: "Charizard")
        let pokemon3 = PokemonEntry(name: "Bulbasaur")
        
        let game = FlashCardGame(deckToStudy: [pokemon1, pokemon2, pokemon3])
        
        let incorrectAnswer = "Squirtle" // Assuming this is not in the choices
        game.checkAnswer(answer: incorrectAnswer)
        
        XCTAssertEqual(game.score, 0)
        XCTAssertTrue(game.gameOver)
    }

    func testShuffleDeck() {
        let pokemon1 = PokemonEntry(name: "Pikachu")
        let pokemon2 = PokemonEntry(name: "Charizard")
        let game = FlashCardGame(deckToStudy: [pokemon1, pokemon2])
        
        let initialDeckCount = game.cardsLeft
        let initialChoices = game.choices
        
        game.shuffleDeck(removeCard: "Pikachu")
        
        XCTAssertNotEqual(initialDeckCount, game.cardsLeft)
        XCTAssertNotEqual(initialChoices, game.choices)
    }
}

