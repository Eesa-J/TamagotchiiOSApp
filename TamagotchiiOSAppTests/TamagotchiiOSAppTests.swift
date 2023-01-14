//
//  TamagotchiiOSAppTests.swift
//  TamagotchiiOSAppTests
//
//  Created by Jaswal, Eesa (SPH) on 14/01/2023.
//

import XCTest
@testable import TamagotchiiOSApp

class TamagotchiTest: XCTestCase {

    func testWhenICreateATamagotchiItsHungerIsInitialisedTo0() {
        //arrange
        let expectedHunger = 0
        
        //act
        let tamagotchi = Tamagotchi()
        
        //assert
        XCTAssertEqual(expectedHunger, tamagotchi.getHunger())
        
    }

    func testWhenICreateATamagotchiItsWeightIsInitialisedTo1() {
        //arrange
        let expectedWeight = 1.0

        //act
        let tamagotchi = Tamagotchi()
        
        //assert
        XCTAssertEqual(expectedWeight, tamagotchi.getWeight())
    }

    func testWhenICreateATamagotchiItsAgeIsInitialisedTo0() {
        //arrange
        let expectedAge = 0

        //act
        let tamagotchi = Tamagotchi()
        
        //assert
        XCTAssertEqual(expectedAge, tamagotchi.getAge())
    }
    
    func testWhenICreateATamagotchiItsHappinessIsInitialisedTo5() {
        //arrange
        let expectedHappiness = 5

        //act
        let tamagotchi = Tamagotchi()
        
        //assert
        XCTAssertEqual(expectedHappiness, tamagotchi.getHappiness())
    }
    
    func testWhenICreateATamagotchiIsDeadIsInitialisedToFalse() {
        //arrange
        let expectedIsDead = false
        //act
        let tamagotchi = Tamagotchi()
        
        //assert
        XCTAssertEqual(expectedIsDead, tamagotchi.getIsDead())
    }
    
    func testWhenICreateATamagotchiIsSickIsInitialisedToFalse() {
        //arrange
        let expectedIsSick = false
        //act
        let tamagotchi = Tamagotchi()
        
        //assert
        XCTAssertEqual(expectedIsSick, tamagotchi.getIsSick())
    }
    
    func testWhenICreateATamagotchINeedsToExcreteIsInitialisedToFalse() {
        //arrange
        let expectedNeedsToExcrete = false
        //act
        let tamagotchi = Tamagotchi()
        
        //assert
        XCTAssertEqual(expectedNeedsToExcrete, tamagotchi.getNeedsToExcrete())
    }
}
