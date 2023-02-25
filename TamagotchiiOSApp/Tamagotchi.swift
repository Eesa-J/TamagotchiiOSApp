//
//  Tamagotchi.swift
//  TamagotchiiOSApp
//
//  Created by Jaswal, Eesa (SPH) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
    private let name: String
    @Published private var hunger: Int
    @Published private var weight: Double
    @Published private var age: Int
    @Published private var happiness: Int
    @Published private var isSick: Bool
    @Published private var isDead: Bool
    @Published private var needsCleaning: Bool
    
    init() {
        self.name = "Leo"
        self.hunger = 5
        self.weight = 5.0
        self.age = 0
        self.happiness = 5
        self.isSick = false
        self.isDead = false
        self.needsCleaning = false
        
    }
    
    func displayStats() -> String {
        let statsDisplay = """
                            Name: \(name)
                            Age: \(age)
                            Happiness: \(happiness)
                            Weight: \(weight)
                            Hunger: \(hunger)
                            Needs cleaning: \(needsCleaning)
                            Needs medicine: \(isSick)
                            """
        return statsDisplay
    }
    
    func getName() -> String {
        return name
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
        if hunger + newHunger < 0 {
            hunger = 0
        }
        else if hunger + newHunger > 10 {
            hunger = 10
        }
        else {
            hunger += newHunger
        }
    }
    
    func getWeight() -> Double {
        return weight
    }
    func changeWeight(newWeight: Double) {
        if weight + newWeight < 0 {
            weight = 0
        }
        else {
            weight += newWeight
        }
    }

    func getAge() -> Int {
        return age
    }
    
    func changeAge(newAge: Int) {
        if isDead == false {
            age += newAge
        }
    }
    
    func getHappiness() -> Int {
        return happiness
    }
    func changeHappiness(newHappiness: Int) {
        if happiness + newHappiness > 10 {
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
        return needsCleaning
    }
    func changeNeedsToExcrete() {
        if needsCleaning == false {
            needsCleaning = true
        }
        else {
            needsCleaning = false
        }
    }
}

