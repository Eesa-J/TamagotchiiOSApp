//
//  ContentView.swift
//  TamagotchiiOSApp
//
//  Created by Jaswal, Eesa (SPH) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi()
    
    @State private var ageRemainingTime = 60
    @State private var mealCooldownTime = 10
    @State private var snackCooldownTime = 10
    @State private var playCooldownTime = 10
    
    @State private var mealBinding = false
    @State private var snackBinding = false
    @State private var playBinding = false
    @State private var cleanBinding = true
    @State private var cureBinding = true
    
    let timer = Timer.publish(every:1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Form {
            if tamagotchi.getIsDead() == false {
                VStack {
                    Spacer()
                    Text("\(tamagotchi.displayStats())").font(.title)
                    Text("\(tamagotchi.getName()) has died at the age of \(tamagotchi.getAge())").font(.title)
                    Spacer()
                }
            } else {
                Section {
                    Text("\(tamagotchi.getName())").font(.title)
                    Text("\(tamagotchi.displayStats())")
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
                                  self.mealCooldownTime = 10
                              }
                          }
                        if self.mealBinding == true {
                                Text("Cooldown: \(mealCooldownTime)").foregroundColor(.red)
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
                                  self.snackCooldownTime = 10
                              }
                          }
                        if self.snackBinding == true{
                                Text("Cooldown: \(snackCooldownTime)").foregroundColor(.red)
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Button("Play with \(tamagotchi.getName())", action: {
                            tamagotchi.changeHappiness(newHappiness: 2)
                            tamagotchi.changeWeight(newWeight: -1)
                            tamagotchi.changeHunger(newHunger: 3)
                            self.playBinding = true
                        }).tint(.black)
                          .disabled(playBinding)
                          .onReceive(timer) { _ in
                              if self.playCooldownTime > -1 && self.playBinding == true {
                                  self.playCooldownTime -= 1
                              }
                              if self.playCooldownTime == -1 {
                                  self.playBinding = false
                                  self.playCooldownTime = 10
                              }
                          }
                        if self.playBinding == true{
                                Text("Cooldown: \(playCooldownTime)").foregroundColor(.red)
                        }
                    }
                    
                    Button("Clean \(tamagotchi.getName())", action: {
                        tamagotchi.changeNeedsToExcrete()
                    }).tint(.black)
                      .disabled(cleanBinding)
                    
                    Button("Cure \(tamagotchi.getName())", action: {
                        tamagotchi.changeIsSick()
                    }).tint(.black)
                      .disabled(cureBinding)
                    
                }
                
                Section {
                    Text("Time until Leo's birthday:  \(ageRemainingTime)")
                        .onReceive(timer) { _ in
                            if self.ageRemainingTime > -1 && tamagotchi.getIsDead() == false {
                                self.ageRemainingTime -= 1
                            }
                            if self.ageRemainingTime == -1 {
                                tamagotchi.changeAge(newAge: 1)
                                self.ageRemainingTime = 60
                            }
                        }
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.pink, .purple, .black],
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
