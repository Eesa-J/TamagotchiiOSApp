//
//  Tamagotchi.swift
//  TamagotchiiOSApp
//
//  Created by Jaswal, Eesa (SPH) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
    let name: String
    @Published private var hunger: Int
    @Published private var weight: Double
    @Published private var age: Int
    @Published private var happiness: Int
    private var isSick: Bool
    private var isDead: Bool
    private var needsToExcrete: Bool
    
    init() {
        self.name = "Leo"
        self.hunger = 0
        self.weight = 1.0
        self.age = 0
        self.happiness = 5
        self.isSick = false
        self.isDead = false
        self.needsToExcrete = false
        
    }
    
    func displayStats() -> String {
        let statsDisplay = """
                            Name: \(name)
                            Age: \(age)
                            Happiness: \(happiness)
                            Weight: \(weight)
                            Hunger: \(hunger)
                            """
        return statsDisplay
    }
    
    func eatSnack() {
        changeHunger(newHunger: -1)
        changeWeight(newWeight: 0.5)
    }
    
    func eatMeal() {
        changeHunger(newHunger: -2)
        changeWeight(newWeight: 1)
    }
    

    func getHunger() -> Int {
        return hunger
    }
    func changeHunger(newHunger: Int) {
        if hunger + newHunger > 10 {
            hunger = 10
        }
        else if hunger + newHunger < 0 {
            hunger = 0
        }
        else {
            hunger += newHunger
        }
    }
    
    func getWeight() -> Double {
        return weight
    }
    func changeWeight(newWeight: Double) {
        if newWeight < 0 {
            weight = 0
        }
        else {
            weight = weight + newWeight
        }
    }

    func getAge() -> Int {
        return age
    }
    func changeAge(newAge: Int) {
        if newAge > age && isDead == false {
            age = age + newAge
        }
    }
    
    func getHappiness() -> Int {
        return happiness
    }
    func changeHappiness(newHappiness: Int) {
        if newHappiness > 10 {
            happiness = 10
        }
        else if newHappiness < 0 {
            happiness = 0
        }
        else {
            happiness = happiness + newHappiness
        }
    }

    func getIsSick() -> Bool {
        return isSick
    }
    func changeIsSick() {
        if isSick == false {
            isSick = true
        }
        else {
            isSick = false
        }
    }
    
    func getIsDead() -> Bool {
        return isDead
    }
    func changeIsDead() {
        if isDead == false {
            isDead = true
        }
        else {
            isDead = false
        }
    }
    
    func getNeedsToExcrete() -> Bool {
        return needsToExcrete
    }
    func changeNeedsToExcrete() {
        if needsToExcrete == false {
            needsToExcrete = true
        }
        else {
            needsToExcrete = false
        }
    }
}

