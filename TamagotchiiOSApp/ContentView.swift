//
//  ContentView.swift
//  TamagotchiiOSApp
//
//  Created by Jaswal, Eesa (SPH) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi()
    
    var body: some View {
        Form {
            VStack {
                Text("\(tamagotchi.displayStats())")
            }
            Section {
                Button("Feed \(tamagotchi.name)", action: {
                    tamagotchi.changeHunger(newHunger: 1)
                    tamagotchi.changeWeight(newWeight: 0.5)
                })
                Button("Play with \(tamagotchi.name)", action: {
                    tamagotchi.changeHappiness(newHappiness: 2)
                    tamagotchi.changeWeight(newWeight: -0.5)
                    tamagotchi.changeHunger(newHunger: -1)
                })
                Button("Feed \(tamagotchi.name)", action: {
                    tamagotchi.changeHunger(newHunger: 1)
                    tamagotchi.changeWeight(newWeight: 0.5)
                })
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
