//
//  ContentView.swift
//  TamagotchiiOSApp
//
//  Created by Jaswal, Eesa (SPH) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi()
    let oldAge = Int.random(in: 5...10)
    
    @State private var ageRemainingTime = 15
    @State private var mealCooldownTime = 5
    @State private var snackCooldownTime = 5
    @State private var playCooldownTime = 5
    @State private var cleanCountdownTime = Int.random(in: 3...5)
    @State private var cureCountdownTime = Int.random(in: 3...7)
    
    @State private var mealBinding = false
    @State private var snackBinding = false
    @State private var playBinding = false
    @State private var cleanBinding = true
    @State private var cureBinding = true
    
    let timer = Timer.publish(every:1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Form {
            
            if tamagotchi.getIsDead() == true {
                HStack() {
                    Spacer()
                    VStack(alignment: .center , spacing: 20) {
                        Text("\(tamagotchi.getName()) has died!").font(.largeTitle)
                        Text("Cause of death: \(tamagotchi.getCauseOfDeath())").font(.title3)
                        Text("\(tamagotchi.displayStats())").font(.title3)
                    }
                    Spacer()
                }
                
            } else {
                Section {
                    Text("\(tamagotchi.getName())").font(.title)
                    Text("\(tamagotchi.displayStats())")
                }
                
                Section {
                    if tamagotchi.getIsSick() == true {
                        Text("\(tamagotchi.getName()) is sick!").foregroundColor(.red)
                    } else {
                        Text("\(tamagotchi.getName()) is not ill!").foregroundColor(.green)
                    }
                    
                    if tamagotchi.getNeedsCleaning() == true {
                        Text("\(tamagotchi.getName()) went to the toilet!").foregroundColor(.red)
                    } else {
                        Text("\(tamagotchi.getName()) is clean!").foregroundColor(.green)
                    }
                }
                
                Section {
                    
                    HStack(alignment: .center) {
                        Button("Feed meal to \(tamagotchi.getName())", action: {
                            tamagotchi.changeHunger(newHunger: -2)
                            tamagotchi.changeWeight(newWeight: 1.0)
                            self.mealBinding = true
                        }).tint(.black)
                          .disabled(mealBinding)
                          .onReceive(timer) { _ in
                              if self.mealCooldownTime > -1 && self.mealBinding == true {
                                  self.mealCooldownTime -= 1
                              }
                              if self.mealCooldownTime == -1 {
                                  self.mealBinding = false
                                  self.mealCooldownTime = 5
                              }
                          }
                        if self.mealBinding == true {
                                Text("Cooldown: \(mealCooldownTime)").foregroundColor(.orange)
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Button("Feed snack to \(tamagotchi.getName())", action: {
                            tamagotchi.changeHunger(newHunger: -1)
                            tamagotchi.changeWeight(newWeight: 0.5)
                            self.snackBinding = true
                        }).tint(.black)
                          .disabled(snackBinding)
                          .onReceive(timer) { _ in
                              if self.snackCooldownTime > -1 && self.snackBinding == true {
                                  self.snackCooldownTime -= 1
                              }
                              if self.snackCooldownTime == -1 {
                                  self.snackBinding = false
                                  self.snackCooldownTime = 5
                              }
                          }
                        if self.snackBinding == true{
                                Text("Cooldown: \(snackCooldownTime)").foregroundColor(.orange)
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Button("Play with \(tamagotchi.getName())", action: {
                            tamagotchi.changeHappiness(newHappiness: 2)
                            tamagotchi.changeWeight(newWeight: -2)
                            tamagotchi.changeHunger(newHunger: 4)
                            self.playBinding = true
                        }).tint(.black)
                          .disabled(playBinding)
                          .onReceive(timer) { _ in
                              if self.playCooldownTime > -1 && self.playBinding == true {
                                  self.playCooldownTime -= 1
                              }
                              if self.playCooldownTime == -1 {
                                  self.playBinding = false
                                  self.playCooldownTime = 5
                              }
                          }
                        if self.playBinding == true{
                                Text("Cooldown: \(playCooldownTime)").foregroundColor(.orange)
                        }
                    }
                    
                    Button("Clean \(tamagotchi.getName())", action: {
                        cleanCountdownTime = Int.random(in: 3...5)
                        tamagotchi.changeNeedsCleaning(value: false)
                        cleanBinding = true
                    }).tint(.black)
                      .disabled(cleanBinding)
                      .onReceive(timer) { _ in
                          let hasExcreted = Int.random(in: 1...10)
                          if hasExcreted == 1 {
                              cleanBinding = false
                              tamagotchi.changeNeedsCleaning(value: true)
                          }
                          if self.cleanCountdownTime > -1 && cleanBinding == false {
                              self.cleanCountdownTime -= 1
                          }
                          if self.cleanCountdownTime == -1 {
                              cleanCountdownTime = Int.random(in: 3...5)
                              cureBinding = false
                              tamagotchi.changeIsSick(value: true)
                          }
                      }
                    
                    Button("Cure \(tamagotchi.getName())", action: {
                        cureCountdownTime = Int.random(in: 3...7)
                        tamagotchi.changeIsSick(value: false)
                        cureBinding = true
                    }).tint(.black)
                      .disabled(cureBinding)
                      .onReceive(timer) { _ in
                          let becomeIll = Int.random(in: 1...15)
                          if becomeIll == 1 {
                              cureBinding = false
                              tamagotchi.changeIsSick(value: true)
                          }
                          if self.cureCountdownTime > -1 && cureBinding == false {
                              self.cureCountdownTime -= 1
                          }
                          if self.cureCountdownTime == -1 {
                              cureCountdownTime = 999999999999
                              cureBinding = true
                              tamagotchi.changeCauseOfDeath(cause: "disease")
                              tamagotchi.changeIsDead()
                          }
                      }
                }
                
                Section {
                    Text("Time until Leo's birthday:  \(ageRemainingTime)")
                        .onReceive(timer) { _ in
                            if self.ageRemainingTime > -1 && tamagotchi.getIsDead() == false {
                                self.ageRemainingTime -= 1
                            }
                            if self.ageRemainingTime == -1 {
                                tamagotchi.changeAge(newAge: 1)
                                self.ageRemainingTime = 15
                                if tamagotchi.getAge() == oldAge {
                                    tamagotchi.changeCauseOfDeath(cause: "old age")
                                    tamagotchi.changeIsDead()
                                }
                            }
                        }
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.pink, .teal],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
